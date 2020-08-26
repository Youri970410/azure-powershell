@{
  GUID = '7b1c7be4-7c3c-438d-8200-1b58d6f3a769'
  RootModule = './Az.MariaDb.psm1'
  ModuleVersion = '0.1.0'
  CompatiblePSEditions = 'Core', 'Desktop'
  Author = 'Microsoft Corporation'
  CompanyName = 'Microsoft Corporation'
  Copyright = 'Microsoft Corporation. All rights reserved.'
  Description = 'Microsoft Azure PowerShell: MariaDb cmdlets'
  PowerShellVersion = '5.1'
  DotNetFrameworkVersion = '4.7.2'
  RequiredAssemblies = './bin/Az.MariaDb.private.dll'
  FormatsToProcess = './Az.MariaDb.format.ps1xml'
  FunctionsToExport = 'Get-AzMariaDbConfiguration', 'Get-AzMariaDbConnectionString', 'Get-AzMariaDbFirewallRule', 'Get-AzMariaDbReplica', 'Get-AzMariaDbServer', 'Get-AzMariaDbVirtualNetworkRule', 'New-AzMariaDbFirewallRule', 'New-AzMariaDbServer', 'New-AzMariaDbServerReplica', 'New-AzMariaDbVirtualNetworkRule', 'Remove-AzMariaDbFirewallRule', 'Remove-AzMariaDbServer', 'Remove-AzMariaDbVirtualNetworkRule', 'Restart-AzMariaDbServer', 'Restore-AzMariaDbServer', 'Update-AzMariaDbConfiguration', 'Update-AzMariaDbFirewallRule', 'Update-AzMariaDbServer', 'Update-AzMariaDbVirtualNetworkRule', '*'
  AliasesToExport = '*'
  PrivateData = @{
    PSData = @{
      Tags = 'Azure', 'ResourceManager', 'ARM', 'PSModule', 'MariaDb'
      LicenseUri = 'https://aka.ms/azps-license'
      ProjectUri = 'https://github.com/Azure/azure-powershell'
      ReleaseNotes = ''
    }
  }
}
