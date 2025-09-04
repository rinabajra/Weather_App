import 'dart:convert';

import 'package:flutter/services.dart';

abstract class Environment {
  static const dev = 'dev';
  static const prod = 'prod';
}

abstract class ConfigReader {
  static Map<String, dynamic>? _config;

  static Future<void> initialize(String env) async {
    final configString = await rootBundle.loadString(
      'config/${env}_config.json',
    );

    _config = json.decode(configString) as Map<String, dynamic>;
  }

  static String getFlavor() {
    return _config?['flavor'] as String;
  }

  static String getApiVersion() {
    return _config?['api_version'] as String;
  }

  static String getApiUrl() {
    return _config?['api_url'] as String;
  }

  static String getApiKey() {
    return _config?['api_key'] as String;
  }
}
