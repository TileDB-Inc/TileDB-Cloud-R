# tiledbcloud::UDFArrayDetails

Contains array details for multi-array query including uri, ranges buffers
## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **character** | array to set ranges and buffers on, must be in tiledb:// format | [optional] 
**ranges** | [**QueryRanges**](QueryRanges.md) |  | [optional] 
**buffers** | **array[character]** | List of buffers to fetch (attributes + dimensions) | [optional] 


