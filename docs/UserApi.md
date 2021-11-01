# UserApi

All URIs are relative to *http://localhost/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**AddAWSAccessCredentials**](UserApi.md#AddAWSAccessCredentials) | **POST** /credentials/{namespace}/aws | 
[**AddUserToOrganization**](UserApi.md#AddUserToOrganization) | **POST** /organizations/{organization}/user | 
[**CheckAWSAccessCredentials**](UserApi.md#CheckAWSAccessCredentials) | **GET** /credentials/{namespace}/aws | 
[**CheckAWSAccessCredentialsByName**](UserApi.md#CheckAWSAccessCredentialsByName) | **GET** /credentials/{namespace}/aws/{name} | 
[**ConfirmEmail**](UserApi.md#ConfirmEmail) | **POST** /user/confirm_email | 
[**CreateUser**](UserApi.md#CreateUser) | **POST** /user | 
[**DeleteAWSAccessCredentials**](UserApi.md#DeleteAWSAccessCredentials) | **DELETE** /credentials/{namespace}/aws/{name} | 
[**DeleteUser**](UserApi.md#DeleteUser) | **DELETE** /users/{username} | 
[**DeleteUserFromOrganization**](UserApi.md#DeleteUserFromOrganization) | **DELETE** /organizations/{organization}/{username} | 
[**GetOrganizationUser**](UserApi.md#GetOrganizationUser) | **GET** /organizations/{organization}/{username} | 
[**GetSession**](UserApi.md#GetSession) | **GET** /session | 
[**GetTokenScopes**](UserApi.md#GetTokenScopes) | **GET** /tokens/scopes | 
[**GetUser**](UserApi.md#GetUser) | **GET** /user | 
[**GetUserWithUsername**](UserApi.md#GetUserWithUsername) | **GET** /users/{username} | 
[**RequestToken**](UserApi.md#RequestToken) | **POST** /token | 
[**ResetUserPassword**](UserApi.md#ResetUserPassword) | **POST** /user/password_reset | 
[**RevokeToken**](UserApi.md#RevokeToken) | **DELETE** /tokens/{token} | 
[**TokensGet**](UserApi.md#TokensGet) | **GET** /tokens | 
[**TokensSessionGet**](UserApi.md#TokensSessionGet) | **GET** /tokens/session | 
[**UpdateAWSAccessCredentials**](UserApi.md#UpdateAWSAccessCredentials) | **PATCH** /credentials/{namespace}/aws/{name} | 
[**UpdateUser**](UserApi.md#UpdateUser) | **PATCH** /users/{username} | 
[**UpdateUserInOrganization**](UserApi.md#UpdateUserInOrganization) | **PATCH** /organizations/{organization}/{username} | 


# **AddAWSAccessCredentials**
> AddAWSAccessCredentials(namespace, aws.access.credentials)



Add aws keys

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace
var.aws.access.credentials <- AWSAccessCredentials$new("secret_access_key_example", "access_key_id_example", "service_role_arn_example", "name_example", "default_example", list("buckets_example"), "created_at_example", "updated_at_example") # AWSAccessCredentials | aws access credentials to store for a namespace

api.instance <- UserApi$new()
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

api.instance <- UserApi$new()
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

api.instance <- UserApi$new()
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

api.instance <- UserApi$new()
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

# **ConfirmEmail**
> ConfirmEmail()



confirm user email

### Example
```R
library(tiledbcloud)


api.instance <- UserApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$ConfirmEmail()
```

### Parameters
This endpoint does not need any parameter.

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
| **204** | User email confirmed successfully |  -  |
| **0** | error response |  -  |

# **CreateUser**
> CreateUser(user)



create a user

### Example
```R
library(tiledbcloud)

var.user <- User$new("id_example", "username_example", "password_example", "name_example", "email_example", "is_valid_email_example", "stripe_connect_example", "company_example", "logo_example", "last_activity_date_example", "timezone_example", list(OrganizationUser$new("user_id_example", "organization_id_example", "username_example", "organization_name_example", OrganizationRoles$new(), list(NamespaceActions$new()))), list(NamespaceActions$new()), list("enabled_features_example"), "unpaid_subscription_example", "default_s3_path_example", "default_s3_path_credentials_name_example", "default_namespace_charged_example") # User | user to create

api.instance <- UserApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$CreateUser(var.user)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **user** | [**User**](User.md)| user to create | 

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
| **204** | user created successfully |  -  |
| **0** | error response |  -  |

# **DeleteAWSAccessCredentials**
> DeleteAWSAccessCredentials(namespace, name)



delete a AWS Access credentials in a namespace. This will likely cause arrays to become unreachable

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace
var.name <- 'name_example' # character | name

api.instance <- UserApi$new()
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

# **DeleteUser**
> DeleteUser(username)



delete a user

### Example
```R
library(tiledbcloud)

var.username <- 'username_example' # character | username or id

api.instance <- UserApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$DeleteUser(var.username)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **character**| username or id | 

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
| **204** | user deleted |  -  |
| **0** | error response |  -  |

# **DeleteUserFromOrganization**
> DeleteUserFromOrganization(organization, username)



delete a user from an organization

### Example
```R
library(tiledbcloud)

var.organization <- 'organization_example' # character | organization name
var.username <- 'username_example' # character | username to manipulate

api.instance <- UserApi$new()
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

# **GetOrganizationUser**
> OrganizationUser GetOrganizationUser(organization, username)



get a user from an organization

### Example
```R
library(tiledbcloud)

var.organization <- 'organization_example' # character | organization name
var.username <- 'username_example' # character | username to manipulate

api.instance <- UserApi$new()
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

# **GetSession**
> Token GetSession(remember.me=var.remember.me)



Get session token for user

### Example
```R
library(tiledbcloud)

var.remember.me <- 'remember.me_example' # character | flag to create a token with expiration of 30 days, default is false

api.instance <- UserApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$GetSession(remember.me=var.remember.me)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **remember.me** | **character**| flag to create a token with expiration of 30 days, default is false | [optional] 

### Return type

[**Token**](Token.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Session token |  -  |
| **0** | error response |  -  |

# **GetTokenScopes**
> array[TokenScope] GetTokenScopes()



retrieves available token scopes for a user

### Example
```R
library(tiledbcloud)


api.instance <- UserApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$GetTokenScopes()
dput(result)
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**array[TokenScope]**](TokenScope.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | available token scopes |  -  |
| **0** | error response |  -  |

# **GetUser**
> User GetUser()



get a user

### Example
```R
library(tiledbcloud)


api.instance <- UserApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$GetUser()
dput(result)
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**User**](User.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | user details |  -  |
| **0** | error response |  -  |

# **GetUserWithUsername**
> User GetUserWithUsername(username)



get a user

### Example
```R
library(tiledbcloud)

var.username <- 'username_example' # character | username or id

api.instance <- UserApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$GetUserWithUsername(var.username)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **character**| username or id | 

### Return type

[**User**](User.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | user details |  -  |
| **404** | User does not exist |  -  |
| **0** | error response |  -  |

# **RequestToken**
> Token RequestToken(token.request=var.token.request)



Request an authorization token, optionally taken a TokenRequest object to set parameters on the token

### Example
```R
library(tiledbcloud)

var.token.request <- TokenRequest$new("expires_example", "name_example", "scope_example") # TokenRequest | token request object

api.instance <- UserApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$RequestToken(token.request=var.token.request)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **token.request** | [**TokenRequest**](TokenRequest.md)| token request object | [optional] 

### Return type

[**Token**](Token.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | token |  -  |
| **0** | error response |  -  |

# **ResetUserPassword**
> ResetUserPassword(user)



reset user password

### Example
```R
library(tiledbcloud)

var.user <- inline_object$new("password_example") # InlineObject | 

api.instance <- UserApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$ResetUserPassword(var.user)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **user** | [**InlineObject**](InlineObject.md)|  | 

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
| **204** | User password updated successfully |  -  |
| **404** | User not found |  -  |
| **0** | error response |  -  |

# **RevokeToken**
> RevokeToken(token)



revoke an authorization token

### Example
```R
library(tiledbcloud)

var.token <- 'token_example' # character | token name or token itself

api.instance <- UserApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$RevokeToken(var.token)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **token** | **character**| token name or token itself | 

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
| **204** | revokation successfully |  -  |
| **0** | error response |  -  |

# **TokensGet**
> array[Token] TokensGet()



Fetch a list of user tokens

### Example
```R
library(tiledbcloud)


api.instance <- UserApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$TokensGet()
dput(result)
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**array[Token]**](Token.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Array of user created non-session tokens |  -  |
| **0** | error response |  -  |

# **TokensSessionGet**
> array[Token] TokensSessionGet()



Fetch a list of user session tokens

### Example
```R
library(tiledbcloud)


api.instance <- UserApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$TokensSessionGet()
dput(result)
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**array[Token]**](Token.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Array of user created session tokens |  -  |
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

api.instance <- UserApi$new()
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

# **UpdateUser**
> UpdateUser(username, user)



update a user

### Example
```R
library(tiledbcloud)

var.username <- 'username_example' # character | username or id
var.user <- User$new("id_example", "username_example", "password_example", "name_example", "email_example", "is_valid_email_example", "stripe_connect_example", "company_example", "logo_example", "last_activity_date_example", "timezone_example", list(OrganizationUser$new("user_id_example", "organization_id_example", "username_example", "organization_name_example", OrganizationRoles$new(), list(NamespaceActions$new()))), list(NamespaceActions$new()), list("enabled_features_example"), "unpaid_subscription_example", "default_s3_path_example", "default_s3_path_credentials_name_example", "default_namespace_charged_example") # User | user details to update

api.instance <- UserApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$UpdateUser(var.username, var.user)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **character**| username or id | 
 **user** | [**User**](User.md)| user details to update | 

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
| **204** | user updated successfully |  -  |
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

api.instance <- UserApi$new()
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

