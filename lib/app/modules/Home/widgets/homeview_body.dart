import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner_hub/app/modules/Home/controllers/home_controller.dart';
import 'package:partner_hub/app/modules/Home/widgets/home_drawer.dart';
import 'package:partner_hub/app/modules/Home/widgets/home_screens.dart';
import 'package:partner_hub/app/modules/Home/widgets/home_subdrawer.dart';

class HomeviewBody extends StatefulWidget {
  const HomeviewBody(
      {super.key, required this.currentPagename, required this.currentScreen});
  final String currentPagename;
  final String currentScreen;

  @override
  State<HomeviewBody> createState() => _HomeviewBodyState();
}

class _HomeviewBodyState extends State<HomeviewBody> {
  bool isloaded = false;
  loadedparameters() async {
    await Get.find<HomeController>()
        .setselectedDrawerItems(widget.currentPagename);
    await Get.find<HomeController>().setCurrentPageNames(widget.currentScreen);
    setState(() {
      isloaded = true;
    });
  }

  @override
  void initState() {
    loadedparameters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isloaded == false
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : GetBuilder<HomeController>(builder: (controller) {
            return Row(
              children: [
                HomeDrawer(),
                HomeSubDrawer(),
                HomeScreens(),
              ],
            );
          });
  }
}
