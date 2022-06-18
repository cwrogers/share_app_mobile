import 'dart:convert';

import 'common/config.dart';
import 'package:http/http.dart' as http;

class API {
  // API CONFIGURATION
  static const String apiProtocol = Config.apiProtocol;
  static const String apiHost = Config.apiHost;
  static const int apiPort = Config.apiPort;
  static const String apiPath = Config.apiPath;
  static const String apiVersion = Config.apiVersion;
  static const String baseUrl = Config.apiBaseUrl;

  // API endpoints
  static const String auth = "/auth";
  static const String register = "/auth/register";
  static const String posts = "$apiPath/posts";
  static const String sharePost = "$posts/share";

  // API methods
  static Future<Map<String, dynamic>?> authenticate(
      String username, String password) async {
    var uri = Uri(
      scheme: apiProtocol,
      host: apiHost,
      port: apiPort,
      path: auth,
    );

    try {
      final response = await http
          .post(uri, body: {"username": username, "password": password});
      return const JsonDecoder().convert(response.body);
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<bool> registerAccount(
      String username, String password) async {
    var uri = Uri(
      scheme: apiProtocol,
      host: apiHost,
      port: apiPort,
      path: register,
    );

    try {
      final response = await http
          .post(uri, body: {"username": username, "password": password});
      return response.statusCode == 200;
    } catch (e) {
      print(e);
    }
    return false;
  }
}
