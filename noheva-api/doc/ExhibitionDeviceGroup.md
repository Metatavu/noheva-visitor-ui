# noheva_api.model.ExhibitionDeviceGroup

## Load the model package
```dart
import 'package:noheva_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | [optional] 
**exhibitionId** | **String** |  | [optional] 
**roomId** | **String** |  | [optional] 
**name** | **String** |  | 
**allowVisitorSessionCreation** | **bool** |  | 
**visitorSessionEndTimeout** | **int** | Timeout for visitor session | 
**indexPageTimeout** | **int** | Time after inactive visitor will returned to the index page. Ignored if not specified | [optional] 
**visitorSessionStartStrategy** | [**DeviceGroupVisitorSessionStartStrategy**](DeviceGroupVisitorSessionStartStrategy.md) |  | 
**creatorId** | **String** |  | [optional] 
**lastModifierId** | **String** |  | [optional] 
**createdAt** | [**DateTime**](DateTime.md) | Created date | [optional] 
**modifiedAt** | [**DateTime**](DateTime.md) | Date modified | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


