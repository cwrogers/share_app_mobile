class Config {
  static const bool IS_DEBUG = true;

  static const String appName = "Share App Demo";

  //  API CONFIGURATION
  static const String apiProtocol = "http";
  static const String apiHost = "localhost";
  static const int apiPort = 8080;
  static const String apiPath = "/api";
  static const String apiVersion = "v1";
  static const String apiBaseUrl = "$apiHost:$apiPort$apiPath/$apiVersion";
}
