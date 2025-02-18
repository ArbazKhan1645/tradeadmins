import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner_hub/app/modules/Home/services/current_user_service.dart';
import 'package:partner_hub/app/modules/Home/widgets/homeview_body.dart';
import 'package:partner_hub/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView(
      {Key? key,
      this.currentDrawer = 'Home',
      this.currentScreen = Routes.SPORT_HUB})
      : super(key: key);
  final String currentDrawer;
  final String currentScreen;
  @override
  Widget build(BuildContext context) {
    return HomeViewBody(
        currentDrawer: currentDrawer, currentScreen: currentScreen);
  }
}

class HomeViewBody extends StatelessWidget {
  HomeViewBody(
      {super.key,
      this.currentDrawer = 'Home',
      this.currentScreen = Routes.SPORT_HUB});
  final String currentDrawer;
  final String currentScreen;
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return userController.currentUser != null
              ? Scaffold(
                  body: HomeviewBody(
                  currentPagename: currentDrawer,
                  currentScreen: currentScreen,
                ))
              : const Scaffold(
                  body: Center(child: LinearProgressIndicator()),
                );
        });
  }
}
