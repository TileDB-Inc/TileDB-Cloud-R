# InvitationApi

All URIs are relative to *http://localhost/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**AcceptInvitation**](InvitationApi.md#AcceptInvitation) | **POST** /invitations/{invitation} | 
[**CancelJoinOrganization**](InvitationApi.md#CancelJoinOrganization) | **DELETE** /invitations/{invitation}/{organization}/join | 
[**CancelShareArrayByInvite**](InvitationApi.md#CancelShareArrayByInvite) | **DELETE** /invitations/{invitation}/{namespace}/{array}/share | 
[**FetchInvitations**](InvitationApi.md#FetchInvitations) | **GET** /invitations | 
[**JoinOrganization**](InvitationApi.md#JoinOrganization) | **POST** /invitations/{organization}/join | 
[**ShareArrayByInvite**](InvitationApi.md#ShareArrayByInvite) | **POST** /invitations/{namespace}/{array}/share | 


# **AcceptInvitation**
> AcceptInvitation(invitation)



Accepts invitation

### Example
```R
library(tiledbcloud)

var.invitation <- 'invitation_example' # character | the id of invitation about to be accepted

api.instance <- InvitationApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$AcceptInvitation(var.invitation)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **invitation** | **character**| the id of invitation about to be accepted | 

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
| **204** | Invitation was accepted successfully |  -  |
| **404** | Could not find invitation identifier |  -  |
| **0** | error response |  -  |

# **CancelJoinOrganization**
> CancelJoinOrganization(invitation, organization)



Cancels join organization invitation

### Example
```R
library(tiledbcloud)

var.invitation <- 'invitation_example' # character | the id of invitation about to be cancelled
var.organization <- 'organization_example' # character | name or uuid of organization

api.instance <- InvitationApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$CancelJoinOrganization(var.invitation, var.organization)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **invitation** | **character**| the id of invitation about to be cancelled | 
 **organization** | **character**| name or uuid of organization | 

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
| **204** | Invitation cancelled successfully |  -  |
| **404** | No invitation was found to cancel |  -  |
| **0** | error response |  -  |

# **CancelShareArrayByInvite**
> CancelShareArrayByInvite(namespace, invitation, array)



Cancels array sharing invitation

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.invitation <- 'invitation_example' # character | the id of invitation about to be cancelled
var.array <- 'array_example' # character | name/uri of array that is url-encoded

api.instance <- InvitationApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$CancelShareArrayByInvite(var.namespace, var.invitation, var.array)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 
 **invitation** | **character**| the id of invitation about to be cancelled | 
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
| **204** | Invitation cancelled successfully |  -  |
| **404** | No invitation was found to cancel |  -  |
| **0** | error response |  -  |

# **FetchInvitations**
> InvitationData FetchInvitations(organization=var.organization, array=var.array, start=var.start, end=var.end, page=var.page, per.page=var.per.page, type=var.type, status=var.status, orderby=var.orderby)



Fetch a list of invitations

### Example
```R
library(tiledbcloud)

var.organization <- 'organization_example' # character | name or id of organization to filter
var.array <- 'array_example' # character | name/uri of array that is url-encoded to filter
var.start <- 56 # integer | start time for tasks to filter by
var.end <- 56 # integer | end time for tasks to filter by
var.page <- 56 # integer | pagination offset
var.per.page <- 56 # integer | pagination limit
var.type <- 'type_example' # character | invitation type, \"ARRAY_SHARE\", \"JOIN_ORGANIZATION\"
var.status <- 'status_example' # character | Filter to only return \"PENDING\", \"ACCEPTED\"
var.orderby <- 'orderby_example' # character | sort by which field valid values include timestamp, array_name, organization_name

api.instance <- InvitationApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
result <- api.instance$FetchInvitations(organization=var.organization, array=var.array, start=var.start, end=var.end, page=var.page, per.page=var.per.page, type=var.type, status=var.status, orderby=var.orderby)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organization** | **character**| name or id of organization to filter | [optional] 
 **array** | **character**| name/uri of array that is url-encoded to filter | [optional] 
 **start** | **integer**| start time for tasks to filter by | [optional] 
 **end** | **integer**| end time for tasks to filter by | [optional] 
 **page** | **integer**| pagination offset | [optional] 
 **per.page** | **integer**| pagination limit | [optional] 
 **type** | **character**| invitation type, \&quot;ARRAY_SHARE\&quot;, \&quot;JOIN_ORGANIZATION\&quot; | [optional] 
 **status** | **character**| Filter to only return \&quot;PENDING\&quot;, \&quot;ACCEPTED\&quot; | [optional] 
 **orderby** | **character**| sort by which field valid values include timestamp, array_name, organization_name | [optional] 

### Return type

[**InvitationData**](InvitationData.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | List of invitations and pagination metadata |  -  |
| **0** | error response |  -  |

# **JoinOrganization**
> JoinOrganization(organization, email.invite)



Sends email to multiple recipients with joining information regarding an organization

### Example
```R
library(tiledbcloud)

var.organization <- 'organization_example' # character | name or uuid of organization
var.email.invite <- InvitationOrganizationJoinEmail$new(list(NamespaceActions$new()), OrganizationRoles$new(), list("invitee_email_example")) # InvitationOrganizationJoinEmail | list of email recipients

api.instance <- InvitationApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$JoinOrganization(var.organization, var.email.invite)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organization** | **character**| name or uuid of organization | 
 **email.invite** | [**InvitationOrganizationJoinEmail**](InvitationOrganizationJoinEmail.md)| list of email recipients | 

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
| **204** | Email sent successfully to user for email confirmation link |  -  |
| **404** | Could not reach one or more recipients |  -  |
| **0** | error response |  -  |

# **ShareArrayByInvite**
> ShareArrayByInvite(namespace, array, email.invite)



Sends email to multiple recipients with sharing information regarding an array

### Example
```R
library(tiledbcloud)

var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.array <- 'array_example' # character | name/uri of array that is url-encoded
var.email.invite <- InvitationArrayShareEmail$new(list(ArrayActions$new()), list("invitee_email_example")) # InvitationArrayShareEmail | list of email recipients

api.instance <- InvitationApi$new()
# Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
# Configure HTTP basic authorization: BasicAuth
api.instance$apiClient$username <- 'TODO_YOUR_USERNAME';
api.instance$apiClient$password <- 'TODO_YOUR_PASSWORD';
api.instance$ShareArrayByInvite(var.namespace, var.array, var.email.invite)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **character**| namespace array is in (an organization name or user&#39;s username) | 
 **array** | **character**| name/uri of array that is url-encoded | 
 **email.invite** | [**InvitationArrayShareEmail**](InvitationArrayShareEmail.md)| list of email recipients | 

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
| **204** | Email sent successfully to user for email confirmation link |  -  |
| **404** | Could not reach one or more recipients |  -  |
| **0** | error response |  -  |

