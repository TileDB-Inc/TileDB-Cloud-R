# TasksApi

All URIs are relative to *http://localhost/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**RunSQL**](TasksApi.md#RunSQL) | **POST** /sql/{namespace} | 
[**TaskIdGet**](TasksApi.md#TaskIdGet) | **GET** /task/{id} | 
[**TaskIdRetryPost**](TasksApi.md#TaskIdRetryPost) | **POST** /task/{id}/retry | 
[**TasksGet**](TasksApi.md#TasksGet) | **GET** /tasks | 


# **RunSQL**
> array[object] RunSQL(namespace, sql, accept.encoding=var.accept.encoding)



Run a sql query

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace to run task under is in (an organization name or user's username)
var.sql <- SQLParameters$new("name_example", "query_example", "output_uri_example") # SQLParameters | sql being submitted
var.accept.encoding <- 'accept.encoding_example' # character | Encoding to use

api.instance <- TasksApi$new()
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

# **TaskIdGet**
> ArrayTask TaskIdGet(id)



Fetch an array task

### Example
```R
library(tiledbcloud)

var.id <- 'id_example' # character | task id to fetch

api.instance <- TasksApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$TaskIdGet(var.id)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **character**| task id to fetch | 

### Return type

[**ArrayTask**](ArrayTask.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Array task |  -  |
| **0** | error response |  -  |

# **TaskIdRetryPost**
> ArrayTask TaskIdRetryPost(id)



Retry an array task

### Example
```R
library(tiledbcloud)

var.id <- 'id_example' # character | task id to retry

api.instance <- TasksApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$TaskIdRetryPost(var.id)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **character**| task id to retry | 

### Return type

[**ArrayTask**](ArrayTask.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Array task |  -  |
| **0** | error response |  -  |

# **TasksGet**
> ArrayTaskData TasksGet(namespace=var.namespace, created.by=var.created.by, array=var.array, start=var.start, end=var.end, page=var.page, per.page=var.per.page, type=var.type, status=var.status, search=var.search, orderby=var.orderby)



Fetch a list of all array tasks a user has access to

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace to filter
var.created.by <- 'created.by_example' # character | username to filter
var.array <- 'array_example' # character | name/uri of array that is url-encoded to filter
var.start <- 56 # integer | start time for tasks to filter by
var.end <- 56 # integer | end time for tasks to filter by
var.page <- 56 # integer | pagination offset
var.per.page <- 56 # integer | pagination limit
var.type <- 'type_example' # character | task type, \"QUERY\", \"SQL\", \"UDF\"
var.status <- 'status_example' # character | Filter to only return these statuses
var.search <- 'search_example' # character | search string that will look at name, namespace or description fields
var.orderby <- 'orderby_example' # character | sort by which field valid values include start_time, name

api.instance <- TasksApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$TasksGet(namespace=var.namespace, created.by=var.created.by, array=var.array, start=var.start, end=var.end, page=var.page, per.page=var.per.page, type=var.type, status=var.status, search=var.search, orderby=var.orderby)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace to filter | [optional] 
 **created.by** | **character**| username to filter | [optional] 
 **array** | **character**| name/uri of array that is url-encoded to filter | [optional] 
 **start** | **integer**| start time for tasks to filter by | [optional] 
 **end** | **integer**| end time for tasks to filter by | [optional] 
 **page** | **integer**| pagination offset | [optional] 
 **per.page** | **integer**| pagination limit | [optional] 
 **type** | **character**| task type, \&quot;QUERY\&quot;, \&quot;SQL\&quot;, \&quot;UDF\&quot; | [optional] 
 **status** | **character**| Filter to only return these statuses | [optional] 
 **search** | **character**| search string that will look at name, namespace or description fields | [optional] 
 **orderby** | **character**| sort by which field valid values include start_time, name | [optional] 

### Return type

[**ArrayTaskData**](ArrayTaskData.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Array of all tasks user has access too |  -  |
| **0** | error response |  -  |

