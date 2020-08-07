# OrganizationApi

All URIs are relative to *http://localhost/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**AddAWSAccessCredentials**](OrganizationApi.md#AddAWSAccessCredentials) | **POST** /credentials/{namespace}/aws | 
[**AddUserToOrganization**](OrganizationApi.md#AddUserToOrganization) | **POST** /organizations/{organization}/user | 
[**CheckAWSAccessCredentials**](OrganizationApi.md#CheckAWSAccessCredentials) | **GET** /credentials/{namespace}/aws | 
[**CheckAWSAccessCredentialsByName**](OrganizationApi.md#CheckAWSAccessCredentialsByName) | **GET** /credentials/{namespace}/aws/{name} | 
[**CreateOrganization**](OrganizationApi.md#CreateOrganization) | **POST** /organization | 
[**DeleteAWSAccessCredentials**](OrganizationApi.md#DeleteAWSAccessCredentials) | **DELETE** /credentials/{namespace}/aws/{name} | 
[**DeleteOrganization**](OrganizationApi.md#DeleteOrganization) | **DELETE** /organizations/{organization} | 
[**DeleteUserFromOrganization**](OrganizationApi.md#DeleteUserFromOrganization) | **DELETE** /organizations/{organization}/{username} | 
[**GetAllOrganizations**](OrganizationApi.md#GetAllOrganizations) | **GET** /organizations | 
[**GetOrganization**](OrganizationApi.md#GetOrganization) | **GET** /organizations/{organization} | 
[**GetOrganizationUser**](OrganizationApi.md#GetOrganizationUser) | **GET** /organizations/{organization}/{username} | 
[**UpdateAWSAccessCredentials**](OrganizationApi.md#UpdateAWSAccessCredentials) | **PATCH** /credentials/{namespace}/aws/{name} | 
[**UpdateOrganization**](OrganizationApi.md#UpdateOrganization) | **PATCH** /organizations/{organization} | 
[**UpdateUserInOrganization**](OrganizationApi.md#UpdateUserInOrganization) | **PATCH** /organizations/{organization}/{username} | 


# **AddAWSAccessCredentials**
> AddAWSAccessCredentials(namespace, aws.access.credentials)



Add aws keys

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace
var.aws.access.credentials <- AWSAccessCredentials$new("secret_access_key_example", "access_key_id_example", "service_role_arn_example", "name_example", "default_example", list("buckets_example"), "created_at_example", "updated_at_example") # AWSAccessCredentials | aws access credentials to store for a namespace

api.instance <- OrganizationApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$AddAWSAccessCredentials(var.namespace, var.aws.access.credentials)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace | 
 **aws.access.credentials** | [**AWSAccessCredentials**](AWSAccessCredentials.md)| aws access credentials to store for a namespace | 

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
| **204** | AWS keys added successfully |  -  |
| **0** | error response |  -  |

# **AddUserToOrganization**
> AddUserToOrganization(organization, user)



add a user to an organization

### Example
```R
library(tiledbcloud)

var.organization <- 'organization_example' # character | organization name
var.user <- OrganizationUser$new("user_id_example", "organization_id_example", "username_example", "organization_name_example", OrganizationRoles$new(), list(NamespaceActions$new())) # OrganizationUser | user to add

api.instance <- OrganizationApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$AddUserToOrganization(var.organization, var.user)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organization** | **character**| organization name | 
 **user** | [**OrganizationUser**](OrganizationUser.md)| user to add | 

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
| **204** | user added to organization successfully |  -  |
| **0** | error response |  -  |

# **CheckAWSAccessCredentials**
> array[AWSAccessCredentials] CheckAWSAccessCredentials(namespace)



Check if aws keys are set

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace

api.instance <- OrganizationApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$CheckAWSAccessCredentials(var.namespace)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace | 

### Return type

[**array[AWSAccessCredentials]**](AWSAccessCredentials.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | AWS keys are set |  -  |
| **0** | error response |  -  |

# **CheckAWSAccessCredentialsByName**
> AWSAccessCredentials CheckAWSAccessCredentialsByName(namespace, name)



Check if aws keys are set by name

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace
var.name <- 'name_example' # character | name

api.instance <- OrganizationApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$CheckAWSAccessCredentialsByName(var.namespace, var.name)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace | 
 **name** | **character**| name | 

### Return type

[**AWSAccessCredentials**](AWSAccessCredentials.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | AWS keys are set |  -  |
| **0** | error response |  -  |

# **CreateOrganization**
> CreateOrganization(organization)



create a organization, the user creating will be listed as owner

### Example
```R
library(tiledbcloud)

var.organization <- Organization$new("id_example", OrganizationRoles$new(), "name_example", "created_at_example", "updated_at_example", "logo_example", "description_example", list(OrganizationUser$new("user_id_example", "organization_id_example", "username_example", "organization_name_example", OrganizationRoles$new(), list(NamespaceActions$new()))), list(NamespaceActions$new()), 123, list("enabled_features_example"), "unpaid_subscription_example", NotebookSettings$new("default_s3_path_example")) # Organization | organization to create

api.instance <- OrganizationApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$CreateOrganization(var.organization)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organization** | [**Organization**](Organization.md)| organization to create | 

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
| **204** | organization created successfully |  -  |
| **0** | error response |  -  |

# **DeleteAWSAccessCredentials**
> DeleteAWSAccessCredentials(namespace, name)



delete a AWS Access credentials in a namespace. This will likely cause arrays to become unreachable

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace
var.name <- 'name_example' # character | name

api.instance <- OrganizationApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$DeleteAWSAccessCredentials(var.namespace, var.name)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace | 
 **name** | **character**| name | 

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
| **204** | AWS credentials deleted |  -  |
| **0** | error response |  -  |

# **DeleteOrganization**
> DeleteOrganization(organization)



delete a organization

### Example
```R
library(tiledbcloud)

var.organization <- 'organization_example' # character | organization name or id

api.instance <- OrganizationApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$DeleteOrganization(var.organization)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organization** | **character**| organization name or id | 

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
| **204** | organization deleted |  -  |
| **0** | error response |  -  |

# **DeleteUserFromOrganization**
> DeleteUserFromOrganization(organization, username)



delete a user from an organization

### Example
```R
library(tiledbcloud)

var.organization <- 'organization_example' # character | organization name
var.username <- 'username_example' # character | username to manipulate

api.instance <- OrganizationApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$DeleteUserFromOrganization(var.organization, var.username)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organization** | **character**| organization name | 
 **username** | **character**| username to manipulate | 

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
| **204** | user delete from organization successfully |  -  |
| **0** | error response |  -  |

# **GetAllOrganizations**
> array[Organization] GetAllOrganizations()



get all organizations that the user is member of

### Example
```R
library(tiledbcloud)


api.instance <- OrganizationApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$GetAllOrganizations()
dput(result)
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**array[Organization]**](Organization.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | array of organizations the user is member of |  -  |
| **400** | Error finding organizations |  -  |
| **500** | Request user not found, or has empty context |  -  |
| **0** | error response |  -  |

# **GetOrganization**
> Organization GetOrganization(organization)



get a organization

### Example
```R
library(tiledbcloud)

var.organization <- 'organization_example' # character | organization name or id

api.instance <- OrganizationApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$GetOrganization(var.organization)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organization** | **character**| organization name or id | 

### Return type

[**Organization**](Organization.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | organization details |  -  |
| **404** | Organization does not exist |  -  |
| **0** | error response |  -  |

# **GetOrganizationUser**
> OrganizationUser GetOrganizationUser(organization, username)



get a user from an organization

### Example
```R
library(tiledbcloud)

var.organization <- 'organization_example' # character | organization name
var.username <- 'username_example' # character | username to manipulate

api.instance <- OrganizationApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$GetOrganizationUser(var.organization, var.username)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organization** | **character**| organization name | 
 **username** | **character**| username to manipulate | 

### Return type

[**OrganizationUser**](OrganizationUser.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | user from organization |  -  |
| **404** | User is not in organization |  -  |
| **0** | error response |  -  |

# **UpdateAWSAccessCredentials**
> UpdateAWSAccessCredentials(namespace, name, aws.access.credentials)



Update aws keys or associated buckets. This will update the key associations for each array in the namespace

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace
var.name <- 'name_example' # character | name
var.aws.access.credentials <- AWSAccessCredentials$new("secret_access_key_example", "access_key_id_example", "service_role_arn_example", "name_example", "default_example", list("buckets_example"), "created_at_example", "updated_at_example") # AWSAccessCredentials | aws credentials to update

api.instance <- OrganizationApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$UpdateAWSAccessCredentials(var.namespace, var.name, var.aws.access.credentials)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace | 
 **name** | **character**| name | 
 **aws.access.credentials** | [**AWSAccessCredentials**](AWSAccessCredentials.md)| aws credentials to update | 

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
| **204** | AWS keys updated successfully |  -  |
| **0** | error response |  -  |

# **UpdateOrganization**
> UpdateOrganization(organization, organization.details)



update a organization

### Example
```R
library(tiledbcloud)

var.organization <- 'organization_example' # character | organization name or id
var.organization.details <- Organization$new("id_example", OrganizationRoles$new(), "name_example", "created_at_example", "updated_at_example", "logo_example", "description_example", list(OrganizationUser$new("user_id_example", "organization_id_example", "username_example", "organization_name_example", OrganizationRoles$new(), list(NamespaceActions$new()))), list(NamespaceActions$new()), 123, list("enabled_features_example"), "unpaid_subscription_example", NotebookSettings$new("default_s3_path_example")) # Organization | organization details to update

api.instance <- OrganizationApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$UpdateOrganization(var.organization, var.organization.details)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organization** | **character**| organization name or id | 
 **organization.details** | [**Organization**](Organization.md)| organization details to update | 

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
| **204** | organization updated successfully |  -  |
| **0** | error response |  -  |

# **UpdateUserInOrganization**
> UpdateUserInOrganization(organization, username, user)



update a user in an organization

### Example
```R
library(tiledbcloud)

var.organization <- 'organization_example' # character | organization name
var.username <- 'username_example' # character | username to manipulate
var.user <- OrganizationUser$new("user_id_example", "organization_id_example", "username_example", "organization_name_example", OrganizationRoles$new(), list(NamespaceActions$new())) # OrganizationUser | user details to update

api.instance <- OrganizationApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$UpdateUserInOrganization(var.organization, var.username, var.user)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organization** | **character**| organization name | 
 **username** | **character**| username to manipulate | 
 **user** | [**OrganizationUser**](OrganizationUser.md)| user details to update | 

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
| **204** | user update in organization successfully |  -  |
| **0** | error response |  -  |

