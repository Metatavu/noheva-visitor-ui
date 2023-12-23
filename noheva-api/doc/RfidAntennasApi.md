# noheva_api.api.RfidAntennasApi

## Load the API package
```dart
import 'package:noheva_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createRfidAntenna**](RfidAntennasApi.md#createrfidantenna) | **POST** /v1/exhibitions/{exhibitionId}/rfidAntennas | Create an RFID antenna
[**deleteRfidAntenna**](RfidAntennasApi.md#deleterfidantenna) | **DELETE** /v1/exhibitions/{exhibitionId}/rfidAntennas/{rfidAntennaId} | Deletes RFID antenna.
[**findRfidAntenna**](RfidAntennasApi.md#findrfidantenna) | **GET** /v1/exhibitions/{exhibitionId}/rfidAntennas/{rfidAntennaId} | Find an RFID antenna
[**listRfidAntennas**](RfidAntennasApi.md#listrfidantennas) | **GET** /v1/exhibitions/{exhibitionId}/rfidAntennas | List RFID antennas
[**updateRfidAntenna**](RfidAntennasApi.md#updaterfidantenna) | **PUT** /v1/exhibitions/{exhibitionId}/rfidAntennas/{rfidAntennaId} | Updates RFID antenna.


# **createRfidAntenna**
> RfidAntenna createRfidAntenna(exhibitionId, rfidAntenna)

Create an RFID antenna

Creates a new RFID antenna

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getRfidAntennasApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final RfidAntenna rfidAntenna = ; // RfidAntenna | Payload

try {
    final response = api.createRfidAntenna(exhibitionId, rfidAntenna);
    print(response);
} catch on DioError (e) {
    print('Exception when calling RfidAntennasApi->createRfidAntenna: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **rfidAntenna** | [**RfidAntenna**](RfidAntenna.md)| Payload | 

### Return type

[**RfidAntenna**](RfidAntenna.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteRfidAntenna**
> deleteRfidAntenna(exhibitionId, rfidAntennaId)

Deletes RFID antenna.

Deletes RFID antenna.

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getRfidAntennasApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String rfidAntennaId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | RFID antena id

try {
    api.deleteRfidAntenna(exhibitionId, rfidAntennaId);
} catch on DioError (e) {
    print('Exception when calling RfidAntennasApi->deleteRfidAntenna: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **rfidAntennaId** | **String**| RFID antena id | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findRfidAntenna**
> RfidAntenna findRfidAntenna(exhibitionId, rfidAntennaId)

Find an RFID antenna

Finds an RFID antenna by id

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getRfidAntennasApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String rfidAntennaId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | RFID antena id

try {
    final response = api.findRfidAntenna(exhibitionId, rfidAntennaId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling RfidAntennasApi->findRfidAntenna: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **rfidAntennaId** | **String**| RFID antena id | 

### Return type

[**RfidAntenna**](RfidAntenna.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listRfidAntennas**
> BuiltList<RfidAntenna> listRfidAntennas(exhibitionId, roomId, deviceGroupId)

List RFID antennas

List RFID antennas

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getRfidAntennasApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Exhibition id
final String roomId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Filter by room id
final String deviceGroupId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Filter by device group id

try {
    final response = api.listRfidAntennas(exhibitionId, roomId, deviceGroupId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling RfidAntennasApi->listRfidAntennas: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| Exhibition id | 
 **roomId** | **String**| Filter by room id | [optional] 
 **deviceGroupId** | **String**| Filter by device group id | [optional] 

### Return type

[**BuiltList&lt;RfidAntenna&gt;**](RfidAntenna.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateRfidAntenna**
> RfidAntenna updateRfidAntenna(exhibitionId, rfidAntennaId, rfidAntenna)

Updates RFID antenna.

Updates RFID antenna.

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getRfidAntennasApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String rfidAntennaId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | RFID antena id
final RfidAntenna rfidAntenna = ; // RfidAntenna | Payload

try {
    final response = api.updateRfidAntenna(exhibitionId, rfidAntennaId, rfidAntenna);
    print(response);
} catch on DioError (e) {
    print('Exception when calling RfidAntennasApi->updateRfidAntenna: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **rfidAntennaId** | **String**| RFID antena id | 
 **rfidAntenna** | [**RfidAntenna**](RfidAntenna.md)| Payload | 

### Return type

[**RfidAntenna**](RfidAntenna.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

