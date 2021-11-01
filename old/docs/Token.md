# tiledbcloud::Token

A api token and its metadata
## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**token** | **character** | A api token | [optional] 
**name** | **character** | Name of token to revoke | [optional] 
**issued_at** | **character** | datetime the token was created at | [optional] 
**expires_at** | **character** | datetime the token when token will expire | [optional] 
**scope** | **character** | Optional scope to limit token, defaults to all permissions, current supported values are password_reset or * | [optional] [default to &#39;*&#39;]


