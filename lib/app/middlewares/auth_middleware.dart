// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner_hub/app/routes/app_pages.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthGuardMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    SharedPreferences.getInstance().then((prefs) {
      var currentuser = prefs.getString('currentuser');
      bool checked = currentuser != null && currentuser.isNotEmpty;
      if (!checked) {
        Get.offNamed(Routes.AUTHENTICATION);
      }
    });
    return null;
  }
}
