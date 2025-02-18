import 'package:get/get.dart';

import '../controllers/support_hub_controller.dart';

class SupportHubBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SupportHubController>(
      () => SupportHubController(),
    );
  }
}
