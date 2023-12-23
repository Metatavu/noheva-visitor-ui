# noheva_api.api.DevicesApi

## Load the API package
```dart
import 'package:noheva_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createDevice**](DevicesApi.md#createdevice) | **POST** /v1/fleet/devices | Creates a Device
[**deleteDevice**](DevicesApi.md#deletedevice) | **DELETE** /v1/fleet/devices/{deviceId} | Deletes Device
[**findDevice**](DevicesApi.md#finddevice) | **GET** /v1/fleet/devices/{deviceId} | Find a Device.
[**getDeviceKey**](DevicesApi.md#getdevicekey) | **PUT** /v1/fleet/devices/{deviceId}/key | Gets device key
[**listDevices**](DevicesApi.md#listdevices) | **GET** /v1/fleet/devices | List devices.
[**updateDevice**](DevicesApi.md#updatedevice) | **PUT** /v1/fleet/devices/{deviceId} | Updates Device


# **createDevice**
> Device createDevice(deviceRequest)

Creates a Device

Creates a new Device

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getDevicesApi();
final DeviceRequest deviceRequest = ; // DeviceRequest | Payload

try {
    final response = api.createDevice(deviceRequest);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DevicesApi->createDevice: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceRequest** | [**DeviceRequest**](DeviceRequest.md)| Payload | 

### Return type

[**Device**](Device.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteDevice**
> deleteDevice(deviceId)

Deletes Device

Deletes Device

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getDevicesApi();
final String deviceId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Device id

try {
    api.deleteDevice(deviceId);
} catch on DioError (e) {
    print('Exception when calling DevicesApi->deleteDevice: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **String**| Device id | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findDevice**
> Device findDevice(deviceId)

Find a Device.

Finds a Device by id.

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getDevicesApi();
final String deviceId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Device id

try {
    final response = api.findDevice(deviceId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DevicesApi->findDevice: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **String**| Device id | 

### Return type

[**Device**](Device.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDeviceKey**
> DeviceKey getDeviceKey(deviceId)

Gets device key

Gets device key if device is approved.

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getDevicesApi();
final String deviceId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Device id

try {
    final response = api.getDeviceKey(deviceId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DevicesApi->getDeviceKey: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **String**| Device id | 

### Return type

[**DeviceKey**](DeviceKey.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listDevices**
> BuiltList<Device> listDevices(status, approvalStatus)

List devices.

Lists devices.

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getDevicesApi();
final DeviceStatus status = ; // DeviceStatus | Status
final DeviceApprovalStatus approvalStatus = ; // DeviceApprovalStatus | Approval status

try {
    final response = api.listDevices(status, approvalStatus);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DevicesApi->listDevices: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **status** | [**DeviceStatus**](.md)| Status | [optional] 
 **approvalStatus** | [**DeviceApprovalStatus**](.md)| Approval status | [optional] 

### Return type

[**BuiltList&lt;Device&gt;**](Device.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateDevice**
> Device updateDevice(deviceId, device)

Updates Device

Updates Device

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getDevicesApi();
final String deviceId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Device id
final Device device = ; // Device | Payload

try {
    final response = api.updateDevice(deviceId, device);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DevicesApi->updateDevice: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **String**| Device id | 
 **device** | [**Device**](Device.md)| Payload | 

### Return type

[**Device**](Device.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

