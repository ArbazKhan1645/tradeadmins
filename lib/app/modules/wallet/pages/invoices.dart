import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner_hub/app/constants/padding_constants.dart';
import 'package:partner_hub/app/modules/wallet/controllers/wallet_controller.dart';

class InvoicesPage extends StatelessWidget {
  const InvoicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletController>(builder: (controller) {
      return Padding(
        padding:
            const EdgeInsets.only(left: 20, bottom: 20, top: 30, right: 20),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                        child: Text('Invoices History',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w600))),
                    SizedBox(
                        child: Text('lorem desun id johhus ojdn ehod jbus',
                            style: TextStyle(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.w600))),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                padding20,
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.amber),
                                ),
                                padding10,
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                        child: Text('Steven Store',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700))),
                                    padding5,
                                    const SizedBox(
                                        child: Text('4 Days Ago',
                                            style:
                                                TextStyle(color: Colors.grey))),
                                  ],
                                ),
                                const Spacer(),
                                const SizedBox(
                                    child: Text('\$6783.89',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700))),
                                padding20
                              ],
                            ),
                            padding10,
                            index == 9 ? Container() : const Divider()
                          ],
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text('View More',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
