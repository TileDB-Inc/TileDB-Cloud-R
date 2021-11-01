# tiledbcloud::SQLParameters

Parameters for running sql query
## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **character** | name of task, optional | [optional] 
**query** | **character** | query to run | [optional] 
**output_uri** | **character** | Output array uri | [optional] 
**store_results** | **character** | store results for later retrieval | [optional] 
**result_format** | [**ResultFormat**](ResultFormat.md) |  | [optional] 
**init_commands** | **array[character]** | Queries or commands to run before main query | [optional] 
**parameters** | **array[object]** | SQL query parameters | [optional] 


