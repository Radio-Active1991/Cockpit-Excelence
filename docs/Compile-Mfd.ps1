param(
    [string]$SourceDirectory = "$PSScriptRoot\src",
    [string]$GamePath = 'N:\Program Files (x86)\Steam\steamapps\common\Flyout',
    [string]$OutputPath = "$PSScriptRoot\build\FlyoutMFD.dll",
    [string[]]$SourceFiles = @(),
    [string[]]$AdditionalReferences = @(),
    [switch]$CoreOnly,
    [switch]$Executable
)
$ErrorActionPreference = 'Stop'
$compilerDirectory = Split-Path ([psobject].Assembly.Location)
Add-Type -Path (Join-Path $compilerDirectory 'Microsoft.CodeAnalysis.dll')
Add-Type -Path (Join-Path $compilerDirectory 'Microsoft.CodeAnalysis.CSharp.dll')
$dotnetCommand = Get-Command dotnet -ErrorAction Stop
$runtimeBase = Join-Path (Split-Path $dotnetCommand.Source) 'shared\Microsoft.NETCore.App'
$runtime = Get-ChildItem -LiteralPath $runtimeBase -Directory | Where-Object { $_.Name -like '6.*' } | Sort-Object { [version]$_.Name } -Descending | Select-Object -First 1
if (-not $runtime) { throw '.NET 6 runtime is needed for compilation references.' }
$referenceFiles = [System.Collections.Generic.List[string]]::new()
foreach ($file in (Get-ChildItem -LiteralPath $runtime.FullName -Filter '*.dll')) { $referenceFiles.Add($file.FullName) }
if (-not $CoreOnly) {
    foreach ($file in (Get-ChildItem -LiteralPath (Join-Path $GamePath 'MelonLoader\Il2CppAssemblies') -Filter '*.dll')) { $referenceFiles.Add($file.FullName) }
    foreach ($library in @('MelonLoader.dll','0Harmony.dll','Il2CppInterop.Runtime.dll','Il2CppInterop.Common.dll')) { $referenceFiles.Add((Join-Path $GamePath "MelonLoader\net6\$library")) }
}
$references = [System.Collections.Generic.List[Microsoft.CodeAnalysis.MetadataReference]]::new()
foreach ($taskReference in $AdditionalReferences) { $referenceFiles.Add([IO.Path]::GetFullPath($taskReference)) }
foreach ($referencePath in $referenceFiles) {
    $peStream = [System.IO.File]::OpenRead($referencePath)
    $peReader = [System.Reflection.PortableExecutable.PEReader]::new($peStream)
    try { if ($peReader.HasMetadata) { $references.Add([Microsoft.CodeAnalysis.MetadataReference]::CreateFromFile($referencePath)) } } finally { $peReader.Dispose(); $peStream.Dispose() }
}
$trees = [System.Collections.Generic.List[Microsoft.CodeAnalysis.SyntaxTree]]::new()
$parseOptions = [Microsoft.CodeAnalysis.CSharp.CSharpParseOptions]::new([Microsoft.CodeAnalysis.CSharp.LanguageVersion]::CSharp10)
if ($SourceFiles.Count -eq 0) { $SourceFiles = @(Get-ChildItem -LiteralPath $SourceDirectory -Filter '*.cs' | Select-Object -ExpandProperty FullName) }
foreach ($sourcePath in $SourceFiles) { $trees.Add([Microsoft.CodeAnalysis.CSharp.CSharpSyntaxTree]::ParseText([System.IO.File]::ReadAllText($sourcePath),$parseOptions,$sourcePath,[System.Text.Encoding]::UTF8)) }
$kind = if ($Executable) { [Microsoft.CodeAnalysis.OutputKind]::ConsoleApplication } else { [Microsoft.CodeAnalysis.OutputKind]::DynamicallyLinkedLibrary }
$options = [Microsoft.CodeAnalysis.CSharp.CSharpCompilationOptions]::new($kind)
$options = $options.WithOptimizationLevel([Microsoft.CodeAnalysis.OptimizationLevel]::Release).WithAllowUnsafe($true).WithPlatform([Microsoft.CodeAnalysis.Platform]::X64).WithDeterministic($true)
$name = [System.IO.Path]::GetFileNameWithoutExtension($OutputPath)
$compilation = [Microsoft.CodeAnalysis.CSharp.CSharpCompilation]::Create($name,$trees,$references,$options)
$outputDirectory = Split-Path $OutputPath
New-Item -ItemType Directory -Path $outputDirectory -Force | Out-Null
$stream = [System.IO.File]::Create($OutputPath)
try { $result = $compilation.Emit($stream) } finally { $stream.Dispose() }
$result.Diagnostics | Where-Object { $_.Severity -in @([Microsoft.CodeAnalysis.DiagnosticSeverity]::Error,[Microsoft.CodeAnalysis.DiagnosticSeverity]::Warning) } | ForEach-Object { $_.ToString() }
if (-not $result.Success) { throw 'Compilation failed.' }
Write-Output "Build succeeded: $OutputPath"
if ($Executable) {
    $runtimeConfig = @{ runtimeOptions = @{ tfm = 'net6.0'; framework = @{ name = 'Microsoft.NETCore.App'; version = '6.0.0' } } } | ConvertTo-Json -Depth 5
    [System.IO.File]::WriteAllText([System.IO.Path]::ChangeExtension($OutputPath,'.runtimeconfig.json'),$runtimeConfig)
}
