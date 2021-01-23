# tiledbcloud::Invitation

Invitations to share or collaborate
## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **character** | Unique id of invitation added to magic link | [optional] 
**invitation_type** | [**InvitationType**](InvitationType.md) |  | [optional] 
**owner_namespace_uuid** | **character** | Namespace of the owner of the invitation (user or organization) | [optional] 
**user_namespace_uuid** | **character** | Unique id of the user accepted the invitation | [optional] 
**organization_user_uuid** | **character** | Unique id of the organization user accepted the invitation | [optional] 
**organization_name** | **character** | Name of the organization, does not persist in database | [optional] 
**organization_role** | [**OrganizationRoles**](OrganizationRoles.md) |  | [optional] 
**array_uuid** | **character** | Unique id of the array | [optional] 
**array_name** | **character** | Name of the array, does not persist in database | [optional] 
**email** | **character** | Email of the individual we send the invitation to | [optional] 
**actions** | **character** | A comma separated list of ArrayActions or NamespaceActions | [optional] 
**status** | [**InvitationStatus**](InvitationStatus.md) |  | [optional] 
**created_at** | **character** | Datetime the invitation was created in UTC | [optional] 
**expires_at** | **character** | Datetime the invitation is expected to expire in UTC | [optional] 
**accepted_at** | **character** | Datetime the invitation was accepted in UTC | [optional] 


