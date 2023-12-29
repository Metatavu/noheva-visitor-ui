# noheva_api.api.ExhibitionDeviceGroupsApi

## Load the API package
```dart
import 'package:noheva_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createExhibitionDeviceGroup**](ExhibitionDeviceGroupsApi.md#createexhibitiondevicegroup) | **POST** /v1/exhibitions/{exhibitionId}/deviceGroups | Create a device group
[**deleteExhibitionDeviceGroup**](ExhibitionDeviceGroupsApi.md#deleteexhibitiondevicegroup) | **DELETE** /v1/exhibitions/{exhibitionId}/deviceGroups/{deviceGroupId} | Deletes device group.
[**findExhibitionDeviceGroup**](ExhibitionDeviceGroupsApi.md#findexhibitiondevicegroup) | **GET** /v1/exhibitions/{exhibitionId}/deviceGroups/{deviceGroupId} | Find a device group
[**listExhibitionDeviceGroups**](ExhibitionDeviceGroupsApi.md#listexhibitiondevicegroups) | **GET** /v1/exhibitions/{exhibitionId}/deviceGroups | List device groups
[**updateExhibitionDeviceGroup**](ExhibitionDeviceGroupsApi.md#updateexhibitiondevicegroup) | **PUT** /v1/exhibitions/{exhibitionId}/deviceGroups/{deviceGroupId} | Updates device group.


# **createExhibitionDeviceGroup**
> ExhibitionDeviceGroup createExhibitionDeviceGroup(exhibitionId, sourceDeviceGroupId, exhibitionDeviceGroup)

Create a device group

Creates new exhibition device group

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getExhibitionDeviceGroupsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String sourceDeviceGroupId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Create device group using existing device group as a source. When source is defined, request cannot have a body
final ExhibitionDeviceGroup exhibitionDeviceGroup = ; // ExhibitionDeviceGroup | Payload

try {
    final response = api.createExhibitionDeviceGroup(exhibitionId, sourceDeviceGroupId, exhibitionDeviceGroup);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ExhibitionDeviceGroupsApi->createExhibitionDeviceGroup: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **sourceDeviceGroupId** | **String**| Create device group using existing device group as a source. When source is defined, request cannot have a body | [optional] 
 **exhibitionDeviceGroup** | [**ExhibitionDeviceGroup**](ExhibitionDeviceGroup.md)| Payload | [optional] 

### Return type

[**ExhibitionDeviceGroup**](ExhibitionDeviceGroup.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteExhibitionDeviceGroup**
> deleteExhibitionDeviceGroup(exhibitionId, deviceGroupId)

Deletes device group.

Delets exhibition device group.

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getExhibitionDeviceGroupsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String deviceGroupId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | device group id

try {
    api.deleteExhibitionDeviceGroup(exhibitionId, deviceGroupId);
} catch on DioError (e) {
    print('Exception when calling ExhibitionDeviceGroupsApi->deleteExhibitionDeviceGroup: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **deviceGroupId** | **String**| device group id | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findExhibitionDeviceGroup**
> ExhibitionDeviceGroup findExhibitionDeviceGroup(exhibitionId, deviceGroupId)

Find a device group

Finds a device group by id

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getExhibitionDeviceGroupsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String deviceGroupId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | device group id

try {
    final response = api.findExhibitionDeviceGroup(exhibitionId, deviceGroupId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ExhibitionDeviceGroupsApi->findExhibitionDeviceGroup: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **deviceGroupId** | **String**| device group id | 

### Return type

[**ExhibitionDeviceGroup**](ExhibitionDeviceGroup.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listExhibitionDeviceGroups**
> BuiltList<ExhibitionDeviceGroup> listExhibitionDeviceGroups(exhibitionId, roomId)

List device groups

List exhibition device groups

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getExhibitionDeviceGroupsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String roomId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | filter by room id

try {
    final response = api.listExhibitionDeviceGroups(exhibitionId, roomId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ExhibitionDeviceGroupsApi->listExhibitionDeviceGroups: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **roomId** | **String**| filter by room id | [optional] 

### Return type

[**BuiltList&lt;ExhibitionDeviceGroup&gt;**](ExhibitionDeviceGroup.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateExhibitionDeviceGroup**
> ExhibitionDeviceGroup updateExhibitionDeviceGroup(exhibitionId, deviceGroupId, exhibitionDeviceGroup)

Updates device group.

Updates device group.

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getExhibitionDeviceGroupsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String deviceGroupId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | device group id
final ExhibitionDeviceGroup exhibitionDeviceGroup = ; // ExhibitionDeviceGroup | Payload

try {
    final response = api.updateExhibitionDeviceGroup(exhibitionId, deviceGroupId, exhibitionDeviceGroup);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ExhibitionDeviceGroupsApi->updateExhibitionDeviceGroup: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **deviceGroupId** | **String**| device group id | 
 **exhibitionDeviceGroup** | [**ExhibitionDeviceGroup**](ExhibitionDeviceGroup.md)| Payload | 

### Return type

[**ExhibitionDeviceGroup**](ExhibitionDeviceGroup.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

