# noheva_api.api.ContentVersionsApi

## Load the API package
```dart
import 'package:noheva_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createContentVersion**](ContentVersionsApi.md#createcontentversion) | **POST** /v1/exhibitions/{exhibitionId}/contentVersions | Create a content version
[**deleteContentVersion**](ContentVersionsApi.md#deletecontentversion) | **DELETE** /v1/exhibitions/{exhibitionId}/contentVersions/{contentVersionId} | Deletes content version.
[**findContentVersion**](ContentVersionsApi.md#findcontentversion) | **GET** /v1/exhibitions/{exhibitionId}/contentVersions/{contentVersionId} | Find a content version
[**listContentVersions**](ContentVersionsApi.md#listcontentversions) | **GET** /v1/exhibitions/{exhibitionId}/contentVersions | List content versions
[**updateContentVersion**](ContentVersionsApi.md#updatecontentversion) | **PUT** /v1/exhibitions/{exhibitionId}/contentVersions/{contentVersionId} | Updates content version.


# **createContentVersion**
> ContentVersion createContentVersion(exhibitionId, contentVersion)

Create a content version

Creates new content version

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getContentVersionsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final ContentVersion contentVersion = ; // ContentVersion | Payload

try {
    final response = api.createContentVersion(exhibitionId, contentVersion);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ContentVersionsApi->createContentVersion: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **contentVersion** | [**ContentVersion**](ContentVersion.md)| Payload | 

### Return type

[**ContentVersion**](ContentVersion.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteContentVersion**
> deleteContentVersion(exhibitionId, contentVersionId)

Deletes content version.

Delets content version.

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getContentVersionsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String contentVersionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | contentVersion id

try {
    api.deleteContentVersion(exhibitionId, contentVersionId);
} catch on DioError (e) {
    print('Exception when calling ContentVersionsApi->deleteContentVersion: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **contentVersionId** | **String**| contentVersion id | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findContentVersion**
> ContentVersion findContentVersion(exhibitionId, contentVersionId)

Find a content version

Finds a content version by id

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getContentVersionsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String contentVersionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | contentVersion id

try {
    final response = api.findContentVersion(exhibitionId, contentVersionId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ContentVersionsApi->findContentVersion: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **contentVersionId** | **String**| contentVersion id | 

### Return type

[**ContentVersion**](ContentVersion.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listContentVersions**
> BuiltList<ContentVersion> listContentVersions(exhibitionId, roomId, deviceGroupId)

List content versions

List content versions

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getContentVersionsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String roomId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Filter by room id
final String deviceGroupId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Filter by device group id

try {
    final response = api.listContentVersions(exhibitionId, roomId, deviceGroupId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ContentVersionsApi->listContentVersions: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **roomId** | **String**| Filter by room id | [optional] 
 **deviceGroupId** | **String**| Filter by device group id | [optional] 

### Return type

[**BuiltList&lt;ContentVersion&gt;**](ContentVersion.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateContentVersion**
> ContentVersion updateContentVersion(exhibitionId, contentVersionId, contentVersion)

Updates content version.

Updates content version.

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getContentVersionsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String contentVersionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | contentVersion id
final ContentVersion contentVersion = ; // ContentVersion | Payload

try {
    final response = api.updateContentVersion(exhibitionId, contentVersionId, contentVersion);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ContentVersionsApi->updateContentVersion: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **contentVersionId** | **String**| contentVersion id | 
 **contentVersion** | [**ContentVersion**](ContentVersion.md)| Payload | 

### Return type

[**ContentVersion**](ContentVersion.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

