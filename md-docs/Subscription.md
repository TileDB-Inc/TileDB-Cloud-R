# tiledbcloud::Subscription

Subscription of a user (customer) to another user's arrays
## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **character** | Unique id of subscription as defined by Stripe | [optional] 
**owner_namespace_uuid** | **character** | Unique id of the array (product) owner | [optional] 
**customer_namespace_uuid** | **character** | Unique id of the array (product) user (customer) | [optional] 
**pricing** | [**array[Pricing]**](Pricing.md) | list of pricing used by this subscription | [optional] 


