# tiledbcloud::Organization

Organization
## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **character** | unique id of organization | [optional] 
**role** | [**OrganizationRoles**](OrganizationRoles.md) |  | [optional] 
**name** | **character** | organization name must be unique | 
**created_at** | **character** | Datetime organization was created in UTC | [optional] 
**updated_at** | **character** | Datetime organization was updated in UTC | [optional] 
**logo** | **character** | Organization logo | [optional] 
**description** | **character** | Organization description | [optional] 
**users** | [**array[OrganizationUser]**](OrganizationUser.md) |  | [optional] 
**allowed_actions** | [**array[NamespaceActions]**](NamespaceActions.md) | list of actions user is allowed to do on this organization | [optional] 
**num_of_arrays** | **numeric** | number of registered arrays for this organization | [optional] 
**enabled_features** | **array[character]** | List of extra/optional/beta features to enable for namespace | [optional] [readonly] 
**unpaid_subscription** | **character** | A notice that the user has an unpaid subscription | [optional] [readonly] 
**notebook_settings** | [**NotebookSettings**](NotebookSettings.md) |  | [optional] 


