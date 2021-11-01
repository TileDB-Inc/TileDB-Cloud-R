# tiledbcloud::ArrayActivityLog

Actvity of an Array
## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**event_at** | **character** | time event took place (RFC3339) | [optional] 
**action** | [**ActivityEventType**](ActivityEventType.md) |  | [optional] 
**username** | **character** | User who performed action | [optional] 
**bytes_sent** | **integer** | Bytes sent to client | [optional] 
**bytes_received** | **integer** | Bytes recieved from client | [optional] 
**array_task_id** | **character** | uuid of associated array task | [optional] 
**id** | **character** | id of the activity | [optional] 
**query_ranges** | **character** | ranges for query | [optional] 
**query_stats** | **character** | stats for query | [optional] 


