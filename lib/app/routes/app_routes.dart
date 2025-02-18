// ignore_for_file: constant_identifier_names
part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const DASHBOARD = _Paths.DASHBOARD;
  static const SOFTWARE_PACKAGES = _Paths.SOFTWARE_PACKAGES;
  static const HARDWARE_STORE = _Paths.HARDWARE_STORE;
  static const APP_STORE = _Paths.APP_STORE;
  static const STASTICS_BAR = _Paths.STASTICS_BAR;
  static const PEOPLES = _Paths.PEOPLES;
  static const Merchants = _Paths.Merchants;
  static const AUTHENTICATION = _Paths.AUTHENTICATION;
  static const SPORT_HUB = _Paths.SPORT_HUB;
  static const SHOP_PAGE = _Paths.SHOP_PAGE;

  static const PARTNER_DETAILS_NOTFOUND = _Paths.PARTNER_DETAILS_NOTFOUND;
  static const ORDERS_HISTORY = _Paths.ORDERS_HISTORY;
  static const WALLET = _Paths.WALLET;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const DASHBOARD = '/dashboard';
  static const SOFTWARE_PACKAGES = '/software-packages';
  static const HARDWARE_STORE = '/hardware-store';
  static const APP_STORE = '/app-store';
  static const STASTICS_BAR = '/stastics-bar';
  static const PEOPLES = '/peoples';
  static const Merchants = '/merchants';
  static const AUTHENTICATION = '/authentication';
  static const SPORT_HUB = '/sport-hub';
  static const SHOP_PAGE = '/shop-page';

  static const PARTNER_DETAILS_NOTFOUND = '/partner-details-notfound';
  static const ORDERS_HISTORY = '/orders-history';
  static const WALLET = '/wallet';
}
