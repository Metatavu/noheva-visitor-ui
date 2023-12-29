# noheva_api.api.ExhibitionDevicesApi

## Load the API package
```dart
import 'package:noheva_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createExhibitionDevice**](ExhibitionDevicesApi.md#createexhibitiondevice) | **POST** /v1/exhibitions/{exhibitionId}/devices | Create a device
[**deleteExhibitionDevice**](ExhibitionDevicesApi.md#deleteexhibitiondevice) | **DELETE** /v1/exhibitions/{exhibitionId}/devices/{deviceId} | Deletes device.
[**findExhibitionDevice**](ExhibitionDevicesApi.md#findexhibitiondevice) | **GET** /v1/exhibitions/{exhibitionId}/devices/{deviceId} | Find a device
[**listExhibitionDevices**](ExhibitionDevicesApi.md#listexhibitiondevices) | **GET** /v1/exhibitions/{exhibitionId}/devices | List devices
[**updateExhibitionDevice**](ExhibitionDevicesApi.md#updateexhibitiondevice) | **PUT** /v1/exhibitions/{exhibitionId}/devices/{deviceId} | Updates device.


# **createExhibitionDevice**
> ExhibitionDevice createExhibitionDevice(exhibitionId, exhibitionDevice)

Create a device

Creates new exhibition device

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getExhibitionDevicesApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final ExhibitionDevice exhibitionDevice = ; // ExhibitionDevice | Payload

try {
    final response = api.createExhibitionDevice(exhibitionId, exhibitionDevice);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ExhibitionDevicesApi->createExhibitionDevice: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **exhibitionDevice** | [**ExhibitionDevice**](ExhibitionDevice.md)| Payload | 

### Return type

[**ExhibitionDevice**](ExhibitionDevice.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteExhibitionDevice**
> deleteExhibitionDevice(exhibitionId, deviceId)

Deletes device.

Delets exhibition device.

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getExhibitionDevicesApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String deviceId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | device id

try {
    api.deleteExhibitionDevice(exhibitionId, deviceId);
} catch on DioError (e) {
    print('Exception when calling ExhibitionDevicesApi->deleteExhibitionDevice: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **deviceId** | **String**| device id | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findExhibitionDevice**
> ExhibitionDevice findExhibitionDevice(exhibitionId, deviceId)

Find a device

Finds a device by id

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getExhibitionDevicesApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String deviceId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | device id

try {
    final response = api.findExhibitionDevice(exhibitionId, deviceId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ExhibitionDevicesApi->findExhibitionDevice: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **deviceId** | **String**| device id | 

### Return type

[**ExhibitionDevice**](ExhibitionDevice.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listExhibitionDevices**
> BuiltList<ExhibitionDevice> listExhibitionDevices(exhibitionId, exhibitionGroupId, deviceModelId)

List devices

List exhibition devices

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getExhibitionDevicesApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Exhibition id
final String exhibitionGroupId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Filter by exhibition group id
final String deviceModelId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Filter by device model id

try {
    final response = api.listExhibitionDevices(exhibitionId, exhibitionGroupId, deviceModelId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ExhibitionDevicesApi->listExhibitionDevices: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| Exhibition id | 
 **exhibitionGroupId** | **String**| Filter by exhibition group id | [optional] 
 **deviceModelId** | **String**| Filter by device model id | [optional] 

### Return type

[**BuiltList&lt;ExhibitionDevice&gt;**](ExhibitionDevice.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateExhibitionDevice**
> ExhibitionDevice updateExhibitionDevice(exhibitionId, deviceId, exhibitionDevice)

Updates device.

Updates device.

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getExhibitionDevicesApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String deviceId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | device id
final ExhibitionDevice exhibitionDevice = ; // ExhibitionDevice | Payload

try {
    final response = api.updateExhibitionDevice(exhibitionId, deviceId, exhibitionDevice);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ExhibitionDevicesApi->updateExhibitionDevice: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **deviceId** | **String**| device id | 
 **exhibitionDevice** | [**ExhibitionDevice**](ExhibitionDevice.md)| Payload | 

### Return type

[**ExhibitionDevice**](ExhibitionDevice.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

