import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner_hub/app/modules/orders_history/controllers/orders_history_controller.dart';

class DatatableHeader extends StatelessWidget {
  const DatatableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersHistoryController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: const Color(0xff00b075),
            height: 70,
            child: Center(
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  Container(
                    height: 50,
                    color: Colors.white12,
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: const TextField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          hintText: 'Search for Order ID & Customer Name',
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  const Spacer(),
                  Container(
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade400)),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.filter_alt_off_outlined,
                                color: Color(0xff00b075)),
                            SizedBox(width: 10),
                            Text(
                              'All Order Status',
                              style: TextStyle(color: Color(0xff00b075)),
                            ),
                          ],
                        ),
                      )),
                  const SizedBox(width: 20),
                  Container(
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade400)),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.exit_to_app_outlined,
                                color: Color(0xff00b075)),
                            SizedBox(width: 10),
                            Text(
                              'Export Report',
                              style: TextStyle(color: Color(0xff00b075)),
                            ),
                          ],
                        ),
                      )),
                  const SizedBox(width: 20),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
