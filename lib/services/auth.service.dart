import 'dart:convert';


import 'package:dlovera_app/constants/app_strings.dart';
import 'package:dlovera_app/models/user.dart';

import 'http.service.dart';
import 'local_storage.service.dart';

class AuthServices {

  static bool authenticated() {
    return LocalStorageService.prefs?.getBool(AppStrings.authenticated) ?? false;
  }
  //
  static Future<bool>? isAuthenticated() {
    return LocalStorageService.prefs?.setBool(AppStrings.authenticated, true);
  }

  // Token
  static Future<String> getAuthBearerToken() async {
    return LocalStorageService.prefs?.getString(AppStrings.userAuthToken) ?? "";
  }

  static Future<bool?> setAuthBearerToken(token) async {
    return LocalStorageService.prefs?.setString(AppStrings.userAuthToken, token);
  }


  static User? currentUser;
  static Future<User?> getCurrentUser({bool force = false}) async {
    if (currentUser == null || force) {
      final userStringObject =
          await LocalStorageService.prefs?.getString(AppStrings.userKey);
      final userObject = json.decode(userStringObject!);
      currentUser = User.fromJson(userObject);
    }

    return currentUser;
  }


  static Future<User?> saveUser(dynamic jsonObject) async {
    final currentUser = User.fromJson(jsonObject);
    try {
      await LocalStorageService.prefs?.setString(
        AppStrings.userKey,
        json.encode(
          currentUser.toJson(),
        ),
      );

      return currentUser;
    } catch (error) {
      return null;
    }
  }


  static void logout() async {
    await LocalStorageService.prefs?.clear();
  }
}
