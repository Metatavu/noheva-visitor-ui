# noheva_api.model.DevicePage

## Load the model package
```dart
import 'package:noheva_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | Page id. | 
**exhibitionId** | **String** | Id of exhibition this page belongs to | 
**layoutId** | **String** | Id of page layout | 
**name** | **String** | Human readable name for the page | [optional] 
**resources** | [**BuiltList&lt;DevicePageResource&gt;**](DevicePageResource.md) |  | 
**eventTriggers** | [**BuiltList&lt;ExhibitionPageEventTrigger&gt;**](ExhibitionPageEventTrigger.md) |  | [optional] 
**enterTransitions** | [**BuiltList&lt;ExhibitionPageTransition&gt;**](ExhibitionPageTransition.md) |  | [optional] 
**exitTransitions** | [**BuiltList&lt;ExhibitionPageTransition&gt;**](ExhibitionPageTransition.md) |  | [optional] 
**orderNumber** | **int** |  | 
**language** | **String** | Language of the given page. Language is detected from content version this page belongs to. | 
**activeConditionUserVariable** | **String** | Active condition user variable. This property is present only when page belongs to conditionally active content version. | [optional] 
**activeConditionEquals** | **String** | Active condition equals value. This property is present only when page belongs to conditionally active content version. | [optional] 
**modifiedAt** | [**DateTime**](DateTime.md) | Date modified | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


