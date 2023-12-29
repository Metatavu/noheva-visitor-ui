# noheva_api.api.ExhibitionRoomsApi

## Load the API package
```dart
import 'package:noheva_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createExhibitionRoom**](ExhibitionRoomsApi.md#createexhibitionroom) | **POST** /v1/exhibitions/{exhibitionId}/rooms | Create a room
[**deleteExhibitionRoom**](ExhibitionRoomsApi.md#deleteexhibitionroom) | **DELETE** /v1/exhibitions/{exhibitionId}/rooms/{roomId} | Deletes room.
[**findExhibitionRoom**](ExhibitionRoomsApi.md#findexhibitionroom) | **GET** /v1/exhibitions/{exhibitionId}/rooms/{roomId} | Find a room
[**listExhibitionRooms**](ExhibitionRoomsApi.md#listexhibitionrooms) | **GET** /v1/exhibitions/{exhibitionId}/rooms | List rooms
[**updateExhibitionRoom**](ExhibitionRoomsApi.md#updateexhibitionroom) | **PUT** /v1/exhibitions/{exhibitionId}/rooms/{roomId} | Updates room.


# **createExhibitionRoom**
> ExhibitionRoom createExhibitionRoom(exhibitionId, exhibitionRoom)

Create a room

Creates new exhibition room

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getExhibitionRoomsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final ExhibitionRoom exhibitionRoom = ; // ExhibitionRoom | Payload

try {
    final response = api.createExhibitionRoom(exhibitionId, exhibitionRoom);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ExhibitionRoomsApi->createExhibitionRoom: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **exhibitionRoom** | [**ExhibitionRoom**](ExhibitionRoom.md)| Payload | 

### Return type

[**ExhibitionRoom**](ExhibitionRoom.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteExhibitionRoom**
> deleteExhibitionRoom(exhibitionId, roomId)

Deletes room.

Delets exhibition room.

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getExhibitionRoomsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String roomId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | room id

try {
    api.deleteExhibitionRoom(exhibitionId, roomId);
} catch on DioError (e) {
    print('Exception when calling ExhibitionRoomsApi->deleteExhibitionRoom: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **roomId** | **String**| room id | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findExhibitionRoom**
> ExhibitionRoom findExhibitionRoom(exhibitionId, roomId)

Find a room

Finds a room by id

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getExhibitionRoomsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String roomId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | room id

try {
    final response = api.findExhibitionRoom(exhibitionId, roomId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ExhibitionRoomsApi->findExhibitionRoom: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **roomId** | **String**| room id | 

### Return type

[**ExhibitionRoom**](ExhibitionRoom.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listExhibitionRooms**
> BuiltList<ExhibitionRoom> listExhibitionRooms(exhibitionId, floorId)

List rooms

List exhibition rooms

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getExhibitionRoomsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String floorId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition floor id

try {
    final response = api.listExhibitionRooms(exhibitionId, floorId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ExhibitionRoomsApi->listExhibitionRooms: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **floorId** | **String**| exhibition floor id | [optional] 

### Return type

[**BuiltList&lt;ExhibitionRoom&gt;**](ExhibitionRoom.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateExhibitionRoom**
> ExhibitionRoom updateExhibitionRoom(exhibitionId, roomId, exhibitionRoom)

Updates room.

Updates room.

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getExhibitionRoomsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String roomId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | room id
final ExhibitionRoom exhibitionRoom = ; // ExhibitionRoom | Payload

try {
    final response = api.updateExhibitionRoom(exhibitionId, roomId, exhibitionRoom);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ExhibitionRoomsApi->updateExhibitionRoom: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **roomId** | **String**| room id | 
 **exhibitionRoom** | [**ExhibitionRoom**](ExhibitionRoom.md)| Payload | 

### Return type

[**ExhibitionRoom**](ExhibitionRoom.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

