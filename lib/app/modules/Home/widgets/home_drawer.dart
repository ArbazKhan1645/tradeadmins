// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner_hub/app/constants/padding_constants.dart';
import 'package:partner_hub/app/modules/Home/controllers/home_controller.dart';
import 'package:partner_hub/app/modules/Home/services/current_user_service.dart';
import 'package:partner_hub/app/modules/Home/services/home_services.dart';
import 'package:partner_hub/app/modules/support_hub/widgets/homepage_header.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer({super.key});
  final double drawerwidthSize = 100;
  final Color drawerBackgroundColor = Colors.white;

  var con = Get.isRegistered<UserController>()
      ? Get.find<UserController>()
      : Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      List<DrawerMenuItems> drawerMenuItems = controller.drawerMenuItems;
      return Container(
        color: Color(0xffF5F3FB),
        child: SizedBox(
          child: Column(
            children: [
              Container(
                height: 90,
                color: Color(0xffF5F3FB),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff5D4BE3),
                          Color(0xFF5B6CF5),
                          Color(0xFF4379F4)
                        ],
                      ),
                    ),
                    height: 60,
                    width: 60,
                    child: Center(
                      child: Text(
                          '${con.currentUser!.firstName.toString()[0]}${con.currentUser!.lastName.toString()[0]}',
                          style: defaultTextStyle.copyWith(
                              color: Colors.white, fontSize: 22)),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: 120,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff5D4BE3),
                        Color(0xFF5B6CF5),
                        Color(0xFF4379F4)
                      ],
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return Container(height: 5);
                        },
                        shrinkWrap: true,
                        itemCount: drawerMenuItems.length,
                        itemBuilder: (context, index) {
                          DrawerMenuItems drawerItem = drawerMenuItems[index];
                          return DrawerMenuItem(drawerMenuItem: drawerItem);
                        }),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

class DrawerMenuItem extends StatelessWidget {
  const DrawerMenuItem({super.key, required this.drawerMenuItem});
  final DrawerMenuItems drawerMenuItem;
  final double drawerIconSize = 30;
  final double drawerItemHeightSize = 95;
  final Color drawerIconColor = const Color(0xffa7b1c2);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      bool isSelected =
          controller.selectedDrawerItem.value == drawerMenuItem.name;
      bool isHoverSelected =
          controller.hoverselectedDrawerItem.value == drawerMenuItem.name;
      Color itemBackgroundColor = isSelected || isHoverSelected
          ? Color(0xffF5F3FB).withOpacity(0.3)
          : Colors.transparent;
      Color drawerIconColor =
          isSelected || isHoverSelected ? Colors.white : Colors.white54;
      Color dividercolor = isSelected || isHoverSelected
          ? Colors.transparent
          : const Color(0xffa7b1c2);
      FontWeight nameFontweigth =
          isSelected || isHoverSelected ? FontWeight.w400 : FontWeight.w400;
      return InkWell(
        onHover: (hovering) {
          if (hovering) {
            controller.setHoverselectedDrawerItem(drawerMenuItem.name);
          } else {
            controller.setHoverselectedDrawerItem('');
          }
        },
        onTap: () {
          if (drawerMenuItem.subCategory.isNotEmpty) {
            controller.setdrawerSubmenuItems(drawerMenuItem.subCategory);
          } else {
            controller.cleandrawerSubmenuItems();
            if (drawerMenuItem.route != null) {
              controller.setCurrentPageName(drawerMenuItem.route.toString());
            }
          }
          controller.setselectedDrawerItem(drawerMenuItem.name);
        },
        child: Container(
          height: drawerItemHeightSize,
          decoration: BoxDecoration(
              color: itemBackgroundColor,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              padding10,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(drawerMenuItem.iconData,
                          size: drawerIconSize, color: drawerIconColor),
                      Text(capitalizeFirstLetter(drawerMenuItem.name),
                          style: TextStyle(
                              color: drawerIconColor,
                              fontWeight: nameFontweigth)),
                    ],
                  ),
                ),
              ),
              padding10,
            ],
          ),
        ),
      );
    });
  }
}

String capitalizeFirstLetter(String text) {
  if (text.isEmpty) {
    return text;
  }
  return text[0].toUpperCase() + text.substring(1);
}
