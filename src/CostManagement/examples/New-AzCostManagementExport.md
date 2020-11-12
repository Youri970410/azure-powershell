### Example 1: {{ Add title here }}
```powershell
PS C:\> New-AzCostManagementExport -Scope "subscriptions/************" -Name "TestExportDatasetAggregationInfoYouri" -ScheduleStatus "Active" -ScheduleRecurrence "Daily" -RecurrencePeriodFrom "2020-11-05T20:00:00Z" -RecurrencePeriodTo "2020-11-10T00:00:00Z" -Format "Csv" -DestinationResourceId "/subscriptions/**********/resourceGroups/wyunchi-costmanagement/providers/Microsoft.Storage/storageAccounts/wyunchistorageaccount" -DestinationContainer "exports" -DestinationRootFolderPath "ad-hoc" -DefinitionType "Usage" -DefinitionTimeframe "MonthToDate" -DatasetGranularity "Daily" -ETag "test"

ETag              Name                                  Type
----              ----                                  ----
"1d6b31fa07fd3b0" TestExportDatasetAggregationInfoYouri Microsoft.CostManagement/exports
```

{{ Add description here }}

### Example 2: {{ Add title here }}
```powershell
PS C:\> {{ Add code here }}

{{ Add output here }}
```

{{ Add description here }}

