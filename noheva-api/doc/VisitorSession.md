# noheva_api.model.VisitorSession

## Load the model package
```dart
import 'package:noheva_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | Unique id for the session | [optional] 
**exhibitionId** | **String** | Exhibition id the visiotr was attending to | [optional] 
**state** | [**VisitorSessionState**](VisitorSessionState.md) |  | 
**language** | **String** |  | 
**variables** | [**BuiltList&lt;VisitorSessionVariable&gt;**](VisitorSessionVariable.md) |  | [optional] 
**visitorIds** | **BuiltList&lt;String&gt;** |  | 
**visitedDeviceGroups** | [**BuiltList&lt;VisitorSessionVisitedDeviceGroup&gt;**](VisitorSessionVisitedDeviceGroup.md) |  | [optional] 
**creatorId** | **String** |  | [optional] 
**lastModifierId** | **String** |  | [optional] 
**createdAt** | [**DateTime**](DateTime.md) | Created date | [optional] 
**modifiedAt** | [**DateTime**](DateTime.md) | Date modified | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


