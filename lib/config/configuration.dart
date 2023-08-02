// ignore_for_file: constant_identifier_names

import "package:flutter_dotenv/flutter_dotenv.dart";

/// Application configuration
///
/// Validates that all environment variables are in place and provides API for accessing them
class Configuration {
  static const String API_BASE_PATH = "API_BASE_PATH";
  static const String ENVIRONMENT = "ENVIRONMENT";

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
}
