import 'package:get/get.dart';

import '../controllers/stastics_bar_controller.dart';

class StasticsBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StasticsBarController>(
      () => StasticsBarController(),
    );
  }
}
