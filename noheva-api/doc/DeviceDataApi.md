# noheva_api.api.DeviceDataApi

## Load the API package
```dart
import 'package:noheva_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**listDeviceDataLayouts**](DeviceDataApi.md#listdevicedatalayouts) | **GET** /v1/deviceData/{deviceId}/layouts | List layouts for this device.
[**listDeviceDataPages**](DeviceDataApi.md#listdevicedatapages) | **GET** /v1/deviceData/{deviceId}/pages | List pages for this device.
[**listDeviceDataSettings**](DeviceDataApi.md#listdevicedatasettings) | **GET** /v1/deviceData/{deviceId}/settings | List device settings for this device


# **listDeviceDataLayouts**
> BuiltList<DeviceLayout> listDeviceDataLayouts(deviceId)

List layouts for this device.

List device layouts for this device. Only devices access this endpoint.

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure API key authorization: deviceAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('deviceAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('deviceAuth').apiKeyPrefix = 'Bearer';

final api = NohevaApi().getDeviceDataApi();
final String deviceId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Device id of the device. Device id is resolved into exhibition device by using active exhibition.

try {
    final response = api.listDeviceDataLayouts(deviceId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DeviceDataApi->listDeviceDataLayouts: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **String**| Device id of the device. Device id is resolved into exhibition device by using active exhibition. | 

### Return type

[**BuiltList&lt;DeviceLayout&gt;**](DeviceLayout.md)

### Authorization

[deviceAuth](../README.md#deviceAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listDeviceDataPages**
> BuiltList<DevicePage> listDeviceDataPages(deviceId)

List pages for this device.

List pages for this device. Only devices access this endpoint.

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure API key authorization: deviceAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('deviceAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('deviceAuth').apiKeyPrefix = 'Bearer';

final api = NohevaApi().getDeviceDataApi();
final String deviceId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Device id of the device. Device id is resolved into exhibition device by using active exhibition.

try {
    final response = api.listDeviceDataPages(deviceId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DeviceDataApi->listDeviceDataPages: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **String**| Device id of the device. Device id is resolved into exhibition device by using active exhibition. | 

### Return type

[**BuiltList&lt;DevicePage&gt;**](DevicePage.md)

### Authorization

[deviceAuth](../README.md#deviceAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listDeviceDataSettings**
> BuiltList<DeviceSetting> listDeviceDataSettings(deviceId)

List device settings for this device

List device settings for this device. Only devices can access this endpoint.

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure API key authorization: deviceAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('deviceAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('deviceAuth').apiKeyPrefix = 'Bearer';

final api = NohevaApi().getDeviceDataApi();
final String deviceId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Device id of the device. Device id is resolved into exhibition device by using active exhibition.

try {
    final response = api.listDeviceDataSettings(deviceId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DeviceDataApi->listDeviceDataSettings: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **String**| Device id of the device. Device id is resolved into exhibition device by using active exhibition. | 

### Return type

[**BuiltList&lt;DeviceSetting&gt;**](DeviceSetting.md)

### Authorization

[deviceAuth](../README.md#deviceAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

