# noheva_api.model.DevicePageResource

## Load the model package
```dart
import 'package:noheva_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | Resource id. | 
**data** | **String** | Resource data. This is either string or an URL to resource data. | 
**mode** | [**PageResourceMode**](PageResourceMode.md) |  | [optional] 
**type** | [**ExhibitionPageResourceType**](ExhibitionPageResourceType.md) |  | 
**component** | **String** | Name of the layout component this resource is attached to. | [optional] 
**property** | **String** | Name of the property this resource is attached to. Property name be one of the following: - #text (element text content) - style-<style name> (element style)  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


