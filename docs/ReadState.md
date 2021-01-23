# tiledbcloud::ReadState

state for reads
## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**initialized** | **character** | True if the reader has been initialized. | [optional] 
**overflowed** | **character** | True if the query produced results that could not fit in some buffer. | [optional] 
**unsplittable** | **character** | True if the current subarray partition is unsplittable. | [optional] 
**subarrayPartitioner** | [**SubarrayPartitioner**](SubarrayPartitioner.md) |  | [optional] 


