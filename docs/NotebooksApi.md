# NotebooksApi

All URIs are relative to *http://localhost/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**NotebooksNamespaceArrayEndTimestampsGet**](NotebooksApi.md#NotebooksNamespaceArrayEndTimestampsGet) | **GET** /notebooks/{namespace}/{array}/end_timestamps | 


# **NotebooksNamespaceArrayEndTimestampsGet**
> ArrayEndTimestampData NotebooksNamespaceArrayEndTimestampsGet(namespace, array, page=var.page, per.page=var.per.page)



retrieve a list of timestamps from the array fragment info listing in milliseconds, paginated

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.array <- 'array_example' # character | name/uri of array that is url-encoded
var.page <- 56 # integer | pagination offset
var.per.page <- 56 # integer | pagination limit

api.instance <- NotebooksApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$NotebooksNamespaceArrayEndTimestampsGet(var.namespace, var.array, page=var.page, per.page=var.per.page)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 
 **array** | **character**| name/uri of array that is url-encoded | 
 **page** | **integer**| pagination offset | [optional] 
 **per.page** | **integer**| pagination limit | [optional] 

### Return type

[**ArrayEndTimestampData**](ArrayEndTimestampData.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | list of timestamps in milliseconds, paginated |  -  |
| **0** | error response |  -  |

