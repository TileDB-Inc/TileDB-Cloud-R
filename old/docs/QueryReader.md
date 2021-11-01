# tiledbcloud::QueryReader

Read struct (can't be called reader due to class name conflict)
## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**layout** | [**Layout**](Layout.md) |  | [optional] 
**subarray** | [**Subarray**](Subarray.md) |  | [optional] 
**readState** | [**ReadState**](ReadState.md) |  | [optional] 
**varOffsetsMode** | **character** | The offsets format (bytes or elements) to be used. | [optional] 
**varOffsetsAddExtraElement** | **character** | True if an extra element will be added to the end of the offsets buffer. | [optional] 
**varOffsetsBitsize** | **integer** | The offsets bitsize (32 or 64) to be used. | [optional] 


