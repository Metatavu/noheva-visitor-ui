# noheva_api.api.ExhibitionFloorsApi

## Load the API package
```dart
import 'package:noheva_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createExhibitionFloor**](ExhibitionFloorsApi.md#createexhibitionfloor) | **POST** /v1/exhibitions/{exhibitionId}/floors | Create a floor
[**deleteExhibitionFloor**](ExhibitionFloorsApi.md#deleteexhibitionfloor) | **DELETE** /v1/exhibitions/{exhibitionId}/floors/{floorId} | Deletes floor.
[**findExhibitionFloor**](ExhibitionFloorsApi.md#findexhibitionfloor) | **GET** /v1/exhibitions/{exhibitionId}/floors/{floorId} | Find a floor
[**listExhibitionFloors**](ExhibitionFloorsApi.md#listexhibitionfloors) | **GET** /v1/exhibitions/{exhibitionId}/floors | List floors
[**updateExhibitionFloor**](ExhibitionFloorsApi.md#updateexhibitionfloor) | **PUT** /v1/exhibitions/{exhibitionId}/floors/{floorId} | Updates floor.


# **createExhibitionFloor**
> ExhibitionFloor createExhibitionFloor(exhibitionId, exhibitionFloor)

Create a floor

Creates new exhibition floor

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getExhibitionFloorsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final ExhibitionFloor exhibitionFloor = ; // ExhibitionFloor | Payload

try {
    final response = api.createExhibitionFloor(exhibitionId, exhibitionFloor);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ExhibitionFloorsApi->createExhibitionFloor: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **exhibitionFloor** | [**ExhibitionFloor**](ExhibitionFloor.md)| Payload | 

### Return type

[**ExhibitionFloor**](ExhibitionFloor.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteExhibitionFloor**
> deleteExhibitionFloor(exhibitionId, floorId)

Deletes floor.

Delets exhibition floor.

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getExhibitionFloorsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String floorId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | floor id

try {
    api.deleteExhibitionFloor(exhibitionId, floorId);
} catch on DioError (e) {
    print('Exception when calling ExhibitionFloorsApi->deleteExhibitionFloor: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **floorId** | **String**| floor id | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findExhibitionFloor**
> ExhibitionFloor findExhibitionFloor(exhibitionId, floorId)

Find a floor

Finds a floor by id

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getExhibitionFloorsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String floorId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | floor id

try {
    final response = api.findExhibitionFloor(exhibitionId, floorId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ExhibitionFloorsApi->findExhibitionFloor: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **floorId** | **String**| floor id | 

### Return type

[**ExhibitionFloor**](ExhibitionFloor.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listExhibitionFloors**
> BuiltList<ExhibitionFloor> listExhibitionFloors(exhibitionId)

List floors

List exhibition floors

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getExhibitionFloorsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id

try {
    final response = api.listExhibitionFloors(exhibitionId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ExhibitionFloorsApi->listExhibitionFloors: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 

### Return type

[**BuiltList&lt;ExhibitionFloor&gt;**](ExhibitionFloor.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateExhibitionFloor**
> ExhibitionFloor updateExhibitionFloor(exhibitionId, floorId, exhibitionFloor)

Updates floor.

Updates floor.

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getExhibitionFloorsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String floorId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | floor id
final ExhibitionFloor exhibitionFloor = ; // ExhibitionFloor | Payload

try {
    final response = api.updateExhibitionFloor(exhibitionId, floorId, exhibitionFloor);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ExhibitionFloorsApi->updateExhibitionFloor: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **floorId** | **String**| floor id | 
 **exhibitionFloor** | [**ExhibitionFloor**](ExhibitionFloor.md)| Payload | 

### Return type

[**ExhibitionFloor**](ExhibitionFloor.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

