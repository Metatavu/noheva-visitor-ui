import 'package:test/test.dart';
import 'package:noheva_api/noheva_api.dart';

// tests for DevicePage
void main() {
  final instance = DevicePageBuilder();
  // TODO add properties to the builder and call build()

  group(DevicePage, () {
    // Page id.
    // String id
    test('to test the property `id`', () async {
      // TODO
    });

    // Id of exhibition this page belongs to
    // String exhibitionId
    test('to test the property `exhibitionId`', () async {
      // TODO
    });

    // Id of page layout
    // String layoutId
    test('to test the property `layoutId`', () async {
      // TODO
    });

    // Human readable name for the page
    // String name
    test('to test the property `name`', () async {
      // TODO
    });

    // BuiltList<DevicePageResource> resources
    test('to test the property `resources`', () async {
      // TODO
    });

    // BuiltList<ExhibitionPageEventTrigger> eventTriggers
    test('to test the property `eventTriggers`', () async {
      // TODO
    });

    // BuiltList<ExhibitionPageTransition> enterTransitions
    test('to test the property `enterTransitions`', () async {
      // TODO
    });

    // BuiltList<ExhibitionPageTransition> exitTransitions
    test('to test the property `exitTransitions`', () async {
      // TODO
    });

    // int orderNumber
    test('to test the property `orderNumber`', () async {
      // TODO
    });

    // Language of the given page. Language is detected from content version this page belongs to.
    // String language
    test('to test the property `language`', () async {
      // TODO
    });

    // Active condition user variable. This property is present only when page belongs to conditionally active content version.
    // String activeConditionUserVariable
    test('to test the property `activeConditionUserVariable`', () async {
      // TODO
    });

    // Active condition equals value. This property is present only when page belongs to conditionally active content version.
    // String activeConditionEquals
    test('to test the property `activeConditionEquals`', () async {
      // TODO
    });

    // Date modified
    // DateTime modifiedAt
    test('to test the property `modifiedAt`', () async {
      // TODO
    });

  });
}
