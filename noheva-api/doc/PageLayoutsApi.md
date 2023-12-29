# noheva_api.api.PageLayoutsApi

## Load the API package
```dart
import 'package:noheva_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createPageLayout**](PageLayoutsApi.md#createpagelayout) | **POST** /v1/pageLayouts | Create a page layout
[**deletePageLayout**](PageLayoutsApi.md#deletepagelayout) | **DELETE** /v1/pageLayouts/{pageLayoutId} | Deletes page layout.
[**findPageLayout**](PageLayoutsApi.md#findpagelayout) | **GET** /v1/pageLayouts/{pageLayoutId} | Find a page layout
[**listPageLayouts**](PageLayoutsApi.md#listpagelayouts) | **GET** /v1/pageLayouts | List page layouts
[**updatePageLayout**](PageLayoutsApi.md#updatepagelayout) | **PUT** /v1/pageLayouts/{pageLayoutId} | Updates page layout.


# **createPageLayout**
> PageLayout createPageLayout(pageLayout)

Create a page layout

Creates new page layout

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getPageLayoutsApi();
final PageLayout pageLayout = ; // PageLayout | Payload

try {
    final response = api.createPageLayout(pageLayout);
    print(response);
} catch on DioError (e) {
    print('Exception when calling PageLayoutsApi->createPageLayout: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pageLayout** | [**PageLayout**](PageLayout.md)| Payload | 

### Return type

[**PageLayout**](PageLayout.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deletePageLayout**
> deletePageLayout(pageLayoutId)

Deletes page layout.

Delets page layout.

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getPageLayoutsApi();
final String pageLayoutId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | page layout id

try {
    api.deletePageLayout(pageLayoutId);
} catch on DioError (e) {
    print('Exception when calling PageLayoutsApi->deletePageLayout: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pageLayoutId** | **String**| page layout id | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findPageLayout**
> PageLayout findPageLayout(pageLayoutId)

Find a page layout

Finds a page layout by id

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getPageLayoutsApi();
final String pageLayoutId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | page layout id

try {
    final response = api.findPageLayout(pageLayoutId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling PageLayoutsApi->findPageLayout: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pageLayoutId** | **String**| page layout id | 

### Return type

[**PageLayout**](PageLayout.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listPageLayouts**
> BuiltList<PageLayout> listPageLayouts(deviceModelId, screenOrientation)

List page layouts

List page layouts

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getPageLayoutsApi();
final String deviceModelId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | device model id
final String screenOrientation = screenOrientation_example; // String | screen orientation

try {
    final response = api.listPageLayouts(deviceModelId, screenOrientation);
    print(response);
} catch on DioError (e) {
    print('Exception when calling PageLayoutsApi->listPageLayouts: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceModelId** | **String**| device model id | [optional] 
 **screenOrientation** | **String**| screen orientation | [optional] 

### Return type

[**BuiltList&lt;PageLayout&gt;**](PageLayout.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updatePageLayout**
> PageLayout updatePageLayout(pageLayoutId, pageLayout)

Updates page layout.

Updates page layout.

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getPageLayoutsApi();
final String pageLayoutId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | page layout id
final PageLayout pageLayout = ; // PageLayout | Payload

try {
    final response = api.updatePageLayout(pageLayoutId, pageLayout);
    print(response);
} catch on DioError (e) {
    print('Exception when calling PageLayoutsApi->updatePageLayout: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pageLayoutId** | **String**| page layout id | 
 **pageLayout** | [**PageLayout**](PageLayout.md)| Payload | 

### Return type

[**PageLayout**](PageLayout.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

