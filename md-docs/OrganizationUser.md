# tiledbcloud::OrganizationUser

user in an organization
## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**user_id** | **character** | unique id of user | [optional] 
**organization_id** | **character** | unique id of organization | [optional] 
**username** | **character** | username for user | [optional] 
**organization_name** | **character** | name of organization | [optional] 
**role** | [**OrganizationRoles**](OrganizationRoles.md) |  | [optional] 
**allowed_actions** | [**array[NamespaceActions]**](NamespaceActions.md) | list of actions user is allowed to do on this organization | [optional] 


