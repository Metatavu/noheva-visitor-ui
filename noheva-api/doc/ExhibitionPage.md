# noheva_api.model.ExhibitionPage

## Load the model package
```dart
import 'package:noheva_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | [optional] 
**exhibitionId** | **String** | Id of exhibition this page belongs to | [optional] 
**deviceId** | **String** | Id of device this page belongs to | 
**layoutId** | **String** | Id of page layout | 
**contentVersionId** | **String** | Id of content version | 
**name** | **String** | Human readable name for the layout | 
**resources** | [**BuiltList&lt;ExhibitionPageResource&gt;**](ExhibitionPageResource.md) |  | 
**eventTriggers** | [**BuiltList&lt;ExhibitionPageEventTrigger&gt;**](ExhibitionPageEventTrigger.md) |  | 
**enterTransitions** | [**BuiltList&lt;ExhibitionPageTransition&gt;**](ExhibitionPageTransition.md) |  | 
**exitTransitions** | [**BuiltList&lt;ExhibitionPageTransition&gt;**](ExhibitionPageTransition.md) |  | 
**orderNumber** | **int** |  | 
**creatorId** | **String** |  | [optional] 
**lastModifierId** | **String** |  | [optional] 
**createdAt** | [**DateTime**](DateTime.md) | Created date | [optional] 
**modifiedAt** | [**DateTime**](DateTime.md) | Date modified | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


