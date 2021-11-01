# tiledbcloud::ArraySchema

ArraySchema during creation or retrieval
## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **character** | URI of schema | [optional] 
**version** | **array[integer]** | file format version | 
**arrayType** | [**ArrayType**](ArrayType.md) |  | 
**tileOrder** | [**Layout**](Layout.md) |  | 
**cellOrder** | [**Layout**](Layout.md) |  | 
**capacity** | **integer** | Capacity of array | 
**coordsFilterPipeline** | [**FilterPipeline**](FilterPipeline.md) |  | 
**offsetFilterPipeline** | [**FilterPipeline**](FilterPipeline.md) |  | 
**domain** | [**Domain**](Domain.md) |  | 
**attributes** | [**array[Attribute]**](Attribute.md) | Attributes of array | 
**allowsDuplicates** | **character** | True if the array allows coordinate duplicates. Applicable only to sparse arrays. | [optional] 


