# tiledbcloud::UDFImageVersion

Defines an image that belongs to a set of images having a version
## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **character** | Unique id of a versioned image | [optional] 
**name** | **character** | name of UDFImageVersion | [optional] 
**udf_image_uuid** | **character** | Unique id of the udf image set | [optional] 
**docker_image** | **character** | Uri of docker image related to current entry | [optional] 
**version** | **numeric** | Image-specific version | [optional] 
**default** | **character** | If current image is default version | [optional] 
**latest** | **character** | If current image is latest version | [optional] 


