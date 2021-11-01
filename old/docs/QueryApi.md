# QueryApi

All URIs are relative to *http://localhost/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**FinalizeQuery**](QueryApi.md#FinalizeQuery) | **POST** /arrays/{namespace}/{array}/query/finalize | 
[**GetEstResultSizes**](QueryApi.md#GetEstResultSizes) | **POST** /arrays/{namespace}/{array}/query/est_result_sizes | 
[**GetFile**](QueryApi.md#GetFile) | **GET** /arrays/{namespace}/{array}/query/get_file | 
[**SubmitQuery**](QueryApi.md#SubmitQuery) | **POST** /arrays/{namespace}/{array}/query/submit | 
[**SubmitQueryJson**](QueryApi.md#SubmitQueryJson) | **POST** /arrays/{namespace}/{array}/query/submit_query_json | 


# **FinalizeQuery**
> Query FinalizeQuery(namespace, array, type, content.type, query, x.payer=var.x.payer, open.at=var.open.at)



send a query to run against a specified array/URI registered to a group/project

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.array <- 'array_example' # character | name/uri of array that is url-encoded
var.type <- 'type_example' # character | type of query
var.content.type <- 'application/json' # character | Content Type of input and return mime
var.query <- Query$new(Querytype$new(), Layout$new(), Querystatus$new(), list(AttributeBufferHeader$new("name_example", 123, 123)), Writer$new("checkCoordDups_example", "checkCoordOOB_example", "dedupCoords_example", DomainArray$new(list(123), list(123), list(123), list(123), list(123), list(123), list(123), list(123), list(123), list(123))), QueryReader$new(Layout$new(), Subarray$new(Layout$new(), list(SubarrayRanges$new(Datatype$new(), "hasDefaultRange_example", list(123)))), ReadState$new("initialized_example", "overflowed_example", "unsplittable_example", SubarrayPartitioner$new(Subarray$new(Layout$new(), list(SubarrayRanges$new(Datatype$new(), "hasDefaultRange_example", list(123)))), list(AttributeBufferSize$new("attribute_example", 123, 123)), SubarrayPartitioner_current$new(Subarray$new(Layout$new(), list(SubarrayRanges$new(Datatype$new(), "hasDefaultRange_example", list(123)))), 123, 123, "splitMultiRange_example"), SubarrayPartitioner_state$new(123, 123, list(Subarray$new(Layout$new(), list(SubarrayRanges$new(Datatype$new(), "hasDefaultRange_example", list(123))))), list(Subarray$new(Layout$new(), list(SubarrayRanges$new(Datatype$new(), "hasDefaultRange_example", list(123)))))), 123, 123)), "varOffsetsMode_example", "varOffsetsAddExtraElement_example", 123), Array$new(123, Querytype$new(), "uri_example"), 123, 123) # Query | query to run
var.x.payer <- 'x.payer_example' # character | Name of organization or user who should be charged for this request
var.open.at <- 56 # integer | open_at for array in unix epoch

api.instance <- QueryApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$FinalizeQuery(var.namespace, var.array, var.type, var.content.type, var.query, x.payer=var.x.payer, open.at=var.open.at)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 
 **array** | **character**| name/uri of array that is url-encoded | 
 **type** | **character**| type of query | 
 **content.type** | **character**| Content Type of input and return mime | [default to &#39;application/json&#39;]
 **query** | [**Query**](Query.md)| query to run | 
 **x.payer** | **character**| Name of organization or user who should be charged for this request | [optional] 
 **open.at** | **integer**| open_at for array in unix epoch | [optional] 

### Return type

[**Query**](Query.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: application/json, application/capnp
 - **Accept**: application/json, application/capnp

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | query completed and results are returned in query object |  * X-TILEDB-CLOUD-TASK-ID - Task ID for just completed query <br>  |
| **204** | query completed successfully with no return |  -  |
| **0** | error response |  -  |

# **GetEstResultSizes**
> Query GetEstResultSizes(namespace, array, type, content.type, query, x.payer=var.x.payer, open.at=var.open.at)



send a query to run against a specified array/URI registered to a group/project

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.array <- 'array_example' # character | name/uri of array that is url-encoded
var.type <- 'type_example' # character | type of query
var.content.type <- 'application/json' # character | Content Type of input and return mime
var.query <- Query$new(Querytype$new(), Layout$new(), Querystatus$new(), list(AttributeBufferHeader$new("name_example", 123, 123)), Writer$new("checkCoordDups_example", "checkCoordOOB_example", "dedupCoords_example", DomainArray$new(list(123), list(123), list(123), list(123), list(123), list(123), list(123), list(123), list(123), list(123))), QueryReader$new(Layout$new(), Subarray$new(Layout$new(), list(SubarrayRanges$new(Datatype$new(), "hasDefaultRange_example", list(123)))), ReadState$new("initialized_example", "overflowed_example", "unsplittable_example", SubarrayPartitioner$new(Subarray$new(Layout$new(), list(SubarrayRanges$new(Datatype$new(), "hasDefaultRange_example", list(123)))), list(AttributeBufferSize$new("attribute_example", 123, 123)), SubarrayPartitioner_current$new(Subarray$new(Layout$new(), list(SubarrayRanges$new(Datatype$new(), "hasDefaultRange_example", list(123)))), 123, 123, "splitMultiRange_example"), SubarrayPartitioner_state$new(123, 123, list(Subarray$new(Layout$new(), list(SubarrayRanges$new(Datatype$new(), "hasDefaultRange_example", list(123))))), list(Subarray$new(Layout$new(), list(SubarrayRanges$new(Datatype$new(), "hasDefaultRange_example", list(123)))))), 123, 123)), "varOffsetsMode_example", "varOffsetsAddExtraElement_example", 123), Array$new(123, Querytype$new(), "uri_example"), 123, 123) # Query | query to run
var.x.payer <- 'x.payer_example' # character | Name of organization or user who should be charged for this request
var.open.at <- 56 # integer | open_at for array in unix epoch

api.instance <- QueryApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$GetEstResultSizes(var.namespace, var.array, var.type, var.content.type, var.query, x.payer=var.x.payer, open.at=var.open.at)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 
 **array** | **character**| name/uri of array that is url-encoded | 
 **type** | **character**| type of query | 
 **content.type** | **character**| Content Type of input and return mime | [default to &#39;application/json&#39;]
 **query** | [**Query**](Query.md)| query to run | 
 **x.payer** | **character**| Name of organization or user who should be charged for this request | [optional] 
 **open.at** | **integer**| open_at for array in unix epoch | [optional] 

### Return type

[**Query**](Query.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: application/json, application/capnp
 - **Accept**: application/json, application/capnp

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | query est result size computed and results are returned in query object |  * X-TILEDB-CLOUD-TASK-ID - Task ID for just computed query result size <br>  |
| **204** | query completed successfully with no return |  -  |
| **0** | error response |  -  |

# **GetFile**
> data.frame GetFile(namespace, array, content.type, x.payer=var.x.payer)



send a query to run against a specified array/URI registered to a group/project, returns file bytes

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.array <- 'array_example' # character | name/uri of array that is url-encoded
var.content.type <- 'application/json' # character | Content Type of input and return mime
var.x.payer <- 'x.payer_example' # character | Name of organization or user who should be charged for this request

api.instance <- QueryApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$GetFile(var.namespace, var.array, var.content.type, x.payer=var.x.payer)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 
 **array** | **character**| name/uri of array that is url-encoded | 
 **content.type** | **character**| Content Type of input and return mime | [default to &#39;application/json&#39;]
 **x.payer** | **character**| Name of organization or user who should be charged for this request | [optional] 

### Return type

**data.frame**

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/x-ipynb+json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | query completed and result bytes are returned |  * X-TILEDB-CLOUD-TASK-ID - Task ID for just completed query <br>  |
| **0** | error response |  -  |

# **SubmitQuery**
> Query SubmitQuery(namespace, array, type, content.type, query, x.payer=var.x.payer, open.at=var.open.at)



send a query to run against a specified array/URI registered to a group/project

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.array <- 'array_example' # character | name/uri of array that is url-encoded
var.type <- 'type_example' # character | type of query
var.content.type <- 'application/json' # character | Content Type of input and return mime
var.query <- Query$new(Querytype$new(), Layout$new(), Querystatus$new(), list(AttributeBufferHeader$new("name_example", 123, 123)), Writer$new("checkCoordDups_example", "checkCoordOOB_example", "dedupCoords_example", DomainArray$new(list(123), list(123), list(123), list(123), list(123), list(123), list(123), list(123), list(123), list(123))), QueryReader$new(Layout$new(), Subarray$new(Layout$new(), list(SubarrayRanges$new(Datatype$new(), "hasDefaultRange_example", list(123)))), ReadState$new("initialized_example", "overflowed_example", "unsplittable_example", SubarrayPartitioner$new(Subarray$new(Layout$new(), list(SubarrayRanges$new(Datatype$new(), "hasDefaultRange_example", list(123)))), list(AttributeBufferSize$new("attribute_example", 123, 123)), SubarrayPartitioner_current$new(Subarray$new(Layout$new(), list(SubarrayRanges$new(Datatype$new(), "hasDefaultRange_example", list(123)))), 123, 123, "splitMultiRange_example"), SubarrayPartitioner_state$new(123, 123, list(Subarray$new(Layout$new(), list(SubarrayRanges$new(Datatype$new(), "hasDefaultRange_example", list(123))))), list(Subarray$new(Layout$new(), list(SubarrayRanges$new(Datatype$new(), "hasDefaultRange_example", list(123)))))), 123, 123)), "varOffsetsMode_example", "varOffsetsAddExtraElement_example", 123), Array$new(123, Querytype$new(), "uri_example"), 123, 123) # Query | query to run
var.x.payer <- 'x.payer_example' # character | Name of organization or user who should be charged for this request
var.open.at <- 56 # integer | open_at for array in unix epoch

api.instance <- QueryApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$SubmitQuery(var.namespace, var.array, var.type, var.content.type, var.query, x.payer=var.x.payer, open.at=var.open.at)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 
 **array** | **character**| name/uri of array that is url-encoded | 
 **type** | **character**| type of query | 
 **content.type** | **character**| Content Type of input and return mime | [default to &#39;application/json&#39;]
 **query** | [**Query**](Query.md)| query to run | 
 **x.payer** | **character**| Name of organization or user who should be charged for this request | [optional] 
 **open.at** | **integer**| open_at for array in unix epoch | [optional] 

### Return type

[**Query**](Query.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: application/json, application/capnp
 - **Accept**: application/json, application/capnp

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | query completed and results are returned in query object |  * X-TILEDB-CLOUD-TASK-ID - Task ID for just completed query <br>  |
| **204** | query completed successfully with no return |  -  |
| **0** | error response |  -  |

# **SubmitQueryJson**
> object SubmitQueryJson(namespace, array, content.type, query.json, x.payer=var.x.payer)



send a query to run against a specified array/URI registered to a group/project, returns json results

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.array <- 'array_example' # character | name/uri of array that is url-encoded
var.content.type <- 'application/json' # character | Content Type of input and return mime
var.query.json <- QueryJson$new(QueryRanges$new(Layout$new(), list(list(123))), list("fields_example")) # QueryJson | query to run
var.x.payer <- 'x.payer_example' # character | Name of organization or user who should be charged for this request

api.instance <- QueryApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$SubmitQueryJson(var.namespace, var.array, var.content.type, var.query.json, x.payer=var.x.payer)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 
 **array** | **character**| name/uri of array that is url-encoded | 
 **content.type** | **character**| Content Type of input and return mime | [default to &#39;application/json&#39;]
 **query.json** | [**QueryJson**](QueryJson.md)| query to run | 
 **x.payer** | **character**| Name of organization or user who should be charged for this request | [optional] 

### Return type

**object**

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | query completed and results are returned in json format |  * X-TILEDB-CLOUD-TASK-ID - Task ID for just completed query <br>  |
| **0** | error response |  -  |

