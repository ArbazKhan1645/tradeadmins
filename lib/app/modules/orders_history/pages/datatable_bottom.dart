import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner_hub/app/modules/orders_history/controllers/orders_history_controller.dart';

class DataTableBottom extends StatelessWidget {
  const DataTableBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersHistoryController>(builder: (controller) {
      return Container(
        color: const Color.fromARGB(255, 65, 126, 192),
        height: 70,
        child: Center(
          child: Row(
            children: [
              const SizedBox(width: 20),
              Text(
                '${controller.startingIndex + 1}-${controller.endindex} of ${controller.products.length} Orders',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  controller.decreaseLength();
                },
                child: Container(
                    height: 35,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white12,
                        border: Border.all(color: Colors.grey.shade400)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_back_ios, color: Colors.white),
                      ],
                    )),
              ),
              const SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  controller.increaselength();
                },
                child: Container(
                    height: 35,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white12,
                        border: Border.all(color: Colors.grey.shade400)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_forward_ios, color: Colors.white),
                      ],
                    )),
              ),
              const SizedBox(width: 20),
            ],
          ),
        ),
      );
    });
  }
}
