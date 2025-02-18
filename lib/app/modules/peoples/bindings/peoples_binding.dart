import 'package:get/get.dart';

import '../controllers/peoples_controller.dart';

class PeoplesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PeoplesController>(
      () => PeoplesController(),
    );
  }
}
