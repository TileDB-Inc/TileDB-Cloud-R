# UdfApi

All URIs are relative to *http://localhost/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**DeleteUDFInfo**](UdfApi.md#DeleteUDFInfo) | **DELETE** /udf/{namespace}/{name} | 
[**GetUDFInfo**](UdfApi.md#GetUDFInfo) | **GET** /udf/{namespace}/{name} | 
[**GetUDFInfoSharingPolicies**](UdfApi.md#GetUDFInfoSharingPolicies) | **GET** /udf/{namespace}/{name}/share | 
[**RegisterUDFInfo**](UdfApi.md#RegisterUDFInfo) | **POST** /udf/{namespace}/{name} | 
[**ShareUDFInfo**](UdfApi.md#ShareUDFInfo) | **PATCH** /udf/{namespace}/{name}/share | 
[**SubmitGenericUDF**](UdfApi.md#SubmitGenericUDF) | **POST** /udfs/generic/{namespace} | 
[**SubmitMultiArrayUDF**](UdfApi.md#SubmitMultiArrayUDF) | **POST** /udfs/arrays/{namespace} | 
[**SubmitUDF**](UdfApi.md#SubmitUDF) | **POST** /arrays/{namespace}/{array}/udf/submit | 
[**UdfNamespaceArrayEndTimestampsGet**](UdfApi.md#UdfNamespaceArrayEndTimestampsGet) | **GET** /udf/{namespace}/{array}/end_timestamps | 
[**UpdateUDFInfo**](UdfApi.md#UpdateUDFInfo) | **PATCH** /udf/{namespace}/{name} | 


# **DeleteUDFInfo**
> DeleteUDFInfo(namespace, name)



delete a registerd UDF, this will remove all sharing and can not be undone

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
api.instance$DeleteUDFInfo(var.namespace, var.name)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 
 **name** | **character**| name to register udf under | 

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
| **202** | UDF delete successfully |  -  |
| **0** | error response |  -  |

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
var.udf <- GenericUDF$new("udf_info_name_example", UDFLanguage$new(), "version_example", "image_name_example", "exec_example", "exec_raw_example", "argument_example", list("stored_param_uuids_example"), ResultFormat$new(), "task_name_example", "store_results_example") # GenericUDF | udf to run
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
| **0** | error response |  * X-TILEDB-CLOUD-TASK-ID - Task ID for just completed request <br>  |

# **SubmitMultiArrayUDF**
> data.frame SubmitMultiArrayUDF(namespace, udf, accept.encoding=var.accept.encoding)



submit a multi-array UDF in the given namespace

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.udf <- MultiArrayUDF$new("udf_info_name_example", UDFLanguage$new(), "version_example", "image_name_example", "exec_example", "exec_raw_example", ResultFormat$new(), "task_name_example", "argument_example", list("stored_param_uuids_example"), "store_results_example", QueryRanges$new(Layout$new(), list(list(123))), UDFSubarray$new(Layout$new(), list(UDFSubarrayRange$new(123, DimensionCoordinate$new(123, 123, 123, 123, 123, 123, 123, 123, 123, 123), DimensionCoordinate$new(123, 123, 123, 123, 123, 123, 123, 123, 123, 123)))), list("buffers_example"), list(UDFArrayDetails$new("uri_example", QueryRanges$new(Layout$new(), list(list(123))), list("buffers_example")))) # MultiArrayUDF | udf to run
var.accept.encoding <- 'accept.encoding_example' # character | Encoding to use

api.instance <- UdfApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$SubmitMultiArrayUDF(var.namespace, var.udf, accept.encoding=var.accept.encoding)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 
 **udf** | [**MultiArrayUDF**](MultiArrayUDF.md)| udf to run | 
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
| **0** | error response |  * X-TILEDB-CLOUD-TASK-ID - Task ID for just completed request <br>  |

# **SubmitUDF**
> data.frame SubmitUDF(namespace, array, udf, x.payer=var.x.payer, accept.encoding=var.accept.encoding, v2=var.v2)



send a UDF to run against a specified array/URI registered to a group/project

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.array <- 'array_example' # character | name/uri of array that is url-encoded
var.udf <- MultiArrayUDF$new("udf_info_name_example", UDFLanguage$new(), "version_example", "image_name_example", "exec_example", "exec_raw_example", ResultFormat$new(), "task_name_example", "argument_example", list("stored_param_uuids_example"), "store_results_example", QueryRanges$new(Layout$new(), list(list(123))), UDFSubarray$new(Layout$new(), list(UDFSubarrayRange$new(123, DimensionCoordinate$new(123, 123, 123, 123, 123, 123, 123, 123, 123, 123), DimensionCoordinate$new(123, 123, 123, 123, 123, 123, 123, 123, 123, 123)))), list("buffers_example"), list(UDFArrayDetails$new("uri_example", QueryRanges$new(Layout$new(), list(list(123))), list("buffers_example")))) # MultiArrayUDF | udf to run
var.x.payer <- 'x.payer_example' # character | Name of organization or user who should be charged for this request
var.accept.encoding <- 'accept.encoding_example' # character | Encoding to use
var.v2 <- 'v2_example' # character | flag to indicate if v2 array udfs should be used, currently in beta testing. Setting any value will enable v2 array udfs

api.instance <- UdfApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$SubmitUDF(var.namespace, var.array, var.udf, x.payer=var.x.payer, accept.encoding=var.accept.encoding, v2=var.v2)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 
 **array** | **character**| name/uri of array that is url-encoded | 
 **udf** | [**MultiArrayUDF**](MultiArrayUDF.md)| udf to run | 
 **x.payer** | **character**| Name of organization or user who should be charged for this request | [optional] 
 **accept.encoding** | **character**| Encoding to use | [optional] 
 **v2** | **character**| flag to indicate if v2 array udfs should be used, currently in beta testing. Setting any value will enable v2 array udfs | [optional] 

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
| **0** | error response |  * X-TILEDB-CLOUD-TASK-ID - Task ID for just completed request <br>  |

# **UdfNamespaceArrayEndTimestampsGet**
> ArrayEndTimestampData UdfNamespaceArrayEndTimestampsGet(namespace, array, page=var.page, per.page=var.per.page)



retrieve a list of timestamps from the array fragment info listing in milliseconds, paginated

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.array <- 'array_example' # character | name/uri of array that is url-encoded
var.page <- 56 # integer | pagination offset
var.per.page <- 56 # integer | pagination limit

api.instance <- UdfApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$UdfNamespaceArrayEndTimestampsGet(var.namespace, var.array, page=var.page, per.page=var.per.page)
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

