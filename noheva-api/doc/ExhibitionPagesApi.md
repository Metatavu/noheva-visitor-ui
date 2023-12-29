# noheva_api.api.ExhibitionPagesApi

## Load the API package
```dart
import 'package:noheva_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createExhibitionPage**](ExhibitionPagesApi.md#createexhibitionpage) | **POST** /v1/exhibitions/{exhibitionId}/pages | Create a page
[**deleteExhibitionPage**](ExhibitionPagesApi.md#deleteexhibitionpage) | **DELETE** /v1/exhibitions/{exhibitionId}/pages/{pageId} | Deletes page.
[**findExhibitionPage**](ExhibitionPagesApi.md#findexhibitionpage) | **GET** /v1/exhibitions/{exhibitionId}/pages/{pageId} | Find a page
[**listExhibitionPages**](ExhibitionPagesApi.md#listexhibitionpages) | **GET** /v1/exhibitions/{exhibitionId}/pages | List pages
[**updateExhibitionPage**](ExhibitionPagesApi.md#updateexhibitionpage) | **PUT** /v1/exhibitions/{exhibitionId}/pages/{pageId} | Updates page.


# **createExhibitionPage**
> ExhibitionPage createExhibitionPage(exhibitionId, exhibitionPage)

Create a page

Creates new exhibition page

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getExhibitionPagesApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final ExhibitionPage exhibitionPage = ; // ExhibitionPage | Payload

try {
    final response = api.createExhibitionPage(exhibitionId, exhibitionPage);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ExhibitionPagesApi->createExhibitionPage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **exhibitionPage** | [**ExhibitionPage**](ExhibitionPage.md)| Payload | 

### Return type

[**ExhibitionPage**](ExhibitionPage.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteExhibitionPage**
> deleteExhibitionPage(exhibitionId, pageId)

Deletes page.

Delets exhibition page.

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getExhibitionPagesApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String pageId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | page id

try {
    api.deleteExhibitionPage(exhibitionId, pageId);
} catch on DioError (e) {
    print('Exception when calling ExhibitionPagesApi->deleteExhibitionPage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **pageId** | **String**| page id | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findExhibitionPage**
> ExhibitionPage findExhibitionPage(exhibitionId, pageId)

Find a page

Finds a page by id

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getExhibitionPagesApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String pageId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | page id

try {
    final response = api.findExhibitionPage(exhibitionId, pageId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ExhibitionPagesApi->findExhibitionPage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **pageId** | **String**| page id | 

### Return type

[**ExhibitionPage**](ExhibitionPage.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listExhibitionPages**
> BuiltList<ExhibitionPage> listExhibitionPages(exhibitionId, contentVersionId, exhibitionDeviceId, pageLayoutId)

List pages

List exhibition pages

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getExhibitionPagesApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String contentVersionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Filter by content id
final String exhibitionDeviceId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Filter by device id
final String pageLayoutId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Filter by page layout id

try {
    final response = api.listExhibitionPages(exhibitionId, contentVersionId, exhibitionDeviceId, pageLayoutId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ExhibitionPagesApi->listExhibitionPages: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **contentVersionId** | **String**| Filter by content id | [optional] 
 **exhibitionDeviceId** | **String**| Filter by device id | [optional] 
 **pageLayoutId** | **String**| Filter by page layout id | [optional] 

### Return type

[**BuiltList&lt;ExhibitionPage&gt;**](ExhibitionPage.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateExhibitionPage**
> ExhibitionPage updateExhibitionPage(exhibitionId, pageId, exhibitionPage)

Updates page.

Updates page.

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getExhibitionPagesApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String pageId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | page id
final ExhibitionPage exhibitionPage = ; // ExhibitionPage | Payload

try {
    final response = api.updateExhibitionPage(exhibitionId, pageId, exhibitionPage);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ExhibitionPagesApi->updateExhibitionPage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **pageId** | **String**| page id | 
 **exhibitionPage** | [**ExhibitionPage**](ExhibitionPage.md)| Payload | 

### Return type

[**ExhibitionPage**](ExhibitionPage.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

