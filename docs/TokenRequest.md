# tiledbcloud::TokenRequest

A request from a user for an api token
## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**expires** | **character** | Expiration date for token, if empty token defaults to 30 minutes | [optional] 
**name** | **character** | Optional name for token, if the name already exists for the user it will be auto incremented (i.e. myToken-1) | [optional] 
**scope** | **character** | Optional scope to limit token, defaults to all permissions, current supported values are password_reset or * | [optional] [default to &#39;*&#39;]


