# tiledbcloud::User

User
## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **character** | unique id of user | [optional] 
**username** | **character** | username must be unique | 
**password** | **character** | password | [optional] 
**name** | **character** | the user&#39;s full, real name | [optional] 
**email** | **character** | the user&#39;s email | [optional] 
**is_valid_email** | **character** | user&#39;s email is validated to be correct | [optional] [readonly] 
**stripe_connect** | **character** | Denotes that the user is able to apply pricing to arrays by means of Stripe Connect | [optional] [readonly] 
**company** | **character** | the user&#39;s company | [optional] 
**logo** | **character** | the user&#39;s logo | [optional] 
**last_activity_date** | **character** | when the user last logged in (set by the server) | [optional] [readonly] 
**timezone** | **character** |  | [optional] 
**organizations** | [**array[OrganizationUser]**](OrganizationUser.md) | Array of organizations a user is part of and their roles | [optional] [readonly] 
**allowed_actions** | [**array[NamespaceActions]**](NamespaceActions.md) | list of actions user is allowed to do on this organization | [optional] 
**enabled_features** | **array[character]** | List of extra/optional/beta features to enable for namespace | [optional] [readonly] 
**unpaid_subscription** | **character** | A notice that the user has an unpaid subscription | [optional] [readonly] 
**notebook_settings** | [**NotebookSettings**](NotebookSettings.md) |  | [optional] 


