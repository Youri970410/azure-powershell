### Example 1: Get all AzCostManagementExports by scope
```powershell
PS C:\> Get-AzCostManagementExport -Scope 'subscriptions/**********'

ETag              Name                               Type
----              ----                               ----
"1d63fb46c1f5154" TestExport                         Microsoft.CostManagement/exports
"1d63fb4a3f75019" TestExport1                        Microsoft.CostManagement/exports
"1d649f5dda56551" TestExport2                        Microsoft.CostManagement/exports
```

Get all AzCostManagementExports by Scope

### Example 2: Get AzCostManagementExport by Name and scope
```powershell
PS C:\> Get-AzCostManagementExport -Name 'TestExport' -Scope 'subscriptions/**********'

ETag              Name       Type
----              ----       ----
"1d63fb46c1f5154" TestExport Microsoft.CostManagement/exports
```

Get AzCostManagementExport by Name and scope

