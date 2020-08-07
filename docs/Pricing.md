# tiledbcloud::Pricing

Pricing created by converting an array to product
## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **character** | Unique id of plan as defined by Stripe | [optional] 
**array_uuid** | **character** | Unique id of registered array | [optional] 
**pricing_name** | **character** | Name of pricing | [optional] 
**pricing_type** | [**PricingType**](PricingType.md) |  | [optional] 
**product_name** | **character** | Name of product | [optional] 
**product_statement_descriptor** | **character** | Extra information about a product which will appear on the credit card statement of the customer | [optional] 
**product_unit_label** | [**PricingUnitLabel**](PricingUnitLabel.md) |  | [optional] 
**currency** | [**PricingCurrency**](PricingCurrency.md) |  | [optional] 
**aggregate_usage** | [**PricingAggregateUsage**](PricingAggregateUsage.md) |  | [optional] 
**interval** | [**PricingInterval**](PricingInterval.md) |  | [optional] 
**divided_by** | **integer** | Group of n product unit labels | [optional] 
**charge** | **numeric** | Price in cents (decimal) per unitlabel | [optional] 
**activated** | **character** | If pricing is activated | [optional] 


