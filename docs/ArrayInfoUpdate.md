# tiledbcloud::ArrayInfoUpdate

metadata of an array
## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**description** | **character** | description of array | [optional] 
**name** | **character** | description of array | [optional] 
**uri** | **character** | uri of array | [optional] 
**file_type** | [**FileType**](FileType.md) |  | [optional] 
**file_properties** | **map(character)** | map of file properties created for this array | [optional] 
**access_credentials_name** | **character** | the name of the access credentials to use. if unset, the default credentials will be used | [optional] 
**logo** | **character** | logo (base64 encoded) for the array. Optional | [optional] 
**tags** | **array[character]** | optional tags for array | [optional] 
**license_id** | **character** | License identifier from SPDX License List or Custom | [optional] 
**license_text** | **character** | License text | [optional] 
**read_only** | **character** | Suggests if the array is in read_only mode | [optional] 


