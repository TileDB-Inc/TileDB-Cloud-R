# ArrayTasksApi

All URIs are relative to *http://localhost/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**GetArrayTasksSidebar**](ArrayTasksApi.md#GetArrayTasksSidebar) | **GET** /tasks/sidebar | 


# **GetArrayTasksSidebar**
> ArrayTaskBrowserSidebar GetArrayTasksSidebar(start=var.start, end=var.end)



### Example
```R
library(tiledbcloud)

var.start <- 56 # integer | Fetch tasks created after this time, unix epoch in seconds, default 7 days ago
var.end <- 56 # integer | Fetch tasks created before this time, unix epoch in seconds, default now

api.instance <- ArrayTasksApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$GetArrayTasksSidebar(start=var.start, end=var.end)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **start** | **integer**| Fetch tasks created after this time, unix epoch in seconds, default 7 days ago | [optional] 
 **end** | **integer**| Fetch tasks created before this time, unix epoch in seconds, default now | [optional] 

### Return type

[**ArrayTaskBrowserSidebar**](ArrayTaskBrowserSidebar.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | sidebar metadata for task definitions for all arrays user has access to |  -  |
| **404** | array tasks not found |  -  |
| **0** | error response |  -  |

