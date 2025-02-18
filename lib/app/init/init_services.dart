// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:partner_hub/app/services/app/app_service.dart';
import '../services/tax_service/tax_service.dart';

/// Initialize all services
Future<void> initDependencies() async {
  // Initialize app services
  await _initAppService();
}

/// Initialize app services
Future<void> _initAppService() async {
  await Get.putAsync(() => AppService().init());

  await Get.putAsync(() => TaxService().init());
}
