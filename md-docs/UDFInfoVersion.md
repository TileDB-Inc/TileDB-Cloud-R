# tiledbcloud::UDFInfoVersion

Version of User-defined function that can persist in db
## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **character** | Unique id of a versioned udf | [optional] 
**udf_image_uuid** | **character** | Unique id of the versioned image used by current udf version | [optional] 
**name** | **character** | name of udf version | [optional] 
**version** | **character** | Type-specific version | [optional] 
**image_name** | **character** | Docker image name to use for udf | [optional] 
**exec** | **character** | Type-specific executable text | [optional] 
**exec_raw** | **character** | optional raw text to store of serialized function, used for showing in UI | [optional] 
**default** | **character** | If current image version is default version | [optional] 


