# tiledbcloud::AWSAccessCredentials

Model representing aws keys or service role, service roles are currently ignored, but will be preferred option in the future
## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**secret_access_key** | **character** | aws secret access key, never returned in get requests | [optional] 
**access_key_id** | **character** | aws access key | [optional] 
**service_role_arn** | **character** | aws service role to use for access | [optional] 
**name** | **character** | human readable name | [optional] 
**default** | **character** | true if this is the default credential to be used within this namespace | [optional] 
**buckets** | **array[character]** | a whitelist of one or more buckets this key should access | [optional] 
**created_at** | **character** | Time when udf dependencies was created (rfc3339) | [optional] [readonly] 
**updated_at** | **character** | Time when udf dependencies was last updated (rfc3339) | [optional] [readonly] 


