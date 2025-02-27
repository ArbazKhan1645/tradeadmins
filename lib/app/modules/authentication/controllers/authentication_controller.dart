// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner_hub/app/models/models/users_model.dart/customer_models.dart';
import 'package:partner_hub/app/routes/app_pages.dart';
import 'package:partner_hub/app/services/fetch_supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationController extends GetxController {
  bool islogin = true;
  bool obscureSignupPassword = true;
  bool obscureLoginPassword = true;
  String errormessage = "";
  CustomerModel? currentPartnerUser;
  bool saveme = true;

  setSaveMe(bool value) {
    saveme = value;
    update();
  }

  setErrorMessage(String message) {
    errormessage = message;
    update();
  }

  setobsureSignupPassword() {
    obscureSignupPassword = !obscureSignupPassword;
    update();
  }

  setobsureLoginPassword() {
    obscureLoginPassword = !obscureLoginPassword;
    update();
  }

  Map<String, TextEditingController> loginControllers = {
    'LoginEmail': TextEditingController(),
    'LoginPassword': TextEditingController()
  };

  Map<String, TextEditingController> signupControllers = {
    'signupEmail': TextEditingController(),
    'signupPassword': TextEditingController(),
    'signupConfirmPassword': TextEditingController()
  };

  returnLoginTextcontrollerValue(String controllerName) {
    String val = '';
    if (loginControllers[controllerName] != null) {
      val = loginControllers[controllerName]!.text.toString();
    }
    return val;
  }

  callLoginFunction() async {
    setErrorMessage('');
    String email = returnLoginTextcontrollerValue('LoginEmail');
    String password = returnLoginTextcontrollerValue('LoginPassword');
    if (email.isEmpty || password.isEmpty) {
      setErrorMessage('Fields value can not be empty');
      Navigator.pop(Get.overlayContext!);
    } else {
      supabaseLogin(email, password);
    }
  }

  callSignUpFunction() {
    setErrorMessage('');
    String email = returnSignUpTextcontrollerValue('signupEmail');
    String password = returnSignUpTextcontrollerValue('signupPassword');
    String confirmPassword =
        returnSignUpTextcontrollerValue('signupConfirmPassword');
    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      setErrorMessage('Fields value can not be empty');
    } else {
      if (password != confirmPassword) {
        setErrorMessage('Password and Confirm Password should be same');
      } else {
        Get.toNamed(Routes.HOME);
      }
    }
  }

  returnSignUpTextcontrollerValue(String controllerName) {
    String val = '';
    if (signupControllers[controllerName] != null) {
      val = signupControllers[controllerName]!.text.toString();
    }
    return val;
  }

  switchAuthenticationPage() {
    errormessage = '';
    islogin = !islogin;
    update();
  }

  Future<void> supabaseLogin(String email, String password) async {
    try {
      final value = await supbaseClient.auth
          .signInWithPassword(email: email, password: password);

      if (value.user != null) {
        final partnerValue = await fetchadmins();
        print(partnerValue);
        currentPartnerUser = partnerValue.firstWhere(
            (element) => element.email == email,
            orElse: () => CustomerModel());
        if (currentPartnerUser!.id == null) {
          setErrorMessage('User data not found');
          Navigator.pop(Get.overlayContext!);
        } else {
          if (saveme) {
            await saveUserIdToSharedPreferences(
                currentPartnerUser!.id.toString());
          }
          Navigator.pop(Get.overlayContext!);
          Get.toNamed(Routes.HOME);
        }
      } else {
        setErrorMessage('Invalid email or password');
        Navigator.pop(Get.overlayContext!);
      }
    } catch (e) {
      print(e);
      setErrorMessage('Error : ${e.toString()}');
      Navigator.pop(Get.overlayContext!);
    }
  }

  Future<List<CustomerModel>> fetchadmins() async {
    try {
      var data = await FetchSupabaseRepository.fetch<CustomerModel>(
        'users',
        fromJson: CustomerModel.fromJson,
      );
      return data;
    } catch (e) {
      print(e);
    }
    return [];
  }

  Future<void> saveUserIdToSharedPreferences(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('currentuser', userId);
  }
}
