### Example 1: Get AzCostManagementExportExecutionHistory
```powershell
PS C:\> Get-AzCostManagementExportExecutionHistory -ExportName 'TestExport' -Scope 'subscriptions/**********'

ExecutionType ProcessingStartTime ProcessingEndTime  Status    FileName
------------- ------------------- -----------------  ------    --------
Scheduled     2020/6/11 12:03:20  2020/6/11 12:03:43 Completed ad-hoc/TestExport/20200601-20200630/TestExport_e02f95ad-584b-4b83-ba9d-41d398e855af.csv
Scheduled     2020/6/12 12:03:37  2020/6/12 12:03:48 Completed ad-hoc/TestExport/20200601-20200630/TestExport_fc41d48d-ef47-4e38-aa1e-323e286c6fcf.csv
Scheduled     2020/6/13 12:02:33  2020/6/13 12:26:33 Failed    ad-hoc/TestExport/20200601-20200630/TestExport_076501ee-bf16-424b-807e-ca5c6c23293b.csv
Scheduled     2020/6/14 12:27:28  2020/6/14 12:27:50 Completed ad-hoc/TestExport/20200601-20200630/TestExport_145cb0fa-c808-4a6b-b8bb-14a11d78a0dc.csv
Scheduled     2020/6/15 12:02:34  2020/6/15 12:02:45 Completed ad-hoc/TestExport/20200601-20200630/TestExport_7d6422d0-7a46-4a89-9556-4f616941e8ae.csv
Scheduled     2020/6/16 12:07:31  2020/6/16 12:07:43 Completed ad-hoc/TestExport/20200601-20200630/TestExport_f5c68909-63bc-4278-bfa5-2fbe008d78fe.csv
Scheduled     2020/6/17 12:03:56  2020/6/17 12:04:17 Completed ad-hoc/TestExport/20200601-20200630/TestExport_eda8f8fa-7cca-4110-8cba-e64d9f1e4b10.csv
```

Get AzCostManagementExportExecutionHistory By ExportName and Scope

### Example 2: Get AzCostManagementExportExecutionHistory by InputObject
```powershell
PS C:\> $getExport = Get-AzCostManagementExport -Name 'TestExport' -Scope 'subscriptions/**********'
Get-AzCostManagementExportExecutionHistory -InputObject $getExport

ExecutionType ProcessingStartTime ProcessingEndTime  Status    FileName
------------- ------------------- -----------------  ------    --------
Scheduled     2020/6/11 12:03:20  2020/6/11 12:03:43 Completed ad-hoc/TestExport/20200601-20200630/TestExport_e02f95ad-584b-4b83-ba9d-41d398e855af.csv
Scheduled     2020/6/12 12:03:37  2020/6/12 12:03:48 Completed ad-hoc/TestExport/20200601-20200630/TestExport_fc41d48d-ef47-4e38-aa1e-323e286c6fcf.csv
Scheduled     2020/6/13 12:02:33  2020/6/13 12:26:33 Failed    ad-hoc/TestExport/20200601-20200630/TestExport_076501ee-bf16-424b-807e-ca5c6c23293b.csv
Scheduled     2020/6/14 12:27:28  2020/6/14 12:27:50 Completed ad-hoc/TestExport/20200601-20200630/TestExport_145cb0fa-c808-4a6b-b8bb-14a11d78a0dc.csv
Scheduled     2020/6/15 12:02:34  2020/6/15 12:02:45 Completed ad-hoc/TestExport/20200601-20200630/TestExport_7d6422d0-7a46-4a89-9556-4f616941e8ae.csv
Scheduled     2020/6/16 12:07:31  2020/6/16 12:07:43 Completed ad-hoc/TestExport/20200601-20200630/TestExport_f5c68909-63bc-4278-bfa5-2fbe008d78fe.csv
Scheduled     2020/6/17 12:03:56  2020/6/17 12:04:17 Completed ad-hoc/TestExport/20200601-20200630/TestExport_eda8f8fa-7cca-4110-8cba-e64d9f1e4b10.csv
```

Get AzCostManagementExportExecutionHistory By InputObject

