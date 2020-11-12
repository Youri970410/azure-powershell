$loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
if (-Not (Test-Path -Path $loadEnvPath)) {
    $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
}
. ($loadEnvPath)
$TestRecordingFile = Join-Path $PSScriptRoot 'Invoke-AzCostManagementQuery.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'Invoke-AzCostManagementQuery' {
    It 'UsageExpanded'  {
        Invoke-AzCostManagementQuery -Type Usage -Scope "subscriptions/$($env.SubscriptionId)" -DatasetGranularity 'Daily' -TimePeriodFrom $env.fromDate -TimePeriodTo $env.toDate -Timeframe Custom
    }

    It 'UsageExpanded1' -skip {
        Invoke-AzCostManagementQuery 
    }
}
