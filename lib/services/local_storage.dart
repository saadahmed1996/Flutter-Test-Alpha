import 'dart:convert';

import 'package:al_busayra_project/models/user_model.dart';
import 'package:al_busayra_project/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static SharedPreference? _sharedPreferenceHelper;
  static SharedPreferences? _sharedPreferences;

  SharedPreference._createInstance();

  factory SharedPreference() {
    // factory with constructor, return some value
    _sharedPreferenceHelper ??= SharedPreference._createInstance();
    return _sharedPreferenceHelper!;
  }

  Future<SharedPreferences> get sharedPreference async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    return _sharedPreferences!;
  }

  ////////////////////// Clear Preference ///////////////////////////
  void clear() {
    _sharedPreferences!.clear();
    SharedPreference().setViewOnBoardingScreen(viewOnBoarding: true);
  }

  ////////////////////// Bearer Token ///////////////////////////

  void setBearerToken({String? token}) {
    _sharedPreferences!.setString(AppStrings.BEARER_TOKEN_KEY, token ?? "");
  }

  String? getBearerToken() {
    return _sharedPreferences!.getString(AppStrings.BEARER_TOKEN_KEY);
  }

  ////////////////////// User ///////////////////////////
  // void setUser({String? user}) {
  //   _sharedPreferences!.setString(AppStrings.CURRENT_USER_DATA_KEY, user ?? "");
  // }

  // String? getUser() {
  //   return _sharedPreferences!.getString(AppStrings.CURRENT_USER_DATA_KEY);
  // }

  void setViewOnBoardingScreen({bool? viewOnBoarding}) {
    _sharedPreferences?.setBool(
        AppStrings.VIEW_ONBOARDING_DATA_KEY, viewOnBoarding!);
  }

  bool? getViewOnBoardingScreen() {
    return _sharedPreferences?.getBool(AppStrings.VIEW_ONBOARDING_DATA_KEY);
  }

  ////////////////////// Notification Message Id ///////////////////////////
  void setNotificationMessageId({String? messageId}) {
    _sharedPreferences!
        .setString(AppStrings.NOTIFICATION_MESSAGE_ID_KEY, messageId ?? "");
  }

  String? getNotificationMessageId() {
    return _sharedPreferences!
        .getString(AppStrings.NOTIFICATION_MESSAGE_ID_KEY);
  }

  ////////////////////// Language Key ///////////////////////////

  void setLanguage({String? languageCode}) {
    _sharedPreferences!.setString(AppStrings.LANGUAGE_KEY, languageCode ?? "");
  }

  String? getLanguage() {
    return _sharedPreferences!.getString(AppStrings.LANGUAGE_KEY);
  }

  //Cart
  void setCart({String? cart}) {
    _sharedPreferences!.setString(AppStrings.CART, cart ?? "");
  }

  String? getCart() {
    return _sharedPreferences!.getString(AppStrings.CART);
  }

  Future<void> setUser(UserModel? user) async {
    final prefs = await sharedPreference;
    // Convert UserModel to JSON string
    String userJson = jsonEncode(user?.toJson());
    await prefs.setString(AppStrings.CURRENT_USER_DATA_KEY, userJson);
  }

  Future<UserModel?> getUser() async {
    final prefs = await sharedPreference;
    String? userJson = prefs.getString(AppStrings.CURRENT_USER_DATA_KEY);
    if (userJson != null) {
      return UserModel.fromJson(jsonDecode(userJson));
    }
    return null;
  }
}
