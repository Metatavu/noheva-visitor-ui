# noheva_api.api.VisitorsApi

## Load the API package
```dart
import 'package:noheva_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createVisitor**](VisitorsApi.md#createvisitor) | **POST** /v1/exhibitions/{exhibitionId}/visitor | Create a visitor
[**deleteVisitor**](VisitorsApi.md#deletevisitor) | **DELETE** /v1/exhibitions/{exhibitionId}/visitors/{visitorId} | Deletes a visitor.
[**findVisitor**](VisitorsApi.md#findvisitor) | **GET** /v1/exhibitions/{exhibitionId}/visitors/{visitorId} | Find a visitor
[**findVisitorTag**](VisitorsApi.md#findvisitortag) | **GET** /v1/exhibitions/{exhibitionId}/visitorTags/{tagId} | Find a visitor tag
[**listVisitors**](VisitorsApi.md#listvisitors) | **GET** /v1/exhibitions/{exhibitionId}/visitor | List visitors
[**updateVisitor**](VisitorsApi.md#updatevisitor) | **PUT** /v1/exhibitions/{exhibitionId}/visitors/{visitorId} | Updates a visitor.


# **createVisitor**
> Visitor createVisitor(exhibitionId, visitor)

Create a visitor

Creates a new exhibition visitor

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getVisitorsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final Visitor visitor = ; // Visitor | Payload

try {
    final response = api.createVisitor(exhibitionId, visitor);
    print(response);
} catch on DioError (e) {
    print('Exception when calling VisitorsApi->createVisitor: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **visitor** | [**Visitor**](Visitor.md)| Payload | 

### Return type

[**Visitor**](Visitor.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteVisitor**
> deleteVisitor(exhibitionId, visitorId)

Deletes a visitor.

Deletes an exhibition visitor.

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getVisitorsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String visitorId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | visitor id

try {
    api.deleteVisitor(exhibitionId, visitorId);
} catch on DioError (e) {
    print('Exception when calling VisitorsApi->deleteVisitor: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **visitorId** | **String**| visitor id | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findVisitor**
> Visitor findVisitor(exhibitionId, visitorId)

Find a visitor

Finds a visitor by id

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getVisitorsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String visitorId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | visitor id

try {
    final response = api.findVisitor(exhibitionId, visitorId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling VisitorsApi->findVisitor: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **visitorId** | **String**| visitor id | 

### Return type

[**Visitor**](Visitor.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findVisitorTag**
> VisitorTag findVisitorTag(exhibitionId, tagId)

Find a visitor tag

Finds a visitor tag by tagId

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getVisitorsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String tagId = tagId_example; // String | visitor tag id

try {
    final response = api.findVisitorTag(exhibitionId, tagId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling VisitorsApi->findVisitorTag: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **tagId** | **String**| visitor tag id | 

### Return type

[**VisitorTag**](VisitorTag.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listVisitors**
> BuiltList<Visitor> listVisitors(exhibitionId, tagId, email)

List visitors

List exhibition visitors

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getVisitorsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String tagId = tagId_example; // String | query by RFID tag
final String email = email_example; // String | query by email

try {
    final response = api.listVisitors(exhibitionId, tagId, email);
    print(response);
} catch on DioError (e) {
    print('Exception when calling VisitorsApi->listVisitors: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **tagId** | **String**| query by RFID tag | [optional] 
 **email** | **String**| query by email | [optional] 

### Return type

[**BuiltList&lt;Visitor&gt;**](Visitor.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateVisitor**
> Visitor updateVisitor(exhibitionId, visitorId, visitor)

Updates a visitor.

Updates a visitor.

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getVisitorsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String visitorId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | visitor id
final Visitor visitor = ; // Visitor | Payload

try {
    final response = api.updateVisitor(exhibitionId, visitorId, visitor);
    print(response);
} catch on DioError (e) {
    print('Exception when calling VisitorsApi->updateVisitor: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **visitorId** | **String**| visitor id | 
 **visitor** | [**Visitor**](Visitor.md)| Payload | 

### Return type

[**Visitor**](Visitor.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

