# TasksApi

All URIs are relative to *http://localhost/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**RunSQL**](TasksApi.md#RunSQL) | **POST** /sql/{namespace} | 
[**TaskIdGet**](TasksApi.md#TaskIdGet) | **GET** /task/{id} | 
[**TaskIdResultGet**](TasksApi.md#TaskIdResultGet) | **GET** /task/{id}/result | 
[**TasksGet**](TasksApi.md#TasksGet) | **GET** /tasks | 


# **RunSQL**
> array[object] RunSQL(namespace, sql, accept.encoding=var.accept.encoding)



Run a sql query

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace to run task under is in (an organization name or user's username)
var.sql <- SQLParameters$new("name_example", "query_example", "output_uri_example", "store_results_example", ResultFormat$new(), list("init_commands_example"), list(123)) # SQLParameters | sql being submitted
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

# **TaskIdResultGet**
> character TaskIdResultGet(id, accept.encoding=var.accept.encoding)



Retrieve results of an array task

### Example
```R
library(tiledbcloud)

var.id <- 'id_example' # character | task id to retrieve stored results
var.accept.encoding <- 'accept.encoding_example' # character | Encoding to use

api.instance <- TasksApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$TaskIdResultGet(var.id, accept.encoding=var.accept.encoding)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **character**| task id to retrieve stored results | 
 **accept.encoding** | **character**| Encoding to use | [optional] 

### Return type

**character**

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | output and format of originating request |  * Content-Type - format results are delivered in <br>  |
| **202** | task is still executing |  -  |
| **404** | results were not saved, or results have expored |  -  |
| **0** | error response |  -  |

# **TasksGet**
> ArrayTaskData TasksGet(namespace=var.namespace, created.by=var.created.by, array=var.array, start=var.start, end=var.end, page=var.page, per.page=var.per.page, type=var.type, exclude.type=var.exclude.type, file.type=var.file.type, exclude.file.type=var.exclude.file.type, status=var.status, search=var.search, orderby=var.orderby)



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
var.type <- 'type_example' # character | task type, \"QUERY\", \"SQL\", \"UDF\", \"GENERIC_UDF\"
var.exclude.type <- list("inner_example") # array[character] | task_type to exclude matching array in results, more than one can be included
var.file.type <- list("inner_example") # array[character] | match file_type of task array, more than one can be included
var.exclude.file.type <- list("inner_example") # array[character] | exclude file_type of task arrays, more than one can be included
var.status <- 'status_example' # character | Filter to only return these statuses
var.search <- 'search_example' # character | search string that will look at name, namespace or description fields
var.orderby <- 'orderby_example' # character | sort by which field valid values include start_time, name

api.instance <- TasksApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$TasksGet(namespace=var.namespace, created.by=var.created.by, array=var.array, start=var.start, end=var.end, page=var.page, per.page=var.per.page, type=var.type, exclude.type=var.exclude.type, file.type=var.file.type, exclude.file.type=var.exclude.file.type, status=var.status, search=var.search, orderby=var.orderby)
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
 **type** | **character**| task type, \&quot;QUERY\&quot;, \&quot;SQL\&quot;, \&quot;UDF\&quot;, \&quot;GENERIC_UDF\&quot; | [optional] 
 **exclude.type** | list( **character** )| task_type to exclude matching array in results, more than one can be included | [optional] 
 **file.type** | list( **character** )| match file_type of task array, more than one can be included | [optional] 
 **exclude.file.type** | list( **character** )| exclude file_type of task arrays, more than one can be included | [optional] 
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

