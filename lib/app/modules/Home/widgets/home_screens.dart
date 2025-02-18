import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner_hub/app/modules/Home/controllers/home_controller.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      Widget getScreen = controller.getCurrentPageScreen();
      return Expanded(child: getScreen);
    });
  }
}
