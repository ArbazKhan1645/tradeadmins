import 'package:get/get.dart';
import 'package:partner_hub/app/modules/profile_screen/bindings/profile_screen_binding.dart';
import 'package:partner_hub/app/modules/profile_screen/views/profile_screen_view.dart';

import '../middlewares/auth_middleware.dart';
import '../modules/Home/bindings/home_binding.dart';
import '../modules/Home/views/home_view.dart';
import '../modules/authentication/bindings/authentication_binding.dart';
import '../modules/authentication/views/authentication_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';

import '../modules/orders_history/bindings/orders_history_binding.dart';
import '../modules/orders_history/views/orders_history_view.dart';
import '../modules/partner_details_notfound/bindings/partner_details_notfound_binding.dart';
import '../modules/partner_details_notfound/views/partner_details_notfound_view.dart';
import '../modules/peoples/bindings/peoples_binding.dart';
import '../modules/peoples/views/peoples_view.dart';

import '../modules/support_hub/bindings/support_hub_binding.dart';
import '../modules/support_hub/views/support_hub_view.dart';
import '../modules/wallet/bindings/wallet_binding.dart';
import '../modules/wallet/views/wallet_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => const HomeView(),
        binding: HomeBinding(),
        middlewares: [AuthGuardMiddleware()]),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
      GetPage(
      name: _Paths.PROFILE_SCREEN,
      page: () => const ProfileScreenView(),
      binding: ProfileScreenBinding(),
    ),

    GetPage(
      name: _Paths.PEOPLES,
      page: () => const PeoplesView(),
      binding: PeoplesBinding(),
    ),

    GetPage(
      name: _Paths.AUTHENTICATION,
      page: () => const AuthenticationView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: _Paths.SPORT_HUB,
      page: () => const SupportHubView(),
      binding: SupportHubBinding(),
    ),

    GetPage(
      name: _Paths.PARTNER_DETAILS_NOTFOUND,
      page: () => const PartnerDetailsNotfoundView(),
      binding: PartnerDetailsNotfoundBinding(),
    ),
    GetPage(
      name: _Paths.ORDERS_HISTORY,
      page: () => const OrdersHistoryView(),
      binding: OrdersHistoryBinding(),
    ),
    GetPage(
      name: _Paths.WALLET,
      page: () => const WalletView(),
      binding: WalletBinding(),
    ),
  ];
}
