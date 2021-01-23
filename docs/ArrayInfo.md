# tiledbcloud::ArrayInfo

metadata of an array
## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **character** | unique id of registered array | [optional] 
**file_type** | [**FileType**](FileType.md) |  | [optional] 
**file_properties** | **map(character)** | map of file properties created for this array | [optional] 
**uri** | **character** | uri of array | [optional] 
**namespace** | **character** | namespace array is in | [optional] 
**size** | **numeric** | size in bytes of array | [optional] 
**last_accessed** | **character** | Datetime array was last accessed in UTC | [optional] 
**description** | **character** | description of array | [optional] 
**name** | **character** | name of array | [optional] 
**allowed_actions** | [**array[ArrayActions]**](ArrayActions.md) | list of actions user is allowed to do on this array | [optional] 
**pricing** | [**array[Pricing]**](Pricing.md) | list of pricing created for this array | [optional] 
**subscriptions** | [**array[Subscription]**](Subscription.md) | list of subscriptions created for this array | [optional] 
**logo** | **character** | logo (base64 encoded) for the array. Optional | [optional] 
**access_credentials_name** | **character** | the name of the access credentials to use. if unset, the default credentials will be used | [optional] 
**type** | **character** | Array type (dense, key-value, sparse) | [optional] 
**share_count** | **numeric** | number of unique namespaces this array is shared with | [optional] 
**public_share** | **character** | Suggests if the array was shared to public by owner | [optional] 
**namespace_subscribed** | **character** | Depends on the namespace asking, denotes the existence of subscription of namespace to this array | [optional] [readonly] 
**tiledb_uri** | **character** | uri for access through TileDB cloud | [optional] 
**tags** | **array[character]** | optional tags for array | [optional] 
**license_id** | **character** | License identifier from SPDX License List or Custom | [optional] 
**license_text** | **character** | License text | [optional] 


