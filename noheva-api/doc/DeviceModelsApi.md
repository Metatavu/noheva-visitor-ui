# noheva_api.api.DeviceModelsApi

## Load the API package
```dart
import 'package:noheva_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createDeviceModel**](DeviceModelsApi.md#createdevicemodel) | **POST** /v1/deviceModels | Create a device model
[**deleteDeviceModel**](DeviceModelsApi.md#deletedevicemodel) | **DELETE** /v1/deviceModels/{deviceModelId} | Deletes device model.
[**findDeviceModel**](DeviceModelsApi.md#finddevicemodel) | **GET** /v1/deviceModels/{deviceModelId} | Find a device model
[**listDeviceModels**](DeviceModelsApi.md#listdevicemodels) | **GET** /v1/deviceModels | List device models
[**updateDeviceModel**](DeviceModelsApi.md#updatedevicemodel) | **PUT** /v1/deviceModels/{deviceModelId} | Updates device model.


# **createDeviceModel**
> DeviceModel createDeviceModel(deviceModel)

Create a device model

Creates new exhibition device model

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getDeviceModelsApi();
final DeviceModel deviceModel = ; // DeviceModel | Payload

try {
    final response = api.createDeviceModel(deviceModel);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DeviceModelsApi->createDeviceModel: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceModel** | [**DeviceModel**](DeviceModel.md)| Payload | 

### Return type

[**DeviceModel**](DeviceModel.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteDeviceModel**
> deleteDeviceModel(deviceModelId)

Deletes device model.

Delets exhibition device model.

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getDeviceModelsApi();
final String deviceModelId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | device model id

try {
    api.deleteDeviceModel(deviceModelId);
} catch on DioError (e) {
    print('Exception when calling DeviceModelsApi->deleteDeviceModel: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceModelId** | **String**| device model id | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findDeviceModel**
> DeviceModel findDeviceModel(deviceModelId)

Find a device model

Finds a device model by id

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getDeviceModelsApi();
final String deviceModelId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | device model id

try {
    final response = api.findDeviceModel(deviceModelId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DeviceModelsApi->findDeviceModel: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceModelId** | **String**| device model id | 

### Return type

[**DeviceModel**](DeviceModel.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listDeviceModels**
> BuiltList<DeviceModel> listDeviceModels()

List device models

List exhibition device models

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getDeviceModelsApi();

try {
    final response = api.listDeviceModels();
    print(response);
} catch on DioError (e) {
    print('Exception when calling DeviceModelsApi->listDeviceModels: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;DeviceModel&gt;**](DeviceModel.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateDeviceModel**
> DeviceModel updateDeviceModel(deviceModelId, deviceModel)

Updates device model.

Updates device model.

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getDeviceModelsApi();
final String deviceModelId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | device model id
final DeviceModel deviceModel = ; // DeviceModel | Payload

try {
    final response = api.updateDeviceModel(deviceModelId, deviceModel);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DeviceModelsApi->updateDeviceModel: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceModelId** | **String**| device model id | 
 **deviceModel** | [**DeviceModel**](DeviceModel.md)| Payload | 

### Return type

[**DeviceModel**](DeviceModel.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

