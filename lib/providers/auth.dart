//import http

import 'package:flutter/material.dart';
import 'package:share_app_mobile/api.dart';

class AuthProvider with ChangeNotifier {
  String _authToken = "";
  String _refreshToken = "";
  int _tokenExpiration = 0;

  bool get isAuthenticated => _authToken != "" && !isAuthTokenExpired();

  Auth(
      {required String authToken,
      required String refreshToken,
      required int tokenExpiration}) {
    _authToken = authToken;
    _refreshToken = refreshToken;
    _tokenExpiration = tokenExpiration;
  }

  Future<bool> authenticate(String username, String password) async {
    var response = await API.authenticate(username, password);
    if (response == null || response["code"] != 200) return false;

    _authToken = response["data"]["token"];
    _refreshToken = response["data"]["refresh_token"];
    _tokenExpiration = response["data"]["token_exp"];
    notifyListeners();
    return true;
  }


  Future<bool> registerAccount(String username, String password) async {
    var didRegister = await API.registerAccount(username, password);
    if (didRegister) {
      await authenticate(username, password);
    }
    notifyListeners();
    return true;
  }

  bool isAuthTokenExpired() {
    var n = int.parse(
        DateTime.now().millisecondsSinceEpoch.toString().substring(0, 10));
    return n > _tokenExpiration;
  }

  refreshToken() {
    //api call to refresh token
    //if successful, set token
  }

  logout() {
    _authToken = "";
    _refreshToken = "";
    _tokenExpiration = 0;
    notifyListeners();
  }
}
