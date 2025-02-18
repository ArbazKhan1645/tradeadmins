import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner_hub/app/modules/wallet/pages/invoices.dart';
import 'package:partner_hub/app/modules/wallet/pages/main_balance_widget.dart';
import 'package:partner_hub/app/modules/wallet/pages/payment_history_widget.dart';
import '../controllers/wallet_controller.dart';

class WalletView extends GetView<WalletController> {
  const WalletView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletController>(
        init: WalletController(),
        builder: (controller) {
          return Scaffold(
              backgroundColor: Colors.grey.shade200,
              body: const WalletViewBody());
        });
  }
}

class WalletViewBody extends StatelessWidget {
  const WalletViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletController>(builder: (controller) {
      return const Row(
        children: [
          Expanded(
              flex: 7,
              child: Column(
                children: [
                  Expanded(flex: 5, child: MainBalanceWidget()),
                  Expanded(flex: 6, child: PaymentHistoryWidget())
                ],
              )),
          Expanded(
              flex: 3,
              child: Column(
                children: [
                  // Expanded(child: Container()),
                  Expanded(child: InvoicesPage())
                ],
              ))
        ],
      );
    });
  }
}
