import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:partner_hub/app/modules/orders_history/pages/datatable_bottom.dart';
import 'package:partner_hub/app/modules/orders_history/pages/datatable_header.dart';
import 'package:partner_hub/app/modules/orders_history/pages/datatable_widget.dart';
import 'package:partner_hub/app/modules/profile_screen/views/profile_screen_view.dart';

import '../controllers/orders_history_controller.dart';

class OrdersHistoryView extends GetView<OrdersHistoryController> {
  const OrdersHistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersHistoryController>(
        init: OrdersHistoryController(),
        builder: (controller) {
          return ProfileScreenView();
        });
  }
}

class OrdersHistoryViewBody extends StatelessWidget {
  const OrdersHistoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersHistoryController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.all(40.0),
        child: !controller.isloaded
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const StasticsBarView(),
                  DatatableHeader(),
                  Expanded(child: DataTableExample()),
                  DataTableBottom()
                ],
              ),
      );
    });
  }
}
