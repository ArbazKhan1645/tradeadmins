import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner_hub/app/constants/padding_constants.dart';
import 'package:partner_hub/app/modules/wallet/controllers/wallet_controller.dart';
import 'package:partner_hub/app/modules/wallet/pages/line_chart.dart';
import 'package:partner_hub/app/modules/wallet/pages/pie_chart.dart';

class MainBalanceWidget extends StatelessWidget {
  const MainBalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.only(left: 50, bottom: 20, top: 30),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: const Text('Main Balance',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600))),
                        Container(
                            child: const Text('\$673,412.66',
                                style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w500))),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(height: 20),
                        Container(
                            child: const Text('Valid Thru',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600))),
                        Container(
                            child: const Text('08/21',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500))),
                      ],
                    ),
                    const SizedBox(width: 50),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(height: 20),
                        Container(
                            child: const Text('Card Holder',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600))),
                        Container(
                            child: const Text('Arbaz Khan',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500))),
                      ],
                    ),
                    const SizedBox(width: 50),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(height: 20),
                        Container(
                            child: const Text('',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600))),
                        Container(
                            child: const Text('**** **** **** 1234',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500))),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 15,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green, Colors.white],
                  ),
                ),
                child: const LinearProgressIndicator(
                  value: 69 / 100,
                  backgroundColor: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.transparent),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: const Text('Earning Category',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600))),
                        padding15,
                        buildCategoryWidget('Income ', Colors.green, '30%'),
                        padding10,
                        buildCategoryWidget('Expense', Colors.red, '46%'),
                        padding10,
                        buildCategoryWidget(
                            'Expense', Colors.grey.shade400, '10%')
                      ],
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 0),
                        Center(
                            child: SizedBox(
                                width: 300,
                                height: 100,
                                child: PieChartSample2())),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          padding80,
                          const Row(
                            children: [
                              Center(
                                child: SizedBox(
                                    width: 600,
                                    height: 100,
                                    child: LineChartSample1()),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  buildCategoryWidget(String text, Color color, String amount) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 20),
        Container(
            child: Text(text,
                style: const TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.w600))),
        const SizedBox(width: 50),
        Container(
            child: Text(amount,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w600))),
      ],
    );
  }
}
