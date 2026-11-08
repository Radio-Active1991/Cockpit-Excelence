param(
    [Parameter(Mandatory=$true)][string]$GamePath,
    [string]$HostDLL=(Join-Path $PSScriptRoot '../lib/FlyoutMFD.dll'),
    [string]$OutputPath=(Join-Path $PSScriptRoot 'demo-build/CockpitExcelenceSdkDemo.dll')
)
$ErrorActionPreference='Stop'
$taskFiles=@((Join-Path $PSScriptRoot 'DisplayProviderExample.cs'),(Join-Path $PSScriptRoot 'DisplayDemoMod.cs'))
& "$PSScriptRoot/../Compile-Mfd.ps1" -SourceFiles $taskFiles -AdditionalReferences @([IO.Path]::GetFullPath($HostDLL)) -GamePath $GamePath -OutputPath $OutputPath
Write-Output 'Optional synthetic demo built. Install it yourself only if you want to test example-mod/status; do not redistribute the host DLL or game libraries with your mod.'
