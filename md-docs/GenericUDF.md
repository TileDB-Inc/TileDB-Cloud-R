# tiledbcloud::GenericUDF

User-defined function
## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**udf_info_name** | **character** | name of UDFInfo to run, format is {namespace}/{udf_name}. Can not be used with exec | [optional] 
**language** | [**UDFLanguage**](UDFLanguage.md) |  | [optional] 
**version** | **character** | Type-specific version | [optional] 
**image_name** | **character** | Docker image name to use for udf | [optional] 
**exec** | **character** | Type-specific executable text | [optional] 
**exec_raw** | **character** | optional raw text to store of serialized function, used for showing in UI | [optional] 
**argument** | **character** | Argument(s) to pass to udf function, tuple or list of args/kwargs which can be in native or json format | [optional] 
**result_format** | [**UDFResultType**](UDFResultType.md) |  | [optional] 
**task_name** | **character** | name of task, optional | [optional] 


