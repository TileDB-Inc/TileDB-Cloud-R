# tiledbcloud::UDFInfo

User-defined function that can persist in db, used and shared multiple times
## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **character** | Unique id of udf | [optional] 
**name** | **character** | name of udf | [optional] 
**language** | [**UDFLanguage**](UDFLanguage.md) |  | [optional] 
**type** | [**UDFType**](UDFType.md) |  | [optional] 
**readme** | **character** | Markdown readme of udfs | [optional] 
**license_id** | **character** | License identifier from SPDX License List or Custom | [optional] 
**license_text** | **character** | License text | [optional] 
**tags** | **array[character]** | optional tags for udf | [optional] 


