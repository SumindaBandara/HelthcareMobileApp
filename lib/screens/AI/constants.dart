import 'package:flutter/services.dart';
import 'dart:convert';

class ApiConstants {
  static const String deepSeekBaseUrl = 'https://api.deepseek.com/v1';
  static String deepSeekApiKey = '';

  // For free tier - limits to 100 requests/month
  static const int maxFreeRequests = 100;
  static int requestCount = 0;

  static Future<void> loadConfig() async {
    try {
      final config = await rootBundle.loadString('assets/config.json');
      final json = jsonDecode(config);
      deepSeekApiKey = json['deepSeekApiKey'];
    } catch (e) {
      print('Using mock mode - no API key loaded');
    }
  }

  static bool get isApiAvailable =>
      deepSeekApiKey.isNotEmpty && requestCount < maxFreeRequests;
}
