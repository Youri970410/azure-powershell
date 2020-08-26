@{
  GUID = '5b4d229c-75ce-450e-abe3-84ae87a6c416'
  RootModule = './Az.MySql.psm1'
  ModuleVersion = '0.1.0'
  CompatiblePSEditions = 'Core', 'Desktop'
  Author = 'Microsoft Corporation'
  CompanyName = 'Microsoft Corporation'
  Copyright = 'Microsoft Corporation. All rights reserved.'
  Description = 'Microsoft Azure PowerShell: MySql cmdlets'
  PowerShellVersion = '5.1'
  DotNetFrameworkVersion = '4.7.2'
  RequiredAssemblies = './bin/Az.MySql.private.dll'
  FormatsToProcess = './Az.MySql.format.ps1xml'
  FunctionsToExport = 'Get-AzMySqlConfiguration', 'Get-AzMySqlConnectionString', 'Get-AzMySqlFirewallRule', 'Get-AzMySqlReplica', 'Get-AzMySqlServer', 'Get-AzMySqlVirtualNetworkRule', 'New-AzMySqlFirewallRule', 'New-AzMySqlReplica', 'New-AzMySqlServer', 'New-AzMySqlVirtualNetworkRule', 'Remove-AzMySqlFirewallRule', 'Remove-AzMySqlServer', 'Remove-AzMySqlVirtualNetworkRule', 'Restart-AzMySqlServer', 'Restore-AzMySqlServer', 'Update-AzMySqlConfiguration', 'Update-AzMySqlFirewallRule', 'Update-AzMySqlServer', 'Update-AzMySqlVirtualNetworkRule', '*'
  AliasesToExport = '*'
  PrivateData = @{
    PSData = @{
      Tags = 'Azure', 'ResourceManager', 'ARM', 'PSModule', 'MySql'
      LicenseUri = 'https://aka.ms/azps-license'
      ProjectUri = 'https://github.com/Azure/azure-powershell'
      ReleaseNotes = ''
    }
  }
}
