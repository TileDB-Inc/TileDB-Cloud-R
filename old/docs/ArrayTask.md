# tiledbcloud::ArrayTask

Synchronous Task to Run
## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **character** | task id | [optional] 
**name** | **character** | Optional task name | [optional] 
**description** | **character** | Optional task description (Tasks purpose) | [optional] 
**array_metadata** | [**ArrayInfo**](ArrayInfo.md) |  | [optional] 
**subarray** | [**DomainArray**](DomainArray.md) |  | [optional] 
**memory** | **integer** | memory allocated to task in bytes | [optional] 
**cpu** | **integer** | millicpu allocated to task | [optional] 
**namespace** | **character** | namespace task is tied to | [optional] 
**status** | [**ArrayTaskStatus**](ArrayTaskStatus.md) |  | [optional] 
**start_time** | **character** | Start time RFC3339 for job | [optional] 
**finish_time** | **character** | Finish time RFC3339 for job | [optional] 
**cost** | **numeric** | Cost accumulated for task in USD, example is $0.12 | [optional] 
**query_type** | [**Querytype**](Querytype.md) |  | [optional] 
**udf_code** | **character** | Optional actual code that is going to be executed | [optional] 
**udf_language** | **character** | Optional actual language used to express udf_code | [optional] 
**sql_query** | **character** | Optional actual sql query that is going to be executed | [optional] 
**type** | [**ArrayTaskType**](ArrayTaskType.md) |  | [optional] 
**activity** | [**array[ArrayActivityLog]**](ArrayActivityLog.md) | Array activity logs for task | [optional] 
**logs** | **character** | logs from array task | [optional] 


