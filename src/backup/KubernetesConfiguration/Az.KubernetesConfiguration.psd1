@{
  GUID = '7e09f771-1557-44a4-a7d1-3eb426f8b09d'
  RootModule = './Az.KubernetesConfiguration.psm1'
  ModuleVersion = '0.1.0'
  CompatiblePSEditions = 'Core', 'Desktop'
  Author = 'Microsoft Corporation'
  CompanyName = 'Microsoft Corporation'
  Copyright = 'Microsoft Corporation. All rights reserved.'
  Description = 'Microsoft Azure PowerShell: KubernetesConfiguration cmdlets'
  PowerShellVersion = '5.1'
  DotNetFrameworkVersion = '4.7.2'
  RequiredAssemblies = './bin/Az.KubernetesConfiguration.private.dll'
  FormatsToProcess = './Az.KubernetesConfiguration.format.ps1xml'
  FunctionsToExport = 'Get-AzKubernetesConfiguration', 'New-AzKubernetesConfiguration', 'Remove-AzKubernetesConfiguration', '*'
  AliasesToExport = '*'
  PrivateData = @{
    PSData = @{
      Tags = 'Azure', 'ResourceManager', 'ARM', 'PSModule', 'KubernetesConfiguration'
      LicenseUri = 'https://aka.ms/azps-license'
      ProjectUri = 'https://github.com/Azure/azure-powershell'
      ReleaseNotes = ''
    }
  }
}
