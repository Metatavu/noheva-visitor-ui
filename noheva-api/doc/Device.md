# noheva_api.model.Device

## Load the model package
```dart
import 'package:noheva_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | ID of Device | [optional] 
**deviceModelId** | **String** | Device Model ID | [optional] 
**name** | **String** | Name of Device | [optional] 
**serialNumber** | **String** | Serial Number of Device | 
**description** | **String** | Description of Device | [optional] 
**approvalStatus** | [**DeviceApprovalStatus**](DeviceApprovalStatus.md) |  | 
**status** | [**DeviceStatus**](DeviceStatus.md) |  | 
**deviceType** | [**DeviceType**](DeviceType.md) |  | 
**version** | **String** | Version of the application on Device | 
**warrantyExpiry** | [**DateTime**](DateTime.md) | Date when the warranty expires | [optional] 
**usageHours** | **double** | Number of hours the Device has been used | [optional] 
**lastConnected** | [**DateTime**](DateTime.md) | Last time the Device was connected | [optional] 
**lastSeen** | [**DateTime**](DateTime.md) | Last time the device was seen | [optional] 
**lastModifierId** | **String** |  | [optional] 
**createdAt** | [**DateTime**](DateTime.md) | Created date | [optional] 
**modifiedAt** | [**DateTime**](DateTime.md) | Date modified | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


