# FavoritesApi

All URIs are relative to *http://localhost/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**DeleteFavoriteId**](FavoritesApi.md#DeleteFavoriteId) | **DELETE** /favorites/{id} | 
[**GetFavorite**](FavoritesApi.md#GetFavorite) | **GET** /favorites/{id} | 
[**GetFavorites**](FavoritesApi.md#GetFavorites) | **GET** /favorites | 
[**PostFavorite**](FavoritesApi.md#PostFavorite) | **POST** /favorites | 


# **DeleteFavoriteId**
> DeleteFavoriteId(id)



Delete specific favorite

### Example
```R
library(tiledbcloud)

var.id <- 'id_example' # character | The uuid of the favorite

api.instance <- FavoritesApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$DeleteFavoriteId(var.id)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **character**| The uuid of the favorite | 

### Return type

void (empty response body)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | OK |  -  |

# **GetFavorite**
> Favorite GetFavorite(id)



Fetch specific favorite of a user

### Example
```R
library(tiledbcloud)

var.id <- 'id_example' # character | The uuid of the favorite

api.instance <- FavoritesApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$GetFavorite(var.id)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **character**| The uuid of the favorite | 

### Return type

[**Favorite**](Favorite.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | OK |  -  |

# **GetFavorites**
> array[Favorite] GetFavorites(type=var.type)



Fetch all favorites of connected user

### Example
```R
library(tiledbcloud)

var.type <- 'type_example' # character | The type of the desired favorites e.g. arrays

api.instance <- FavoritesApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$GetFavorites(type=var.type)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **type** | **character**| The type of the desired favorites e.g. arrays | [optional] 

### Return type

[**array[Favorite]**](Favorite.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | OK |  -  |

# **PostFavorite**
> PostFavorite(body=var.body)



Add a new favorite

### Example
```R
library(tiledbcloud)

var.body <- FavoriteUpdate$new("name_example", "namespace_example", FavoriteType$new()) # FavoriteUpdate | 

api.instance <- FavoritesApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$PostFavorite(body=var.body)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**FavoriteUpdate**](FavoriteUpdate.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | OK |  -  |

