import 'package:get/get.dart';

import '../controllers/support_hub_controller.dart';

class SportHubBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SupportHubController>(
      () => SupportHubController(),
    );
  }
}
