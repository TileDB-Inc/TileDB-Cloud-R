# FavoritesApi

All URIs are relative to *http://localhost/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**AddArrayFavorite**](FavoritesApi.md#AddArrayFavorite) | **POST** /arrays/favorites | 
[**AddMLModelFavorite**](FavoritesApi.md#AddMLModelFavorite) | **POST** /mlmodels/favorites | 
[**AddNotebookFavorite**](FavoritesApi.md#AddNotebookFavorite) | **POST** /notebooks/favorites | 
[**AddUDFFavorite**](FavoritesApi.md#AddUDFFavorite) | **POST** /udfs/favorites | 
[**DeleteArrayFavorite**](FavoritesApi.md#DeleteArrayFavorite) | **DELETE** /arrays/favorites/{id} | 
[**DeleteMLModelFavorite**](FavoritesApi.md#DeleteMLModelFavorite) | **DELETE** /mlmodels/favorites/{id} | 
[**DeleteNotebookFavorite**](FavoritesApi.md#DeleteNotebookFavorite) | **DELETE** /notebooks/favorites/{id} | 
[**DeleteUDFFavorite**](FavoritesApi.md#DeleteUDFFavorite) | **DELETE** /udfs/favorites/{id} | 
[**GetArrayFavorite**](FavoritesApi.md#GetArrayFavorite) | **GET** /arrays/favorites/{id} | 
[**GetArrayFavoriteForArray**](FavoritesApi.md#GetArrayFavoriteForArray) | **GET** /arrays/favorites/{namespace}/{name} | 
[**GetMLModelFavorite**](FavoritesApi.md#GetMLModelFavorite) | **GET** /mlmodels/favorites/{id} | 
[**GetMLModelFavoriteForMLModel**](FavoritesApi.md#GetMLModelFavoriteForMLModel) | **GET** /mlmodels/favorites/{namespace}/{name} | 
[**GetNotebookFavorite**](FavoritesApi.md#GetNotebookFavorite) | **GET** /notebooks/favorites/{id} | 
[**GetNotebookFavoriteForNotebook**](FavoritesApi.md#GetNotebookFavoriteForNotebook) | **GET** /notebooks/favorites/{namespace}/{name} | 
[**GetUDFFavorite**](FavoritesApi.md#GetUDFFavorite) | **GET** /udfs/favorites/{id} | 
[**GetUDFFavoriteForUDF**](FavoritesApi.md#GetUDFFavoriteForUDF) | **GET** /udfs/favorites/{namespace}/{name} | 
[**ListArrayFavorites**](FavoritesApi.md#ListArrayFavorites) | **GET** /arrays/favorites | 
[**ListArrayFavoritesUUIDs**](FavoritesApi.md#ListArrayFavoritesUUIDs) | **GET** /arrays/favorites/uuids | 
[**ListMLModelFavorites**](FavoritesApi.md#ListMLModelFavorites) | **GET** /mlmodels/favorites | 
[**ListMLModelFavoritesUUIDs**](FavoritesApi.md#ListMLModelFavoritesUUIDs) | **GET** /mlmodels/favorites/uuids | 
[**ListNotebookFavorites**](FavoritesApi.md#ListNotebookFavorites) | **GET** /notebooks/favorites | 
[**ListNotebookFavoritesUUIDs**](FavoritesApi.md#ListNotebookFavoritesUUIDs) | **GET** /notebooks/favorites/uuids | 
[**ListUDFFavorites**](FavoritesApi.md#ListUDFFavorites) | **GET** /udfs/favorites | 
[**ListUDFFavoritesUUIDs**](FavoritesApi.md#ListUDFFavoritesUUIDs) | **GET** /udfs/favorites/uuids | 


# **AddArrayFavorite**
> AddArrayFavorite(body=var.body)



Add a new array favorite

### Example
```R
library(tiledbcloud)

var.body <- FavoriteCreate$new("name_example", "namespace_example") # FavoriteCreate | 

api.instance <- FavoritesApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$AddArrayFavorite(body=var.body)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**FavoriteCreate**](FavoriteCreate.md)|  | [optional] 

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
| **204** | Item added to favorites successfully |  -  |
| **0** | error response |  -  |

# **AddMLModelFavorite**
> AddMLModelFavorite(body=var.body)



Add a new ML model favorite

### Example
```R
library(tiledbcloud)

var.body <- FavoriteCreate$new("name_example", "namespace_example") # FavoriteCreate | 

api.instance <- FavoritesApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$AddMLModelFavorite(body=var.body)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**FavoriteCreate**](FavoriteCreate.md)|  | [optional] 

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
| **204** | Item added to favorites successfully |  -  |
| **0** | error response |  -  |

# **AddNotebookFavorite**
> AddNotebookFavorite(body=var.body)



Add a new notebook favorite

### Example
```R
library(tiledbcloud)

var.body <- FavoriteCreate$new("name_example", "namespace_example") # FavoriteCreate | 

api.instance <- FavoritesApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$AddNotebookFavorite(body=var.body)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**FavoriteCreate**](FavoriteCreate.md)|  | [optional] 

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
| **204** | Item added to favorites successfully |  -  |
| **0** | error response |  -  |

# **AddUDFFavorite**
> AddUDFFavorite(body=var.body)



Add a new UDF favorite

### Example
```R
library(tiledbcloud)

var.body <- FavoriteCreate$new("name_example", "namespace_example") # FavoriteCreate | 

api.instance <- FavoritesApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$AddUDFFavorite(body=var.body)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**FavoriteCreate**](FavoriteCreate.md)|  | [optional] 

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
| **204** | Item added to favorites successfully |  -  |
| **0** | error response |  -  |

# **DeleteArrayFavorite**
> DeleteArrayFavorite(id)



Delete specific array favorite

### Example
```R
library(tiledbcloud)

var.id <- 'id_example' # character | The uuid of the array favorite

api.instance <- FavoritesApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$DeleteArrayFavorite(var.id)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **character**| The uuid of the array favorite | 

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
| **204** | Array favorite item deleted successfully |  -  |
| **0** | error response |  -  |

# **DeleteMLModelFavorite**
> DeleteMLModelFavorite(id)



Delete specific ML model favorite

### Example
```R
library(tiledbcloud)

var.id <- 'id_example' # character | The uuid of the ML model favorite

api.instance <- FavoritesApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$DeleteMLModelFavorite(var.id)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **character**| The uuid of the ML model favorite | 

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
| **204** | ML model favorite item deleted successfully |  -  |
| **0** | error response |  -  |

# **DeleteNotebookFavorite**
> DeleteNotebookFavorite(id)



Delete specific notebook favorite

### Example
```R
library(tiledbcloud)

var.id <- 'id_example' # character | The uuid of the notebook favorite

api.instance <- FavoritesApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$DeleteNotebookFavorite(var.id)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **character**| The uuid of the notebook favorite | 

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
| **204** | Notebook favorite item deleted successfully |  -  |
| **0** | error response |  -  |

# **DeleteUDFFavorite**
> DeleteUDFFavorite(id)



Delete specific UDF favorite

### Example
```R
library(tiledbcloud)

var.id <- 'id_example' # character | The uuid of the UDF favorite

api.instance <- FavoritesApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$DeleteUDFFavorite(var.id)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **character**| The uuid of the UDF favorite | 

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
| **204** | UDF favorite item deleted successfully |  -  |
| **0** | error response |  -  |

# **GetArrayFavorite**
> ArrayFavorite GetArrayFavorite(id)



Fetch specific array favorite of a user

### Example
```R
library(tiledbcloud)

var.id <- 'id_example' # character | The uuid of the array favorite

api.instance <- FavoritesApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$GetArrayFavorite(var.id)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **character**| The uuid of the array favorite | 

### Return type

[**ArrayFavorite**](ArrayFavorite.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | OK |  -  |
| **0** | error response |  -  |

# **GetArrayFavoriteForArray**
> ArrayFavorite GetArrayFavoriteForArray(namespace, name)



Fetch array favorite of a specific array

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | The namespace of the array
var.name <- 'name_example' # character | The name of the array

api.instance <- FavoritesApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$GetArrayFavoriteForArray(var.namespace, var.name)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| The namespace of the array | 
 **name** | **character**| The name of the array | 

### Return type

[**ArrayFavorite**](ArrayFavorite.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | OK |  -  |
| **0** | error response |  -  |

# **GetMLModelFavorite**
> MLModelFavorite GetMLModelFavorite(id)



Fetch specific ML model favorite of a user

### Example
```R
library(tiledbcloud)

var.id <- 'id_example' # character | The uuid of the ML model favorite

api.instance <- FavoritesApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$GetMLModelFavorite(var.id)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **character**| The uuid of the ML model favorite | 

### Return type

[**MLModelFavorite**](MLModelFavorite.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | OK |  -  |
| **0** | error response |  -  |

# **GetMLModelFavoriteForMLModel**
> MLModelFavorite GetMLModelFavoriteForMLModel(namespace, name)



Fetch ML model favorite of a specific ML model

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | The namespace of the ML model
var.name <- 'name_example' # character | The name of the ML model

api.instance <- FavoritesApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$GetMLModelFavoriteForMLModel(var.namespace, var.name)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| The namespace of the ML model | 
 **name** | **character**| The name of the ML model | 

### Return type

[**MLModelFavorite**](MLModelFavorite.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | OK |  -  |
| **0** | error response |  -  |

# **GetNotebookFavorite**
> NotebookFavorite GetNotebookFavorite(id)



Fetch specific notebook favorite of a user

### Example
```R
library(tiledbcloud)

var.id <- 'id_example' # character | The uuid of the notebook favorite

api.instance <- FavoritesApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$GetNotebookFavorite(var.id)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **character**| The uuid of the notebook favorite | 

### Return type

[**NotebookFavorite**](NotebookFavorite.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | OK |  -  |
| **0** | error response |  -  |

# **GetNotebookFavoriteForNotebook**
> NotebookFavorite GetNotebookFavoriteForNotebook(namespace, name)



Fetch notebook favorite of a specific notebook

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | The namespace of the notebook
var.name <- 'name_example' # character | The name of the notebook

api.instance <- FavoritesApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$GetNotebookFavoriteForNotebook(var.namespace, var.name)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| The namespace of the notebook | 
 **name** | **character**| The name of the notebook | 

### Return type

[**NotebookFavorite**](NotebookFavorite.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | OK |  -  |
| **0** | error response |  -  |

# **GetUDFFavorite**
> UDFFavorite GetUDFFavorite(id)



Fetch specific UDF favorite of a user

### Example
```R
library(tiledbcloud)

var.id <- 'id_example' # character | The uuid of the UDF favorite

api.instance <- FavoritesApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$GetUDFFavorite(var.id)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **character**| The uuid of the UDF favorite | 

### Return type

[**UDFFavorite**](UDFFavorite.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | OK |  -  |
| **0** | error response |  -  |

# **GetUDFFavoriteForUDF**
> UDFFavorite GetUDFFavoriteForUDF(namespace, name)



Fetch UDF favorite of a specific UDF

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | The namespace of the UDF
var.name <- 'name_example' # character | The name of the UDF

api.instance <- FavoritesApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$GetUDFFavoriteForUDF(var.namespace, var.name)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| The namespace of the UDF | 
 **name** | **character**| The name of the UDF | 

### Return type

[**UDFFavorite**](UDFFavorite.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | OK |  -  |
| **0** | error response |  -  |

# **ListArrayFavorites**
> ArrayFavoritesData ListArrayFavorites(page=var.page, per.page=var.per.page)



Fetch all array favorites of connected user

### Example
```R
library(tiledbcloud)

var.page <- 56 # integer | pagination offset
var.per.page <- 56 # integer | pagination limit

api.instance <- FavoritesApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$ListArrayFavorites(page=var.page, per.page=var.per.page)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **integer**| pagination offset | [optional] 
 **per.page** | **integer**| pagination limit | [optional] 

### Return type

[**ArrayFavoritesData**](ArrayFavoritesData.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Available array favorites are returned |  -  |
| **0** | error response |  -  |

# **ListArrayFavoritesUUIDs**
> array[ArrayFavorite] ListArrayFavoritesUUIDs()



Fetch all favorite array uuids of connected user

### Example
```R
library(tiledbcloud)


api.instance <- FavoritesApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$ListArrayFavoritesUUIDs()
dput(result)
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**array[ArrayFavorite]**](ArrayFavorite.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Available favorites array uuids are returned |  -  |
| **0** | error response |  -  |

# **ListMLModelFavorites**
> MLModelFavoritesData ListMLModelFavorites(page=var.page, per.page=var.per.page)



Fetch all ML models favorites of connected user

### Example
```R
library(tiledbcloud)

var.page <- 56 # integer | pagination offset
var.per.page <- 56 # integer | pagination limit

api.instance <- FavoritesApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$ListMLModelFavorites(page=var.page, per.page=var.per.page)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **integer**| pagination offset | [optional] 
 **per.page** | **integer**| pagination limit | [optional] 

### Return type

[**MLModelFavoritesData**](MLModelFavoritesData.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Available ML models favorites are returned |  -  |
| **0** | error response |  -  |

# **ListMLModelFavoritesUUIDs**
> array[MLModelFavorite] ListMLModelFavoritesUUIDs()



Fetch all favorite ML models uuids of connected user

### Example
```R
library(tiledbcloud)


api.instance <- FavoritesApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$ListMLModelFavoritesUUIDs()
dput(result)
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**array[MLModelFavorite]**](MLModelFavorite.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Available favorites ML model uuids are returned |  -  |
| **0** | error response |  -  |

# **ListNotebookFavorites**
> NotebookFavoritesData ListNotebookFavorites(page=var.page, per.page=var.per.page)



Fetch all notebook favorites of connected user

### Example
```R
library(tiledbcloud)

var.page <- 56 # integer | pagination offset
var.per.page <- 56 # integer | pagination limit

api.instance <- FavoritesApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$ListNotebookFavorites(page=var.page, per.page=var.per.page)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **integer**| pagination offset | [optional] 
 **per.page** | **integer**| pagination limit | [optional] 

### Return type

[**NotebookFavoritesData**](NotebookFavoritesData.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Available notebook favorites are returned |  -  |
| **0** | error response |  -  |

# **ListNotebookFavoritesUUIDs**
> array[NotebookFavorite] ListNotebookFavoritesUUIDs()



Fetch all favorite notebook uuids of connected user

### Example
```R
library(tiledbcloud)


api.instance <- FavoritesApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$ListNotebookFavoritesUUIDs()
dput(result)
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**array[NotebookFavorite]**](NotebookFavorite.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Available favorites notebook uuids are returned |  -  |
| **0** | error response |  -  |

# **ListUDFFavorites**
> UDFFavoritesData ListUDFFavorites(page=var.page, per.page=var.per.page)



Fetch all UDF favorites of connected user

### Example
```R
library(tiledbcloud)

var.page <- 56 # integer | pagination offset
var.per.page <- 56 # integer | pagination limit

api.instance <- FavoritesApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$ListUDFFavorites(page=var.page, per.page=var.per.page)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **integer**| pagination offset | [optional] 
 **per.page** | **integer**| pagination limit | [optional] 

### Return type

[**UDFFavoritesData**](UDFFavoritesData.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Available UDF favorites are returned |  -  |
| **0** | error response |  -  |

# **ListUDFFavoritesUUIDs**
> array[UDFFavorite] ListUDFFavoritesUUIDs()



Fetch all favorite UDF uuids of connected user

### Example
```R
library(tiledbcloud)


api.instance <- FavoritesApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$ListUDFFavoritesUUIDs()
dput(result)
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**array[UDFFavorite]**](UDFFavorite.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Available favorites UDF uuids are returned |  -  |
| **0** | error response |  -  |

