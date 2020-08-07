# tiledbcloud::Query

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**type** | [**Querytype**](Querytype.md) |  | 
**layout** | [**Layout**](Layout.md) |  | 
**status** | [**Querystatus**](Querystatus.md) |  | 
**attributeBufferHeaders** | [**array[AttributeBufferHeader]**](AttributeBufferHeader.md) | List of attribute buffer headers | 
**writer** | [**Writer**](Writer.md) |  | [optional] 
**reader** | [**QueryReader**](QueryReader.md) |  | [optional] 
**array** | [**Array**](Array.md) |  | 
**totalFixedLengthBufferBytes** | **integer** | Total number of bytes in fixed size attribute buffers. | 
**totalVarLenBufferBytes** | **integer** | Total number of bytes in variable size attribute buffers. | 


