# ArrayApi

All URIs are relative to *http://localhost/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**ArrayActivityLog**](ArrayApi.md#ArrayActivityLog) | **GET** /arrays/{namespace}/{array}/activity | 
[**ArraysBrowserOwnedGet**](ArrayApi.md#ArraysBrowserOwnedGet) | **GET** /arrays/browser/owned | 
[**ArraysBrowserOwnedSidebarGet**](ArrayApi.md#ArraysBrowserOwnedSidebarGet) | **GET** /arrays/browser/owned/sidebar | 
[**ArraysBrowserPublicGet**](ArrayApi.md#ArraysBrowserPublicGet) | **GET** /arrays/browser/public | 
[**ArraysBrowserPublicSidebarGet**](ArrayApi.md#ArraysBrowserPublicSidebarGet) | **GET** /arrays/browser/public/sidebar | 
[**ArraysBrowserSharedGet**](ArrayApi.md#ArraysBrowserSharedGet) | **GET** /arrays/browser/shared | 
[**ArraysBrowserSharedSidebarGet**](ArrayApi.md#ArraysBrowserSharedSidebarGet) | **GET** /arrays/browser/shared/sidebar | 
[**ArraysNamespaceArrayEndTimestampsGet**](ArrayApi.md#ArraysNamespaceArrayEndTimestampsGet) | **GET** /arrays/{namespace}/{array}/end_timestamps | 
[**ConsolidateArray**](ArrayApi.md#ConsolidateArray) | **POST** /arrays/{namespace}/{array}/consolidate | 
[**CreateArray**](ArrayApi.md#CreateArray) | **POST** /arrays/{namespace}/{array} | 
[**DeleteArray**](ArrayApi.md#DeleteArray) | **DELETE** /arrays/{namespace}/{array} | 
[**DeregisterArray**](ArrayApi.md#DeregisterArray) | **DELETE** /arrays/{namespace}/{array}/deregister | 
[**GetActivityLogById**](ArrayApi.md#GetActivityLogById) | **GET** /arrays/{namespace}/{array}/activity/{id} | 
[**GetAllArrayMetadata**](ArrayApi.md#GetAllArrayMetadata) | **GET** /arrays | 
[**GetArray**](ArrayApi.md#GetArray) | **GET** /arrays/{namespace}/{array} | 
[**GetArrayMaxBufferSizes**](ArrayApi.md#GetArrayMaxBufferSizes) | **GET** /arrays/{namespace}/{array}/max_buffer_sizes | 
[**GetArrayMetaDataJson**](ArrayApi.md#GetArrayMetaDataJson) | **GET** /arrays/{namespace}/{array}/metadata_json | 
[**GetArrayMetadata**](ArrayApi.md#GetArrayMetadata) | **GET** /arrays/{namespace}/{array}/metadata | 
[**GetArrayMetadataCapnp**](ArrayApi.md#GetArrayMetadataCapnp) | **GET** /arrays/{namespace}/{array}/array_metadata | 
[**GetArrayNonEmptyDomain**](ArrayApi.md#GetArrayNonEmptyDomain) | **GET** /arrays/{namespace}/{array}/non_empty_domain | 
[**GetArrayNonEmptyDomainJson**](ArrayApi.md#GetArrayNonEmptyDomainJson) | **GET** /arrays/{namespace}/{array}/non_empty_domain_json | 
[**GetArraySampleData**](ArrayApi.md#GetArraySampleData) | **GET** /arrays/{namespace}/{array}/sample | 
[**GetArraySharingPolicies**](ArrayApi.md#GetArraySharingPolicies) | **GET** /arrays/{namespace}/{array}/share | 
[**GetArraysInNamespace**](ArrayApi.md#GetArraysInNamespace) | **GET** /arrays/{namespace} | 
[**GetFragmentEndTimestamp**](ArrayApi.md#GetFragmentEndTimestamp) | **GET** /arrays/{namespace}/{array}/fragment_end_timestamp | 
[**GetLastAccessedArrays**](ArrayApi.md#GetLastAccessedArrays) | **GET** /arrays/last_accessed | 
[**RegisterArray**](ArrayApi.md#RegisterArray) | **POST** /arrays/{namespace}/{array}/register | 
[**ShareArray**](ArrayApi.md#ShareArray) | **PATCH** /arrays/{namespace}/{array}/share | 
[**UpdateArrayMetadata**](ArrayApi.md#UpdateArrayMetadata) | **PATCH** /arrays/{namespace}/{array}/metadata | 
[**UpdateArrayMetadataCapnp**](ArrayApi.md#UpdateArrayMetadataCapnp) | **POST** /arrays/{namespace}/{array}/array_metadata | 
[**VacuumArray**](ArrayApi.md#VacuumArray) | **POST** /arrays/{namespace}/{array}/vacuum | 


# **ArrayActivityLog**
> array[ArrayActivityLog] ArrayActivityLog(namespace, array, start=var.start, end=var.end, event.types=var.event.types, task.id=var.task.id, has.task.id=var.has.task.id)



get array activity logs

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.array <- 'array_example' # character | name/uri of array that is url-encoded
var.start <- 56 # integer | Start time of window of fetch logs, unix epoch in seconds (default: seven days ago)
var.end <- 56 # integer | End time of window of fetch logs, unix epoch in seconds (default: current utc timestamp)
var.event.types <- 'event.types_example' # character | Event values can be one or more of the following read, write, create, delete, register, deregister, comma separated
var.task.id <- 'task.id_example' # character | Array task id To filter activity to
var.has.task.id <- 'has.task.id_example' # character | Excludes activity log results that does not contain an array task uuid

api.instance <- ArrayApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$ArrayActivityLog(var.namespace, var.array, start=var.start, end=var.end, event.types=var.event.types, task.id=var.task.id, has.task.id=var.has.task.id)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 
 **array** | **character**| name/uri of array that is url-encoded | 
 **start** | **integer**| Start time of window of fetch logs, unix epoch in seconds (default: seven days ago) | [optional] 
 **end** | **integer**| End time of window of fetch logs, unix epoch in seconds (default: current utc timestamp) | [optional] 
 **event.types** | **character**| Event values can be one or more of the following read, write, create, delete, register, deregister, comma separated | [optional] 
 **task.id** | **character**| Array task id To filter activity to | [optional] 
 **has.task.id** | **character**| Excludes activity log results that does not contain an array task uuid | [optional] 

### Return type

[**array[ArrayActivityLog]**](ArrayActivityLog.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | log of array activity |  -  |
| **0** | error response |  -  |

# **ArraysBrowserOwnedGet**
> ArrayBrowserData ArraysBrowserOwnedGet(page=var.page, per.page=var.per.page, search=var.search, namespace=var.namespace, orderby=var.orderby, permissions=var.permissions, tag=var.tag, exclude.tag=var.exclude.tag, file.type=var.file.type, exclude.file.type=var.exclude.file.type, file.property=var.file.property)



Fetch a list of all arrays that are owned directly by user or user's organizations

### Example
```R
library(tiledbcloud)

var.page <- 56 # integer | pagination offset
var.per.page <- 56 # integer | pagination limit
var.search <- 'search_example' # character | search string that will look at name, namespace or description fields
var.namespace <- 'namespace_example' # character | namespace
var.orderby <- 'orderby_example' # character | sort by which field valid values include last_accessed, size, name
var.permissions <- 'permissions_example' # character | permissions valid values include read, read_write, write, admin
var.tag <- list("inner_example") # array[character] | tag to search for, more than one can be included
var.exclude.tag <- list("inner_example") # array[character] | tags to exclude matching array in results, more than one can be included
var.file.type <- list("inner_example") # array[character] | file_type to search for, more than one can be included
var.exclude.file.type <- list("inner_example") # array[character] | file_type to exclude matching array in results, more than one can be included
var.file.property <- list("inner_example") # array[character] | file_property key-value pair (comma separated, i.e. key,value) to search for, more than one can be included

api.instance <- ArrayApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$ArraysBrowserOwnedGet(page=var.page, per.page=var.per.page, search=var.search, namespace=var.namespace, orderby=var.orderby, permissions=var.permissions, tag=var.tag, exclude.tag=var.exclude.tag, file.type=var.file.type, exclude.file.type=var.exclude.file.type, file.property=var.file.property)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **integer**| pagination offset | [optional] 
 **per.page** | **integer**| pagination limit | [optional] 
 **search** | **character**| search string that will look at name, namespace or description fields | [optional] 
 **namespace** | **character**| namespace | [optional] 
 **orderby** | **character**| sort by which field valid values include last_accessed, size, name | [optional] 
 **permissions** | **character**| permissions valid values include read, read_write, write, admin | [optional] 
 **tag** | list( **character** )| tag to search for, more than one can be included | [optional] 
 **exclude.tag** | list( **character** )| tags to exclude matching array in results, more than one can be included | [optional] 
 **file.type** | list( **character** )| file_type to search for, more than one can be included | [optional] 
 **exclude.file.type** | list( **character** )| file_type to exclude matching array in results, more than one can be included | [optional] 
 **file.property** | list( **character** )| file_property key-value pair (comma separated, i.e. key,value) to search for, more than one can be included | [optional] 

### Return type

[**ArrayBrowserData**](ArrayBrowserData.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Array of array info that are owned directly by user or user&#39;s organizations |  -  |
| **0** | error response |  -  |

# **ArraysBrowserOwnedSidebarGet**
> ArrayBrowserSidebar ArraysBrowserOwnedSidebarGet()



Fetch a sidebar for arrays that are owned directly by user or user's organizations

### Example
```R
library(tiledbcloud)


api.instance <- ArrayApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$ArraysBrowserOwnedSidebarGet()
dput(result)
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ArrayBrowserSidebar**](ArrayBrowserSidebar.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Array of array info that are owned directly by user or user&#39;s organizations |  -  |
| **0** | error response |  -  |

# **ArraysBrowserPublicGet**
> ArrayBrowserData ArraysBrowserPublicGet(page=var.page, per.page=var.per.page, search=var.search, namespace=var.namespace, orderby=var.orderby, permissions=var.permissions, tag=var.tag, exclude.tag=var.exclude.tag, file.type=var.file.type, exclude.file.type=var.exclude.file.type, file.property=var.file.property)



Fetch a list of all arrays that have been shared publically

### Example
```R
library(tiledbcloud)

var.page <- 56 # integer | pagination offset
var.per.page <- 56 # integer | pagination limit
var.search <- 'search_example' # character | search string that will look at name, namespace or description fields
var.namespace <- 'namespace_example' # character | namespace
var.orderby <- 'orderby_example' # character | sort by which field valid values include last_accessed, size, name
var.permissions <- 'permissions_example' # character | permissions valid values include read, read_write, write, admin
var.tag <- list("inner_example") # array[character] | tag to search for, more than one can be included
var.exclude.tag <- list("inner_example") # array[character] | tags to exclude matching array in results, more than one can be included
var.file.type <- list("inner_example") # array[character] | file_type to search for, more than one can be included
var.exclude.file.type <- list("inner_example") # array[character] | file_type to exclude matching array in results, more than one can be included
var.file.property <- list("inner_example") # array[character] | file_property key-value pair (comma separated, i.e. key,value) to search for, more than one can be included

api.instance <- ArrayApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$ArraysBrowserPublicGet(page=var.page, per.page=var.per.page, search=var.search, namespace=var.namespace, orderby=var.orderby, permissions=var.permissions, tag=var.tag, exclude.tag=var.exclude.tag, file.type=var.file.type, exclude.file.type=var.exclude.file.type, file.property=var.file.property)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **integer**| pagination offset | [optional] 
 **per.page** | **integer**| pagination limit | [optional] 
 **search** | **character**| search string that will look at name, namespace or description fields | [optional] 
 **namespace** | **character**| namespace | [optional] 
 **orderby** | **character**| sort by which field valid values include last_accessed, size, name | [optional] 
 **permissions** | **character**| permissions valid values include read, read_write, write, admin | [optional] 
 **tag** | list( **character** )| tag to search for, more than one can be included | [optional] 
 **exclude.tag** | list( **character** )| tags to exclude matching array in results, more than one can be included | [optional] 
 **file.type** | list( **character** )| file_type to search for, more than one can be included | [optional] 
 **exclude.file.type** | list( **character** )| file_type to exclude matching array in results, more than one can be included | [optional] 
 **file.property** | list( **character** )| file_property key-value pair (comma separated, i.e. key,value) to search for, more than one can be included | [optional] 

### Return type

[**ArrayBrowserData**](ArrayBrowserData.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Array of array info that has been shared publically |  -  |
| **0** | error response |  -  |

# **ArraysBrowserPublicSidebarGet**
> ArrayBrowserSidebar ArraysBrowserPublicSidebarGet()



Fetch a sidebar of all arrays that have been shared publically

### Example
```R
library(tiledbcloud)


api.instance <- ArrayApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$ArraysBrowserPublicSidebarGet()
dput(result)
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ArrayBrowserSidebar**](ArrayBrowserSidebar.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Array of array info that has been shared publically |  -  |
| **0** | error response |  -  |

# **ArraysBrowserSharedGet**
> ArrayBrowserData ArraysBrowserSharedGet(page=var.page, per.page=var.per.page, search=var.search, namespace=var.namespace, orderby=var.orderby, permissions=var.permissions, tag=var.tag, exclude.tag=var.exclude.tag, file.type=var.file.type, exclude.file.type=var.exclude.file.type, file.property=var.file.property)



Fetch a list of all arrays that have been shared with the user

### Example
```R
library(tiledbcloud)

var.page <- 56 # integer | pagination offset
var.per.page <- 56 # integer | pagination limit
var.search <- 'search_example' # character | search string that will look at name, namespace or description fields
var.namespace <- 'namespace_example' # character | namespace
var.orderby <- 'orderby_example' # character | sort by which field valid values include last_accessed, size, name
var.permissions <- 'permissions_example' # character | permissions valid values include read, read_write, write, admin
var.tag <- list("inner_example") # array[character] | tag to search for, more than one can be included
var.exclude.tag <- list("inner_example") # array[character] | tags to exclude matching array in results, more than one can be included
var.file.type <- list("inner_example") # array[character] | file_type to search for, more than one can be included
var.exclude.file.type <- list("inner_example") # array[character] | file_type to exclude matching array in results, more than one can be included
var.file.property <- list("inner_example") # array[character] | file_property key-value pair (comma separated, i.e. key,value) to search for, more than one can be included

api.instance <- ArrayApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$ArraysBrowserSharedGet(page=var.page, per.page=var.per.page, search=var.search, namespace=var.namespace, orderby=var.orderby, permissions=var.permissions, tag=var.tag, exclude.tag=var.exclude.tag, file.type=var.file.type, exclude.file.type=var.exclude.file.type, file.property=var.file.property)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **integer**| pagination offset | [optional] 
 **per.page** | **integer**| pagination limit | [optional] 
 **search** | **character**| search string that will look at name, namespace or description fields | [optional] 
 **namespace** | **character**| namespace | [optional] 
 **orderby** | **character**| sort by which field valid values include last_accessed, size, name | [optional] 
 **permissions** | **character**| permissions valid values include read, read_write, write, admin | [optional] 
 **tag** | list( **character** )| tag to search for, more than one can be included | [optional] 
 **exclude.tag** | list( **character** )| tags to exclude matching array in results, more than one can be included | [optional] 
 **file.type** | list( **character** )| file_type to search for, more than one can be included | [optional] 
 **exclude.file.type** | list( **character** )| file_type to exclude matching array in results, more than one can be included | [optional] 
 **file.property** | list( **character** )| file_property key-value pair (comma separated, i.e. key,value) to search for, more than one can be included | [optional] 

### Return type

[**ArrayBrowserData**](ArrayBrowserData.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Array of array info that has been shared with the user |  -  |
| **0** | error response |  -  |

# **ArraysBrowserSharedSidebarGet**
> ArrayBrowserSidebar ArraysBrowserSharedSidebarGet()



Fetch a list of all arrays that have been shared with the user

### Example
```R
library(tiledbcloud)


api.instance <- ArrayApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$ArraysBrowserSharedSidebarGet()
dput(result)
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ArrayBrowserSidebar**](ArrayBrowserSidebar.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Array of array info that has been shared with the user |  -  |
| **0** | error response |  -  |

# **ArraysNamespaceArrayEndTimestampsGet**
> ArrayEndTimestampData ArraysNamespaceArrayEndTimestampsGet(namespace, array, page=var.page, per.page=var.per.page)



retrieve a list of timestamps from the array fragment info listing in milliseconds, paginated

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.array <- 'array_example' # character | name/uri of array that is url-encoded
var.page <- 56 # integer | pagination offset
var.per.page <- 56 # integer | pagination limit

api.instance <- ArrayApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$ArraysNamespaceArrayEndTimestampsGet(var.namespace, var.array, page=var.page, per.page=var.per.page)
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

# **ConsolidateArray**
> ConsolidateArray(namespace, array, tiledb.config)



consolidate an array at a specified URI

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.array <- 'array_example' # character | name/uri of array that is url-encoded
var.tiledb.config <- TileDBConfig$new(TODO) # TileDBConfig | tiledb configuration

api.instance <- ArrayApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$ConsolidateArray(var.namespace, var.array, var.tiledb.config)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 
 **array** | **character**| name/uri of array that is url-encoded | 
 **tiledb.config** | [**TileDBConfig**](TileDBConfig.md)| tiledb configuration | 

### Return type

void (empty response body)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **204** | array consolidated successfully |  -  |
| **0** | error response |  -  |

# **CreateArray**
> CreateArray(namespace, array, content.type, array.schema, X_TILEDB_CLOUD_ACCESS_CREDENTIALS_NAME=var.X_TILEDB_CLOUD_ACCESS_CREDENTIALS_NAME)



create a array schema at a specified URI registered to a group/project

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.array <- 'array_example' # character | name/uri of array that is url-encoded
var.content.type <- 'application/json' # character | Content Type of input and return mime
var.array.schema <- ArraySchema$new("uri_example", list(123), ArrayType$new(), Layout$new(), Layout$new(), 123, FilterPipeline$new(list(Filter$new(FilterType$new(), Filter_data$new(123, 123, 123, 123, 123, 123, 123, 123, 123, 123)))), FilterPipeline$new(list(Filter$new(FilterType$new(), Filter_data$new(123, 123, 123, 123, 123, 123, 123, 123, 123, 123)))), Domain$new(Datatype$new(), Layout$new(), Layout$new(), list(Dimension$new("name_example", Datatype$new(), DomainArray$new(list(123), list(123), list(123), list(123), list(123), list(123), list(123), list(123), list(123), list(123)), "nullTileExtent_example", Dimension_tileExtent$new(123, 123, 123, 123, 123, 123, 123, 123, 123, 123), FilterPipeline$new(list(Filter$new(FilterType$new(), Filter_data$new(123, 123, 123, 123, 123, 123, 123, 123, 123, 123))))))), list(Attribute$new("name_example", Datatype$new(), FilterPipeline$new(list(Filter$new(FilterType$new(), Filter_data$new(123, 123, 123, 123, 123, 123, 123, 123, 123, 123)))), 123, list(123))), "allowsDuplicates_example") # ArraySchema | ArraySchema being created
var.X_TILEDB_CLOUD_ACCESS_CREDENTIALS_NAME <- 'X_TILEDB_CLOUD_ACCESS_CREDENTIALS_NAME_example' # character | Optional registered access credentials to use for creation

api.instance <- ArrayApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$CreateArray(var.namespace, var.array, var.content.type, var.array.schema, X_TILEDB_CLOUD_ACCESS_CREDENTIALS_NAME=var.X_TILEDB_CLOUD_ACCESS_CREDENTIALS_NAME)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 
 **array** | **character**| name/uri of array that is url-encoded | 
 **content.type** | **character**| Content Type of input and return mime | [default to &#39;application/json&#39;]
 **array.schema** | [**ArraySchema**](ArraySchema.md)| ArraySchema being created | 
 **X_TILEDB_CLOUD_ACCESS_CREDENTIALS_NAME** | **character**| Optional registered access credentials to use for creation | [optional] 

### Return type

void (empty response body)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **204** | schema created successfully |  -  |
| **0** | error response |  -  |

# **DeleteArray**
> DeleteArray(namespace, array, content.type)



delete a array

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.array <- 'array_example' # character | name/uri of array that is url-encoded
var.content.type <- 'application/json' # character | Content Type of input and return mime

api.instance <- ArrayApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$DeleteArray(var.namespace, var.array, var.content.type)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 
 **array** | **character**| name/uri of array that is url-encoded | 
 **content.type** | **character**| Content Type of input and return mime | [default to &#39;application/json&#39;]

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
| **204** | delete array successful |  -  |
| **0** | error response |  -  |

# **DeregisterArray**
> DeregisterArray(namespace, array)



deregister a array

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.array <- 'array_example' # character | name/uri of array that is url-encoded

api.instance <- ArrayApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$DeregisterArray(var.namespace, var.array)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 
 **array** | **character**| name/uri of array that is url-encoded | 

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
| **204** | deregistered array successful |  -  |
| **0** | error response |  -  |

# **GetActivityLogById**
> ArrayActivityLog GetActivityLogById(namespace, array, id)



get activity log by id

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.array <- 'array_example' # character | name/uri of array that is url-encoded
var.id <- 'id_example' # character | id of the activity

api.instance <- ArrayApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$GetActivityLogById(var.namespace, var.array, var.id)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 
 **array** | **character**| name/uri of array that is url-encoded | 
 **id** | **character**| id of the activity | 

### Return type

[**ArrayActivityLog**](ArrayActivityLog.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | array activity |  -  |
| **0** | error response |  -  |

# **GetAllArrayMetadata**
> array[ArrayInfo] GetAllArrayMetadata(public.share=var.public.share)



get all array metadata user has access to

### Example
```R
library(tiledbcloud)

var.public.share <- 'public.share_example' # character | Public share values can be one of exclude, only

api.instance <- ArrayApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$GetAllArrayMetadata(public.share=var.public.share)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **public.share** | **character**| Public share values can be one of exclude, only | [optional] 

### Return type

[**array[ArrayInfo]**](ArrayInfo.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | array metadata for all arrays user has access to |  -  |
| **0** | error response |  -  |

# **GetArray**
> ArraySchema GetArray(namespace, array, content.type)



get an ArraySchema using a url encoded uri

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.array <- 'array_example' # character | name/uri of array that is url-encoded
var.content.type <- 'application/json' # character | Content Type of input and return mime

api.instance <- ArrayApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$GetArray(var.namespace, var.array, var.content.type)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 
 **array** | **character**| name/uri of array that is url-encoded | 
 **content.type** | **character**| Content Type of input and return mime | [default to &#39;application/json&#39;]

### Return type

[**ArraySchema**](ArraySchema.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/capnp

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | get ArraySchema |  -  |
| **0** | error response |  -  |

# **GetArrayMaxBufferSizes**
> MaxBufferSizes GetArrayMaxBufferSizes(namespace, array, subarray, content.type, x.payer=var.x.payer)



get the max buffer sizes of an array for a subarray

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.array <- 'array_example' # character | name/uri of array that is url-encoded
var.subarray <- 'subarray_example' # character | CSV string of subarray to get max buffer sizes for
var.content.type <- 'application/json' # character | Content Type of input and return mime
var.x.payer <- 'x.payer_example' # character | Name of organization or user who should be charged for this request

api.instance <- ArrayApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$GetArrayMaxBufferSizes(var.namespace, var.array, var.subarray, var.content.type, x.payer=var.x.payer)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 
 **array** | **character**| name/uri of array that is url-encoded | 
 **subarray** | **character**| CSV string of subarray to get max buffer sizes for | 
 **content.type** | **character**| Content Type of input and return mime | [default to &#39;application/json&#39;]
 **x.payer** | **character**| Name of organization or user who should be charged for this request | [optional] 

### Return type

[**MaxBufferSizes**](MaxBufferSizes.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | get the max buffer sizes of an array for a subarray |  -  |
| **0** | error response |  -  |

# **GetArrayMetaDataJson**
> object GetArrayMetaDataJson(namespace, array, length=var.length, end.timestamp=var.end.timestamp)



get metadata from the array in json format

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.array <- 'array_example' # character | name/uri of array that is url-encoded
var.length <- 56 # integer | (optional) limit character length of returned values
var.end.timestamp <- 56 # integer | Milliseconds since Unix epoch, metadata will use open_at functionality to open array at the specific timestamp

api.instance <- ArrayApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$GetArrayMetaDataJson(var.namespace, var.array, length=var.length, end.timestamp=var.end.timestamp)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 
 **array** | **character**| name/uri of array that is url-encoded | 
 **length** | **integer**| (optional) limit character length of returned values | [optional] 
 **end.timestamp** | **integer**| Milliseconds since Unix epoch, metadata will use open_at functionality to open array at the specific timestamp | [optional] 

### Return type

**object**

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | get array metadata |  -  |
| **0** | error response |  -  |

# **GetArrayMetadata**
> ArrayInfo GetArrayMetadata(namespace, array)



get metadata on an array

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.array <- 'array_example' # character | name/uri of array that is url-encoded

api.instance <- ArrayApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$GetArrayMetadata(var.namespace, var.array)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 
 **array** | **character**| name/uri of array that is url-encoded | 

### Return type

[**ArrayInfo**](ArrayInfo.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | array metadata for an array |  -  |
| **0** | error response |  -  |

# **GetArrayMetadataCapnp**
> ArrayMetadata GetArrayMetadataCapnp(namespace, array)



get metadata on an array

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.array <- 'array_example' # character | name/uri of array that is url-encoded

api.instance <- ArrayApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$GetArrayMetadataCapnp(var.namespace, var.array)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 
 **array** | **character**| name/uri of array that is url-encoded | 

### Return type

[**ArrayMetadata**](ArrayMetadata.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/capnp

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | array metadata for an array |  -  |
| **0** | error response |  -  |

# **GetArrayNonEmptyDomain**
> NonEmptyDomain GetArrayNonEmptyDomain(namespace, array, content.type, x.payer=var.x.payer)



get the non empty domain of an array

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.array <- 'array_example' # character | name/uri of array that is url-encoded
var.content.type <- 'application/json' # character | Content Type of input and return mime
var.x.payer <- 'x.payer_example' # character | Name of organization or user who should be charged for this request

api.instance <- ArrayApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$GetArrayNonEmptyDomain(var.namespace, var.array, var.content.type, x.payer=var.x.payer)
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

[**NonEmptyDomain**](NonEmptyDomain.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | get the non empty domain of an array |  -  |
| **0** | error response |  -  |

# **GetArrayNonEmptyDomainJson**
> object GetArrayNonEmptyDomainJson(namespace, array)



get non-empty domain from the array in json format

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.array <- 'array_example' # character | name/uri of array that is url-encoded

api.instance <- ArrayApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$GetArrayNonEmptyDomainJson(var.namespace, var.array)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 
 **array** | **character**| name/uri of array that is url-encoded | 

### Return type

**object**

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | get array non-empty domaim |  -  |
| **0** | error response |  -  |

# **GetArraySampleData**
> ArraySample GetArraySampleData(namespace, array, samples=5.0)



get an sample set of data from the array

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.array <- 'array_example' # character | name/uri of array that is url-encoded
var.samples <- 5.0 # numeric | Number of sample results to return

api.instance <- ArrayApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$GetArraySampleData(var.namespace, var.array, samples=var.samples)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 
 **array** | **character**| name/uri of array that is url-encoded | 
 **samples** | **numeric**| Number of sample results to return | [optional] [default to 5.0]

### Return type

[**ArraySample**](ArraySample.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | get array sample data |  -  |
| **0** | error response |  -  |

# **GetArraySharingPolicies**
> array[ArraySharing] GetArraySharingPolicies(namespace, array)



Get all sharing details of the array

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.array <- 'array_example' # character | name/uri of array that is url-encoded

api.instance <- ArrayApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$GetArraySharingPolicies(var.namespace, var.array)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 
 **array** | **character**| name/uri of array that is url-encoded | 

### Return type

[**array[ArraySharing]**](ArraySharing.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | List of all specific sharing policies |  -  |
| **404** | Array does not exist or user does not have permissions to view array sharing policies |  -  |
| **0** | error response |  -  |

# **GetArraysInNamespace**
> array[ArrayInfo] GetArraysInNamespace(namespace)



get metadata on all arrays in a namespace

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)

api.instance <- ArrayApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$GetArraysInNamespace(var.namespace)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 

### Return type

[**array[ArrayInfo]**](ArrayInfo.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | array metadata for all arrays in a namespace |  -  |
| **0** | error response |  -  |

# **GetFragmentEndTimestamp**
> integer GetFragmentEndTimestamp(namespace, array, end.timestamp=var.end.timestamp)



Get fragment end_timestamp on an array, will search for the closest end_timestamp to the timestamp asked

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.array <- 'array_example' # character | name/uri of array that is url-encoded
var.end.timestamp <- 56 # integer | Milliseconds since Unix epoch

api.instance <- ArrayApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$GetFragmentEndTimestamp(var.namespace, var.array, end.timestamp=var.end.timestamp)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 
 **array** | **character**| name/uri of array that is url-encoded | 
 **end.timestamp** | **integer**| Milliseconds since Unix epoch | [optional] 

### Return type

**integer**

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | fragment end_timestamp on an array |  -  |
| **0** | error response |  -  |

# **GetLastAccessedArrays**
> array[LastAccessedArray] GetLastAccessedArrays()



### Example
```R
library(tiledbcloud)


api.instance <- ArrayApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$GetLastAccessedArrays()
dput(result)
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**array[LastAccessedArray]**](LastAccessedArray.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | gets last accessed arrays |  -  |
| **0** | error response |  -  |

# **RegisterArray**
> RegisterArray(namespace, array, array.metadata)



register an array at a specified URI registered to the given namespace

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.array <- 'array_example' # character | name/uri of array that is url-encoded
var.array.metadata <- ArrayInfoUpdate$new("description_example", "name_example", "uri_example", FileType$new(), TODO, "access_credentials_name_example", "logo_example", list("tags_example"), "license_id_example", "license_text_example", "read_only_example") # ArrayInfoUpdate | metadata associated with array

api.instance <- ArrayApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$RegisterArray(var.namespace, var.array, var.array.metadata)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 
 **array** | **character**| name/uri of array that is url-encoded | 
 **array.metadata** | [**ArrayInfoUpdate**](ArrayInfoUpdate.md)| metadata associated with array | 

### Return type

void (empty response body)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **204** | schema registered successfully |  -  |
| **0** | error response |  -  |

# **ShareArray**
> ShareArray(namespace, array, array.sharing)



Share an array with a user

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.array <- 'array_example' # character | name/uri of array that is url-encoded
var.array.sharing <- ArraySharing$new(list(ArrayActions$new()), "namespace_example", "namespace_type_example") # ArraySharing | Namespace and list of permissions to share with. An empty list of permissions will remove the namespace, if permissions already exist they will be deleted then new ones added. In the event of a failure, the new polcies will be rolled back to prevent partial policies, and its likely the array will not be shared with the namespace at all

api.instance <- ArrayApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$ShareArray(var.namespace, var.array, var.array.sharing)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 
 **array** | **character**| name/uri of array that is url-encoded | 
 **array.sharing** | [**ArraySharing**](ArraySharing.md)| Namespace and list of permissions to share with. An empty list of permissions will remove the namespace, if permissions already exist they will be deleted then new ones added. In the event of a failure, the new polcies will be rolled back to prevent partial policies, and its likely the array will not be shared with the namespace at all | 

### Return type

void (empty response body)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **204** | Array shared successfully |  -  |
| **404** | Array does not exist or user does not have permissions to share array |  -  |
| **0** | error response |  -  |

# **UpdateArrayMetadata**
> UpdateArrayMetadata(namespace, array, array.metadata)



update metadata on an array

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.array <- 'array_example' # character | name/uri of array that is url-encoded
var.array.metadata <- ArrayInfoUpdate$new("description_example", "name_example", "uri_example", FileType$new(), TODO, "access_credentials_name_example", "logo_example", list("tags_example"), "license_id_example", "license_text_example", "read_only_example") # ArrayInfoUpdate | array metadata to update

api.instance <- ArrayApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$UpdateArrayMetadata(var.namespace, var.array, var.array.metadata)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 
 **array** | **character**| name/uri of array that is url-encoded | 
 **array.metadata** | [**ArrayInfoUpdate**](ArrayInfoUpdate.md)| array metadata to update | 

### Return type

void (empty response body)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **204** | array metadata updated successfully |  -  |
| **0** | error response |  -  |

# **UpdateArrayMetadataCapnp**
> UpdateArrayMetadataCapnp(namespace, array, array.metadata.entries)



update metadata on an array

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.array <- 'array_example' # character | name/uri of array that is url-encoded
var.array.metadata.entries <- ArrayMetadata$new(list(ArrayMetadataEntry$new("key_example", "type_example", 123, list(123), "del_example"))) # ArrayMetadata | List of metadata entries

api.instance <- ArrayApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$UpdateArrayMetadataCapnp(var.namespace, var.array, var.array.metadata.entries)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 
 **array** | **character**| name/uri of array that is url-encoded | 
 **array.metadata.entries** | [**ArrayMetadata**](ArrayMetadata.md)| List of metadata entries | 

### Return type

void (empty response body)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: application/json, application/capnp
 - **Accept**: application/json, application/capnp

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | array metadata updated successfully |  -  |
| **0** | error response |  -  |

# **VacuumArray**
> VacuumArray(namespace, array, tiledb.config)



vacuum an array at a specified URI

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.array <- 'array_example' # character | name/uri of array that is url-encoded
var.tiledb.config <- TileDBConfig$new(TODO) # TileDBConfig | tiledb configuration

api.instance <- ArrayApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$VacuumArray(var.namespace, var.array, var.tiledb.config)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 
 **array** | **character**| name/uri of array that is url-encoded | 
 **tiledb.config** | [**TileDBConfig**](TileDBConfig.md)| tiledb configuration | 

### Return type

void (empty response body)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **204** | array vacuumed successfully |  -  |
| **0** | error response |  -  |

