# UdfApi

All URIs are relative to *http://localhost/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**GetUDFInfo**](UdfApi.md#GetUDFInfo) | **GET** /udf/{namespace}/{name} | 
[**GetUDFInfoList**](UdfApi.md#GetUDFInfoList) | **GET** /udfs | 
[**GetUDFInfoSharingPolicies**](UdfApi.md#GetUDFInfoSharingPolicies) | **GET** /udf/{namespace}/{name}/share | 
[**RegisterUDFInfo**](UdfApi.md#RegisterUDFInfo) | **POST** /udf/{namespace}/{name} | 
[**ShareUDFInfo**](UdfApi.md#ShareUDFInfo) | **PATCH** /udf/{namespace}/{name}/share | 
[**SubmitGenericUDF**](UdfApi.md#SubmitGenericUDF) | **POST** /udfs/generic/{namespace} | 
[**SubmitUDF**](UdfApi.md#SubmitUDF) | **POST** /arrays/{namespace}/{array}/udf/submit | 
[**UpdateUDFInfo**](UdfApi.md#UpdateUDFInfo) | **PATCH** /udf/{namespace}/{name} | 


# **GetUDFInfo**
> UDFInfo GetUDFInfo(namespace, name)



get a specific UDF in the given namespace

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.name <- 'name_example' # character | name to register udf under

api.instance <- UdfApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$GetUDFInfo(var.namespace, var.name)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 
 **name** | **character**| name to register udf under | 

### Return type

[**UDFInfo**](UDFInfo.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | UDFInfo was retrieved successfully |  -  |
| **404** | udf not found |  -  |
| **0** | error response |  -  |

# **GetUDFInfoList**
> UDFListingData GetUDFInfoList(namespace=var.namespace, created.by=var.created.by, page=var.page, per.page=var.per.page, type=var.type, search=var.search, orderby=var.orderby, tag=var.tag)



get a all UDFs accessible to the user

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace to filter
var.created.by <- 'created.by_example' # character | username to filter
var.page <- 56 # integer | pagination offset
var.per.page <- 56 # integer | pagination limit
var.type <- 'type_example' # character | udf type, \"generic\", \"single_array\"
var.search <- 'search_example' # character | search string that will look at name, namespace or description fields
var.orderby <- 'orderby_example' # character | sort by which field valid values include created_at, last_used, name
var.tag <- list("inner_example") # array[character] | tag to search for, more than one can be included

api.instance <- UdfApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$GetUDFInfoList(namespace=var.namespace, created.by=var.created.by, page=var.page, per.page=var.per.page, type=var.type, search=var.search, orderby=var.orderby, tag=var.tag)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace to filter | [optional] 
 **created.by** | **character**| username to filter | [optional] 
 **page** | **integer**| pagination offset | [optional] 
 **per.page** | **integer**| pagination limit | [optional] 
 **type** | **character**| udf type, \&quot;generic\&quot;, \&quot;single_array\&quot; | [optional] 
 **search** | **character**| search string that will look at name, namespace or description fields | [optional] 
 **orderby** | **character**| sort by which field valid values include created_at, last_used, name | [optional] 
 **tag** | list( **character** )| tag to search for, more than one can be included | [optional] 

### Return type

[**UDFListingData**](UDFListingData.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | UDFInfo list |  -  |
| **404** | udf not found |  -  |
| **0** | error response |  -  |

# **GetUDFInfoSharingPolicies**
> array[UDFSharing] GetUDFInfoSharingPolicies(namespace, name)



Get all sharing details of the udf

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.name <- 'name_example' # character | name of UDFInfo

api.instance <- UdfApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$GetUDFInfoSharingPolicies(var.namespace, var.name)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 
 **name** | **character**| name of UDFInfo | 

### Return type

[**array[UDFSharing]**](UDFSharing.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | List of all specific sharing policies |  -  |
| **404** | UDF does not exist or user does not have permissions to view array sharing policies |  -  |
| **0** | error response |  -  |

# **RegisterUDFInfo**
> RegisterUDFInfo(namespace, name, udf)



register a UDF in the given namespace

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.name <- 'name_example' # character | name to register udf under
var.udf <- UDFInfoUpdate$new("name_example", UDFLanguage$new(), "version_example", "image_name_example", UDFType$new(), "exec_example", "exec_raw_example", "readme_example", "license_id_example", "license_text_example", list("tags_example")) # UDFInfoUpdate | udf to register

api.instance <- UdfApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$RegisterUDFInfo(var.namespace, var.name, var.udf)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 
 **name** | **character**| name to register udf under | 
 **udf** | [**UDFInfoUpdate**](UDFInfoUpdate.md)| udf to register | 

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
| **204** | udf registered successfully |  -  |
| **0** | error response |  -  |

# **ShareUDFInfo**
> ShareUDFInfo(namespace, name, udf.sharing)



Share a UDF with a user

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.name <- 'name_example' # character | name of UDFInfo
var.udf.sharing <- UDFSharing$new(list(UDFActions$new()), "namespace_example", "namespace_type_example") # UDFSharing | Namespace and list of permissions to share with. An empty list of permissions will remove the namespace, if permissions already exist they will be deleted then new ones added. In the event of a failure, the new polcies will be rolled back to prevent partial policies, and its likely the udf will not be shared with the namespace at all

api.instance <- UdfApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$ShareUDFInfo(var.namespace, var.name, var.udf.sharing)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 
 **name** | **character**| name of UDFInfo | 
 **udf.sharing** | [**UDFSharing**](UDFSharing.md)| Namespace and list of permissions to share with. An empty list of permissions will remove the namespace, if permissions already exist they will be deleted then new ones added. In the event of a failure, the new polcies will be rolled back to prevent partial policies, and its likely the udf will not be shared with the namespace at all | 

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
| **204** | UDF shared successfully |  -  |
| **404** | UDF does not exist or user does not have permissions to share udf |  -  |
| **0** | error response |  -  |

# **SubmitGenericUDF**
> data.frame SubmitGenericUDF(namespace, udf, accept.encoding=var.accept.encoding)



submit a generic UDF in the given namespace

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.udf <- GenericUDF$new("udf_info_name_example", UDFLanguage$new(), "version_example", "image_name_example", "exec_example", "exec_raw_example", "argument_example", UDFResultType$new(), "task_name_example") # GenericUDF | udf to run
var.accept.encoding <- 'accept.encoding_example' # character | Encoding to use

api.instance <- UdfApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$SubmitGenericUDF(var.namespace, var.udf, accept.encoding=var.accept.encoding)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 
 **udf** | [**GenericUDF**](GenericUDF.md)| udf to run | 
 **accept.encoding** | **character**| Encoding to use | [optional] 

### Return type

**data.frame**

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/octet-stream

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | udf completed and the udf-type specific result is returned |  * X-TILEDB-CLOUD-TASK-ID - Task ID for just completed request <br>  |
| **0** | error response |  * X-TILEDB-CLOUD-TASK-ID - Task ID for just request if task was started <br>  |

# **SubmitUDF**
> data.frame SubmitUDF(namespace, array, udf, x.payer=var.x.payer, accept.encoding=var.accept.encoding)



send a UDF to run against a specified array/URI registered to a group/project

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.array <- 'array_example' # character | name/uri of array that is url-encoded
var.udf <- UDF$new("udf_info_name_example", UDFLanguage$new(), "version_example", "image_name_example", UDFRanges$new(Layout$new(), list(list(123))), UDFSubarray$new(Layout$new(), list(UDFSubarrayRange$new(123, DimensionCoordinate$new(123, 123, 123, 123, 123, 123, 123, 123, 123, 123), DimensionCoordinate$new(123, 123, 123, 123, 123, 123, 123, 123, 123, 123)))), "exec_example", "exec_raw_example", list("buffers_example"), UDFResultType$new(), "task_name_example") # UDF | udf to run
var.x.payer <- 'x.payer_example' # character | Name of organization or user who should be charged for this request
var.accept.encoding <- 'accept.encoding_example' # character | Encoding to use

api.instance <- UdfApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$SubmitUDF(var.namespace, var.array, var.udf, x.payer=var.x.payer, accept.encoding=var.accept.encoding)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 
 **array** | **character**| name/uri of array that is url-encoded | 
 **udf** | [**UDF**](UDF.md)| udf to run | 
 **x.payer** | **character**| Name of organization or user who should be charged for this request | [optional] 
 **accept.encoding** | **character**| Encoding to use | [optional] 

### Return type

**data.frame**

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/octet-stream

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | udf completed and the udf-type specific result is returned |  * X-TILEDB-CLOUD-TASK-ID - Task ID for just completed request <br>  |
| **0** | error response |  * X-TILEDB-CLOUD-TASK-ID - Task ID for just request if task was started <br>  |

# **UpdateUDFInfo**
> UpdateUDFInfo(namespace, name, udf)



updated an existing registerd UDF in the given namespace

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.name <- 'name_example' # character | name to register udf under
var.udf <- UDFInfoUpdate$new("name_example", UDFLanguage$new(), "version_example", "image_name_example", UDFType$new(), "exec_example", "exec_raw_example", "readme_example", "license_id_example", "license_text_example", list("tags_example")) # UDFInfoUpdate | udf to update

api.instance <- UdfApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$UpdateUDFInfo(var.namespace, var.name, var.udf)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 
 **name** | **character**| name to register udf under | 
 **udf** | [**UDFInfoUpdate**](UDFInfoUpdate.md)| udf to update | 

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
| **204** | udf updated successfully |  -  |
| **0** | error response |  -  |

