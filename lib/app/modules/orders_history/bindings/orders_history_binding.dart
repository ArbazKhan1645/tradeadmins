import 'package:get/get.dart';

import '../controllers/orders_history_controller.dart';

class OrdersHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrdersHistoryController>(
      () => OrdersHistoryController(),
    );
  }
}
