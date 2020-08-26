@{
  GUID = '8beb1543-2b94-49e1-8fd3-7322cb7bc8e4'
  RootModule = './Az.PostgreSql.psm1'
  ModuleVersion = '0.1.0'
  CompatiblePSEditions = 'Core', 'Desktop'
  Author = 'Microsoft Corporation'
  CompanyName = 'Microsoft Corporation'
  Copyright = 'Microsoft Corporation. All rights reserved.'
  Description = 'Microsoft Azure PowerShell: PostgreSql cmdlets'
  PowerShellVersion = '5.1'
  DotNetFrameworkVersion = '4.7.2'
  RequiredAssemblies = './bin/Az.PostgreSql.private.dll'
  FormatsToProcess = './Az.PostgreSql.format.ps1xml'
  FunctionsToExport = 'Get-AzPostgreSqlConfiguration', 'Get-AzPostgreSqlConnectionString', 'Get-AzPostgreSqlFirewallRule', 'Get-AzPostgreSqlReplica', 'Get-AzPostgreSqlServer', 'Get-AzPostgreSqlVirtualNetworkRule', 'New-AzPostgreSqlFirewallRule', 'New-AzPostgreSqlReplica', 'New-AzPostgreSqlServer', 'New-AzPostgreSqlVirtualNetworkRule', 'Remove-AzPostgreSqlFirewallRule', 'Remove-AzPostgreSqlServer', 'Remove-AzPostgreSqlVirtualNetworkRule', 'Restart-AzPostgreSqlServer', 'Restore-AzPostgreSqlServer', 'Update-AzPostgreSqlConfiguration', 'Update-AzPostgreSqlFirewallRule', 'Update-AzPostgreSqlServer', 'Update-AzPostgreSqlVirtualNetworkRule', '*'
  AliasesToExport = '*'
  PrivateData = @{
    PSData = @{
      Tags = 'Azure', 'ResourceManager', 'ARM', 'PSModule', 'PostgreSql'
      LicenseUri = 'https://aka.ms/azps-license'
      ProjectUri = 'https://github.com/Azure/azure-powershell'
      ReleaseNotes = ''
    }
  }
}
