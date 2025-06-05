// ignore_for_file: constant_identifier_names

import "package:flutter_dotenv/flutter_dotenv.dart";

/// Application configuration
///
/// Validates that all environment variables are in place and provides API for accessing them
class Configuration {
  static const String API_BASE_PATH = "API_BASE_PATH";
  static const String ENVIRONMENT = "ENVIRONMENT";
  static const String MQTT_USERNAME = "MQTT_USERNAME";
  static const String MQTT_PASSWORD = "MQTT_PASSWORD";
  static const String MQTT_URLS = "MQTT_URLS";
  static const String MQTT_BASE_TOPIC = "MQTT_BASE_TOPIC";
  static const String APP_UPDATES_BASE_URL = "APP_UPDATES_BASE_URL";
  static const String CDN_BASE_URL = "CDN_BASE_URL";

  static final Configuration _instance = Configuration._();
  factory Configuration() => _instance;

  /// Private constructor
  ///
  /// Validates that all environment variables are in place.
  /// Append new variables to [keys] list.
  Configuration._() {
    Map<String, String> env = dotenv.env;
    List<String> missingKeys = [];
    List<String> keys = [
      API_BASE_PATH,
      ENVIRONMENT,
      MQTT_USERNAME,
      MQTT_PASSWORD,
      MQTT_URLS,
      APP_UPDATES_BASE_URL,
      CDN_BASE_URL,
    ];

    for (final key in keys) {
      if (!env.containsKey(key)) {
        missingKeys.add(key);
      }
    }

    if (missingKeys.isNotEmpty) {
      throw Exception(
          "Missing environment variables: ${missingKeys.join(", ")}");
    }
  }

  /// Returns value of [key] from environment variables
  String get(String key) => dotenv.env[key]!;

  String getApiBasePath() => get(API_BASE_PATH);
  String getEnvironment() => get(ENVIRONMENT);
  String getMqttUsername() => get(MQTT_USERNAME);
  String getMqttPassword() => get(MQTT_PASSWORD);
  List<String> getMqttUrls() => get(MQTT_URLS).split(",");
  String getMqttBaseTopic() => get(MQTT_BASE_TOPIC);
  String getAppUpdatesBaseUrl() => get(APP_UPDATES_BASE_URL);
  String getCdnBaseUrl() => get(CDN_BASE_URL);
}
