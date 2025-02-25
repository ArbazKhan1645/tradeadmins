import 'package:flutter/material.dart';
import 'package:partner_hub/app/modules/dashboard/views/dashboard_view.dart';
import 'package:partner_hub/app/modules/faqs/views/faqs_view.dart';
import 'package:partner_hub/app/modules/orders_history/views/orders_history_view.dart';
import 'package:partner_hub/app/modules/peoples/views/peoples_view.dart';
import 'package:partner_hub/app/modules/support_hub/views/support_hub_view.dart';
import 'package:partner_hub/app/modules/wallet/views/wallet_view.dart';
import 'package:partner_hub/app/routes/app_pages.dart';

class HomeServices {
  static Widget getCurrentPageScreen(String currentPagename) {
    switch (currentPagename) {
      case Routes.DASHBOARD:
        return const DashboardView();

      case Routes.PEOPLES:
        return const PeoplesView();

      case Routes.SPORT_HUB:
        return const SupportHubView();
      case Routes.ORDERS_HISTORY:
        return const OrdersHistoryView();
      case Routes.WALLET:
        return const WalletView();
      case Routes.FAQS:
        return const FaqsView();

      default:
        return Container();
    }
  }

  static List<DrawerMenuItems> getDrawerMenuItems() {
    return [
      DrawerMenuItems(
          isSelected: false,
          name: 'Home',
          subCategory: [],
          iconData: Icons.desktop_windows_outlined,
          route: Routes.SPORT_HUB),
      DrawerMenuItems(
          isSelected: false,
          name: 'peoples',
          subCategory: [],
          iconData: Icons.diamond_outlined,
          route: Routes.PEOPLES),
      DrawerMenuItems(
          isSelected: false,
          name: 'Orders',
          subCategory: [],
          iconData: Icons.man_3_sharp,
          route: Routes.ORDERS_HISTORY),
      DrawerMenuItems(
          isSelected: false,
          name: 'Faqs',
          subCategory: [],
          iconData: Icons.format_quote_outlined,
          route: Routes.FAQS),
    ];
  }
}

class DrawerMenuItems {
  String name;
  bool isSelected;
  IconData iconData;
  String? route;
  List<DrawerSubMenuItems> subCategory;
  DrawerMenuItems(
      {required this.name,
      this.iconData = Icons.window,
      this.route,
      required this.subCategory,
      required this.isSelected});
}

class DrawerSubMenuItems {
  String name;
  String route;

  DrawerSubMenuItems({required this.name, required this.route});
}
