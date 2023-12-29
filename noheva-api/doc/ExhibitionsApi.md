# noheva_api.api.ExhibitionsApi

## Load the API package
```dart
import 'package:noheva_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createExhibition**](ExhibitionsApi.md#createexhibition) | **POST** /v1/exhibitions | Create a exhibition.
[**deleteExhibition**](ExhibitionsApi.md#deleteexhibition) | **DELETE** /v1/exhibitions/{exhibitionId} | Deletes exhibition.
[**findExhibition**](ExhibitionsApi.md#findexhibition) | **GET** /v1/exhibitions/{exhibitionId} | Find a exhibition.
[**listExhibitions**](ExhibitionsApi.md#listexhibitions) | **GET** /v1/exhibitions | List exhibitions.
[**updateExhibition**](ExhibitionsApi.md#updateexhibition) | **PUT** /v1/exhibitions/{exhibitionId} | Updates exhibition.


# **createExhibition**
> Exhibition createExhibition(sourceExhibitionId, exhibition)

Create a exhibition.

Creates new exhibition

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getExhibitionsApi();
final String sourceExhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Create exhibition using existing exhibition as a source. When source is defined, request cannot have a body
final Exhibition exhibition = ; // Exhibition | Payload

try {
    final response = api.createExhibition(sourceExhibitionId, exhibition);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ExhibitionsApi->createExhibition: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sourceExhibitionId** | **String**| Create exhibition using existing exhibition as a source. When source is defined, request cannot have a body | [optional] 
 **exhibition** | [**Exhibition**](Exhibition.md)| Payload | [optional] 

### Return type

[**Exhibition**](Exhibition.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteExhibition**
> deleteExhibition(exhibitionId)

Deletes exhibition.

Delets exhibition

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getExhibitionsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id

try {
    api.deleteExhibition(exhibitionId);
} catch on DioError (e) {
    print('Exception when calling ExhibitionsApi->deleteExhibition: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findExhibition**
> Exhibition findExhibition(exhibitionId)

Find a exhibition.

Finds a exhibition by id

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getExhibitionsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id

try {
    final response = api.findExhibition(exhibitionId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ExhibitionsApi->findExhibition: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 

### Return type

[**Exhibition**](Exhibition.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listExhibitions**
> BuiltList<Exhibition> listExhibitions()

List exhibitions.

Lists a exhibition

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getExhibitionsApi();

try {
    final response = api.listExhibitions();
    print(response);
} catch on DioError (e) {
    print('Exception when calling ExhibitionsApi->listExhibitions: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;Exhibition&gt;**](Exhibition.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateExhibition**
> Exhibition updateExhibition(exhibitionId, exhibition)

Updates exhibition.

Updates exhibition

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getExhibitionsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final Exhibition exhibition = ; // Exhibition | Payload

try {
    final response = api.updateExhibition(exhibitionId, exhibition);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ExhibitionsApi->updateExhibition: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **exhibition** | [**Exhibition**](Exhibition.md)| Payload | 

### Return type

[**Exhibition**](Exhibition.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

