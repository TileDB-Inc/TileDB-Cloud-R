# NotebookApi

All URIs are relative to *http://localhost/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**GetNotebookServerStatus**](NotebookApi.md#GetNotebookServerStatus) | **GET** /notebooks/server/{namespace}/status | 
[**ShutdownNotebookServer**](NotebookApi.md#ShutdownNotebookServer) | **DELETE** /notebooks/server/{namespace} | 


# **GetNotebookServerStatus**
> NotebookStatus GetNotebookServerStatus(namespace)



Get status of the notebook server

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace notebook is in (an organization name or user's username)

api.instance <- NotebookApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$GetNotebookServerStatus(var.namespace)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace notebook is in (an organization name or user&#39;s username) | 

### Return type

[**NotebookStatus**](NotebookStatus.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | status of running notebook |  -  |
| **202** | Notebook server is pending |  -  |
| **404** | Notebook is not running |  -  |
| **0** | error response |  -  |

# **ShutdownNotebookServer**
> ShutdownNotebookServer(namespace)



Shutdown a notebook server

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace notebook is in (an organization name or user's username)

api.instance <- NotebookApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$ShutdownNotebookServer(var.namespace)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace notebook is in (an organization name or user&#39;s username) | 

### Return type

void (empty response body)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **204** | Notebook shutdown successfully |  -  |
| **404** | Notebook is not running |  -  |
| **0** | error response |  -  |

