// ignore_for_file: invalid_use_of_protected_member, avoid_print

import 'package:get/get.dart';
import 'package:partner_hub/app/models/models/users_model.dart/customer_models.dart';

import 'package:partner_hub/app/modules/Home/controllers/home_controller.dart';
import 'package:partner_hub/app/routes/app_pages.dart';
import 'package:partner_hub/app/services/fetch_supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  var userData = {}.obs;
  CustomerModel? currentUser;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? userId = prefs.getString('currentuser');

    if (userId == null) {
      userData.value = {};
      Get.offAndToNamed(Routes.PARTNER_DETAILS_NOTFOUND);
      return;
    }

    if (userId.isNotEmpty) {
      try {
        final response = await supbaseClient
            .from('users')
            .select()
            .eq('id', userId)
            .single();
        if (response.isNotEmpty) {
          userData.value = response;
          currentUser =
              CustomerModel.fromJson(userData.value as Map<String, dynamic>);
          final HomeController homeController = Get.find<HomeController>();
          homeController.update();
        } else {
          userData.value = {};
          Get.reset();
          Get.offAndToNamed(Routes.PARTNER_DETAILS_NOTFOUND);
        }
      } catch (e) {
        // Get.reset();
        Get.offAndToNamed(Routes.PARTNER_DETAILS_NOTFOUND);
        print('error fetching user data:$e');
      }
    } else {
      userData.value = {};
    }
    update();
  }
}
