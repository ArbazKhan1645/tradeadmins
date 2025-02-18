// ignore_for_file: avoid_print, unused_local_variable, avoid_web_libraries_in_flutter

import 'package:go_router/go_router.dart';
import 'package:partner_hub/app/modules/Home/views/home_view.dart';
import 'package:partner_hub/app/routes/app_pages.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const HomeView();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) {
        return const HomeView();
      },
    ),
    GoRoute(
      path: '/home${Routes.Merchants}',
      builder: (context, state) {
        return HomeView(
          currentDrawer: removeLeadingSlash(Routes.Merchants),
          currentScreen: Routes.Merchants,
        );
      },
    ),
    GoRoute(
      path: '/home${Routes.PEOPLES}',
      builder: (context, state) {
        return HomeView(
          currentDrawer: removeLeadingSlash(Routes.PEOPLES),
          currentScreen: Routes.PEOPLES,
        );
      },
    ),
    GoRoute(
      path: '/home/store${Routes.SOFTWARE_PACKAGES}',
      builder: (context, state) {
        return const HomeView(
            currentScreen: Routes.SOFTWARE_PACKAGES, currentDrawer: 'store');
      },
    ),
    GoRoute(
      path: '/home/store${Routes.APP_STORE}',
      builder: (context, state) {
        return const HomeView(
            currentScreen: Routes.APP_STORE, currentDrawer: 'store');
      },
    ),
    GoRoute(
      path: '/home/store${Routes.HARDWARE_STORE}',
      builder: (context, state) {
        return const HomeView(
            currentScreen: Routes.HARDWARE_STORE, currentDrawer: 'store');
      },
    ),
  ],
);

String removeLeadingSlash(String text) {
  if (text.isEmpty) {
    return text;
  }
  return text.substring(1);
}
