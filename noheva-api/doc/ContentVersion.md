# noheva_api.model.ContentVersion

## Load the model package
```dart
import 'package:noheva_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | [optional] 
**exhibitionId** | **String** | Id of exhibition this page belongs to | [optional] 
**name** | **String** | Human readable name of the content version | 
**language** | **String** |  | 
**rooms** | **BuiltList&lt;String&gt;** |  | 
**activeCondition** | [**ContentVersionActiveCondition**](ContentVersionActiveCondition.md) |  | [optional] 
**status** | [**ContentVersionStatus**](ContentVersionStatus.md) |  | [optional] 
**deviceGroupId** | **String** | Id of device group | [optional] 
**creatorId** | **String** |  | [optional] 
**lastModifierId** | **String** |  | [optional] 
**createdAt** | [**DateTime**](DateTime.md) | Created date | [optional] 
**modifiedAt** | [**DateTime**](DateTime.md) | Date modified | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


