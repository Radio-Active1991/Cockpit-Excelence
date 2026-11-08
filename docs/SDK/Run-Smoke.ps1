param([string]$HostDLL=(Join-Path $PSScriptRoot '../lib/FlyoutMFD.dll'),[string]$OutputDirectory=(Join-Path $PSScriptRoot 'smoke-results'))
$ErrorActionPreference='Stop'
$taskHost=[IO.Path]::GetFullPath($HostDLL)
$taskOut=[IO.Path]::GetFullPath($OutputDirectory)
New-Item -ItemType Directory -Path $taskOut -Force|Out-Null
$taskLocal=Join-Path $taskOut 'FlyoutMFD.dll'
if($taskHost -ne $taskLocal){Copy-Item -LiteralPath $taskHost -Destination $taskLocal}
$taskSources=@((Join-Path $PSScriptRoot 'DisplayProviderExample.cs'),(Join-Path $PSScriptRoot 'ConsumerSmoke.cs'))
$taskSources+=@(Get-ChildItem -LiteralPath (Join-Path $PSScriptRoot 'Examples') -Filter '*.cs' | Select-Object -ExpandProperty FullName)
$taskExe=Join-Path $taskOut 'ConsumerSmoke.dll'
& "$PSScriptRoot/../Compile-Mfd.ps1" -SourceFiles $taskSources -AdditionalReferences @($taskLocal) -CoreOnly -Executable -OutputPath $taskExe
& dotnet $taskExe
if($LASTEXITCODE -ne 0){throw 'Public SDK consumer failed.'}
