# tiledbcloud::UDFInfoUpdate

User-defined function that can persist in db, used and shared multiple times
## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **character** | name of udf | [optional] 
**language** | [**UDFLanguage**](UDFLanguage.md) |  | [optional] 
**version** | **character** | Type-specific version | [optional] 
**image_name** | **character** | Docker image name to use for udf | [optional] 
**type** | [**UDFType**](UDFType.md) |  | [optional] 
**exec** | **character** | Type-specific executable text | [optional] 
**exec_raw** | **character** | optional raw text to store of serialized function, used for showing in UI | [optional] 
**readme** | **character** | Markdown readme of udfs | [optional] 
**license_id** | **character** | License identifier from SPDX License List or Custom | [optional] 
**license_text** | **character** | License text | [optional] 
**tags** | **array[character]** | optional tags for udf | [optional] 


