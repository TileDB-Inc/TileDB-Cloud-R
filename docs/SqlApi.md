# SqlApi

All URIs are relative to *http://localhost/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**RunSQL**](SqlApi.md#RunSQL) | **POST** /sql/{namespace} | 


# **RunSQL**
> array[object] RunSQL(namespace, sql, accept.encoding=var.accept.encoding)



Run a sql query

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace to run task under is in (an organization name or user's username)
var.sql <- SQLParameters$new("name_example", "query_example", "output_uri_example", "store_results_example", ResultFormat$new(), list("init_commands_example"), list(123)) # SQLParameters | sql being submitted
var.accept.encoding <- 'accept.encoding_example' # character | Encoding to use

api.instance <- SqlApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$RunSQL(var.namespace, var.sql, accept.encoding=var.accept.encoding)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace to run task under is in (an organization name or user&#39;s username) | 
 **sql** | [**SQLParameters**](SQLParameters.md)| sql being submitted | 
 **accept.encoding** | **character**| Encoding to use | [optional] 

### Return type

**array[object]**

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | JSON results in array of objects form, if the query returns results |  * X-TILEDB-CLOUD-TASK-ID - Task ID for just completed request <br>  |
| **204** | SQL executed successfully |  * X-TILEDB-CLOUD-TASK-ID - Task ID for just completed request <br>  |
| **0** | error response |  -  |

