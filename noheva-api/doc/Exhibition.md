# noheva_api.model.Exhibition

## Load the model package
```dart
import 'package:noheva_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | [optional] 
**name** | **String** |  | 
**active** | **bool** | Whether the exhibition is active or not. Only one exhibition can be active at a time so if this is set to true, all other exhibitions will be set to false. | [optional] 
**creatorId** | **String** |  | [optional] 
**lastModifierId** | **String** |  | [optional] 
**createdAt** | [**DateTime**](DateTime.md) | Created date | [optional] 
**modifiedAt** | [**DateTime**](DateTime.md) | Date modified | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


