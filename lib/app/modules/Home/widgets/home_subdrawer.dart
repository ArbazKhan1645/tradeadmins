import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner_hub/app/constants/padding_constants.dart';
import 'package:partner_hub/app/modules/Home/controllers/home_controller.dart';
import 'package:partner_hub/app/modules/Home/services/home_services.dart';

class HomeSubDrawer extends StatelessWidget {
  const HomeSubDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      List<DrawerSubMenuItems> subdrawerItems = controller.drawerSubmenuItems;
      double subdrawerWidth = subdrawerItems.isEmpty ? 0 : 200;
      String selectedCategory =
          subdrawerItems.isEmpty ? '' : controller.selectedDrawerItem.value;
      return AnimatedContainer(
        width: subdrawerWidth,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        duration: const Duration(milliseconds: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                      selectedCategory,
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: subdrawerItems.length,
                itemBuilder: (context, index) {
                  DrawerSubMenuItems drawerMenuSubItem = subdrawerItems[index];
                  return HomeSubDrawerItemWidget(
                    drawerwidth: subdrawerWidth,
                    drawerMenuSubItem: drawerMenuSubItem,
                  );
                }),
          ],
        ),
      );
    });
  }
}

class HomeSubDrawerItemWidget extends StatelessWidget {
  const HomeSubDrawerItemWidget(
      {super.key, required this.drawerMenuSubItem, required this.drawerwidth});

  final DrawerSubMenuItems drawerMenuSubItem;
  final double drawerwidth;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      bool isSelected =
          controller.hoverselectedSubDrawerItem.value == drawerMenuSubItem.name;
      Color primaryColor = isSelected ? const Color(0xff19AA8D) : Colors.grey;
      return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: InkWell(
            onTap: () {
              controller.setSelectedSubCategory(drawerMenuSubItem.name);
              controller.setCurrentPageName(drawerMenuSubItem.route);
              controller.cleandrawerSubmenuItems();
            },
            onHover: (hovering) {
              hovering
                  ? controller
                      .setHoverselectedDrawerSubItem(drawerMenuSubItem.name)
                  : controller.setHoverselectedDrawerSubItem('');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                padding10,
                Icon(Icons.store_mall_directory_outlined, color: primaryColor),
                padding10,
                SizedBox(
                    width: drawerwidth * 0.50,
                    child: Text(
                      drawerMenuSubItem.name,
                      style: TextStyle(
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.w400,
                          color: primaryColor),
                    )),
                padding30,
                Icon(
                  Icons.arrow_forward_ios,
                  color: primaryColor,
                  size: 15,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
