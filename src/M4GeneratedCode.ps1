param ([Switch]$Single, [String]$ResourceName)
$resourceArray = @()
$backUpFolder = (Join-Path $PSScriptRoot \backup)
Write-Host $backUpFolder
# Deleted backup folder
if (Test-Path -Path $backUpFolder)
{
    Remove-Item -Path $backUpFolder -Recurse -Force
}

# Get all resource under current folder.
foreach ($item in (Get-ChildItem)) {
    if($item -is [System.IO.DirectoryInfo])
    {
        $resourceArray += $item.Name
        # Write-Host $item.Name
    }
}
# Generate by resource
if ($Single)
{
    $resourceArray = @()
    $resourceArray += $ResourceName
} 
$resourceArray = @('AppConfiguration','Blockchain','ConnectedKubernetes','CustomProviders','DesktopVirtualization','Databricks','ImageBuilder','ImportExport','KubernetesConfiguration','Kusto','MariaDb','MonitoringSolutions','MySql','Portal','PostgreSql','TimeSeriesInsights')

# Create back up folder
New-Item -Path $backUpFolder -ItemType 'directory'
Copy-Item -Path (Join-Path $PSScriptRoot ('\readme.azure.md' )) -Destination (Join-Path $PSScriptRoot '\backup') -Recurse -Force
Copy-Item -Path (Join-Path $PSScriptRoot ('\readme.azure.noprofile.md' )) -Destination (Join-Path $PSScriptRoot '\backup') -Recurse -Force
Copy-Item -Path (Join-Path $PSScriptRoot ('\readme.md' )) -Destination (Join-Path $PSScriptRoot '\backup') -Recurse -Force

# Copy Resource folder to Backup folder
foreach ($resource in $resourceArray) {
    Copy-Item -Path (Join-Path $PSScriptRoot ('\' + $resource)) -Destination (Join-Path $PSScriptRoot '\backup') -Recurse -Force
}

#Generate code
foreach ($resource in $resourceArray) {
    Write-Host -ForegroundColor Green '---------------------------------'
    Write-Host -ForegroundColor Green "Generate resource: $($resource)"
    try
    {
        Set-Location -Path (Join-Path $PSScriptRoot ('\backup\' + $resource))
        autorest-beta --use:https://tinyurl.com/y3yhmrgq| Write-Information
        ./build-module.ps1

        # Delete docs folder of resource under src folder.
        Write-Host -ForegroundColor Green 'Delete docs folder of resource under src folder.'
        Remove-Item -Path (Join-Path $PSScriptRoot ('\' + $resource + '\docs')) -Recurse -Force
        # Copy docs of m4 generated to resource under src folder
        Write-Host -ForegroundColor Green 'Copy docs of m4 generated to resource under src folder.'
        Copy-Item -Path (Join-Path $PSScriptRoot ('\backup\' + $resource + '\docs' )) -Destination (Join-Path $PSScriptRoot ('\'+ $resource) ) -Recurse -Force
        Write-Host -ForegroundColor Green "Generated resource successfully: $($resource)"
    }
    catch
    {
        Write-Host -ForegroundColor Red "Generated resource failed: $($resource)"
        Write-Host -ForegroundColor Red $_
    }
    finally
    {
        Write-Host -ForegroundColor Green '---------------------------------'
    }
}

<# 
# Must manual delete folder
# Cause : Exception Cannot remove the item at '/src/backup' because it is in use.
Write-Host -ForegroundColor Green 'Delete backup folder'
if (Test-Path -Path $backUpFolder)
{
    Remove-Item -Path $backUpFolder
}
#>

Set-Location $PSScriptRoot