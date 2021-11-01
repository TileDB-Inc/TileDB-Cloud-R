# tiledbcloud::SubarrayPartitioner

The subarray partitioner
## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**subarray** | [**Subarray**](Subarray.md) |  | [optional] 
**budget** | [**array[AttributeBufferSize]**](AttributeBufferSize.md) | Result size budget (in bytes) for all attributes. | [optional] 
**current** | [**SubarrayPartitionerCurrent**](SubarrayPartitioner_current.md) |  | [optional] 
**state** | [**SubarrayPartitionerState**](SubarrayPartitioner_state.md) |  | [optional] 
**memoryBudget** | **integer** | The memory budget for the fixed-sized attributes and the offsets of the var-sized attributes | [optional] 
**memoryBudgetVar** | **integer** | The memory budget for the var-sized attributes | [optional] 


