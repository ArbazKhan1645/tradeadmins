import 'package:get/get.dart';

import '../controllers/partner_details_notfound_controller.dart';

class PartnerDetailsNotfoundBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PartnerDetailsNotfoundController>(
      () => PartnerDetailsNotfoundController(),
    );
  }
}
