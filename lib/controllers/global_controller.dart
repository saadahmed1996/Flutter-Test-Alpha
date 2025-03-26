// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:al_busayra_project/models/user_model.dart';
import 'package:al_busayra_project/routes/app_routes_name.dart';
import 'package:al_busayra_project/services/local_storage.dart';
import 'package:al_busayra_project/utils/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  static GlobalController get i => Get.find();

  Rxn<UserModel> currentUser = Rxn(null);

  Future<void> initShared() async {
    await SharedPreference().sharedPreference;
  }

  void updateGetx({required UserModel? current}) {
    currentUser.value = current;
    update();
  }

  Future<void> loadCurrentUserFromSharedPreference(
      {required BuildContext context}) async {
    try {
      final userJson = await SharedPreference().getUser();
      if (userJson != null) {
        currentUser.value = userJson;
        if (currentUser.value?.isProfileComplete == 1) {
          if (currentUser.value?.isProfileComplete == 1) {
            AppNavigation.navigateToRemovingAll(
              context,
              AppRouteName.DASHBOARD_HOME_SCREEN_ROUTE,
            );
          }
        } else {
          AppNavigation.navigateToRemovingAll(
            context,
            AppRouteName.LOGIN_SCREEN_ROUTE,
          );
        }
      } else {
        AppNavigation.navigateToRemovingAll(
          context,
          AppRouteName.LOGIN_SCREEN_ROUTE,
        );
      }
    } catch (e) {
      AppNavigation.navigateToRemovingAll(
        context,
        AppRouteName.LOGIN_SCREEN_ROUTE,
      );
    }
  }
}
