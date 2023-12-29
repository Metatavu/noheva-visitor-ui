# noheva_api.model.RfidAntenna

## Load the model package
```dart
import 'package:noheva_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | [optional] 
**exhibitionId** | **String** |  | [optional] 
**roomId** | **String** | Id of room this RFID antenna is located at | 
**groupId** | **String** | Device group id this antenna is conneted to | [optional] 
**readerId** | **String** | RFID reader module id | 
**antennaNumber** | **int** | RFID antenna number | 
**visitorSessionStartThreshold** | **int** | Strength threshold for login events | 
**visitorSessionEndThreshold** | **int** | Strength threshold for logout events | 
**name** | **String** | Human-readable name for this antenna | 
**location** | [**Point**](Point.md) |  | 
**creatorId** | **String** |  | [optional] 
**lastModifierId** | **String** |  | [optional] 
**createdAt** | [**DateTime**](DateTime.md) | Created date | [optional] 
**modifiedAt** | [**DateTime**](DateTime.md) | Date modified | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


