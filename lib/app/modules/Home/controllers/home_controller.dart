import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner_hub/app/modules/Home/services/home_services.dart';
import 'package:partner_hub/app/modules/Home/widgets/home_drawer.dart';
import 'package:partner_hub/app/modules/Home/widgets/home_screens.dart';
import 'package:partner_hub/app/modules/Home/widgets/home_subdrawer.dart';
import 'package:partner_hub/app/routes/app_pages.dart';

import '../../support_hub/widgets/homepage_view.dart';

class HomeController extends GetxController {
  List<Widget> getDashboardViewBodyScreen = [
     Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeDrawer(),
        HomeSubDrawer(),
        Expanded(
          child: Column(
            children: [
              buildSliverAppBar(),
              HomeScreens(),
            ],
          ),
        ),
      ],
    )
  ];

  List<DrawerMenuItems> drawerMenuItems = HomeServices.getDrawerMenuItems();
  RxString selectedDrawerItem = 'Support Hub'.obs;
  String currentPagename = Routes.Merchants;
  RxString selectedDrawerSubItem = ''.obs;
  RxString hoverselectedDrawerItem = ''.obs;
  RxString hoverselectedSubDrawerItem = ''.obs;
  List<DrawerSubMenuItems> drawerSubmenuItems = [];

  setselectedDrawerItem(String item) {
    selectedDrawerItem.value = item;
    refreshController();
  }

  setselectedDrawerItems(String item) {
    selectedDrawerItem.value = item;
  }

  setSelectedSubCategory(String item) {
    selectedDrawerSubItem.value = item;
    refreshController();
  }

  setHoverselectedDrawerItem(String item) {
    hoverselectedDrawerItem.value = item;
    refreshController();
  }

  setHoverselectedDrawerSubItem(String item) {
    hoverselectedSubDrawerItem.value = item;
    refreshController();
  }

  setdrawerSubmenuItems(List<DrawerSubMenuItems> items) {
    drawerSubmenuItems = items;
    refreshController();
  }

  cleandrawerSubmenuItems() {
    drawerSubmenuItems = [];
    refreshController();
  }

  setCurrentPageName(String pageName) {
    currentPagename = pageName;
    refreshController();
  }

  setCurrentPageNames(String pageName) {
    currentPagename = pageName;
  }

  Widget getCurrentPageScreen() {
    return HomeServices.getCurrentPageScreen(currentPagename);
  }

  refreshController() {
    update();
  }
}
