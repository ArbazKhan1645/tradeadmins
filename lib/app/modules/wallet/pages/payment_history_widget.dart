import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner_hub/app/constants/padding_constants.dart';
import 'package:partner_hub/app/modules/wallet/controllers/wallet_controller.dart';

class PaymentHistoryWidget extends StatefulWidget {
  const PaymentHistoryWidget({super.key});

  @override
  State<PaymentHistoryWidget> createState() => _PaymentHistoryWidgetState();
}

class _PaymentHistoryWidgetState extends State<PaymentHistoryWidget> {
  int selectedindex = 1;

  setSelectedIndex(int val) {
    selectedindex = val;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.only(left: 50, bottom: 20),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                            child: Text('Payment history',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600))),
                        SizedBox(
                            child: Text('lorem desun id johhus ojdn ehod jbus',
                                style: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w600))),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: ['Monthly', 'Weekly', 'Today']
                          .map((e) => SizedBox(
                                width: 150,
                                child: Column(
                                  children: [
                                    Text(e),
                                    padding10,
                                    Container(
                                      height: 3,
                                      width: double.infinity,
                                      color: e != 'Today'
                                          ? Colors.grey.shade300
                                          : Colors.cyan,
                                    )
                                  ],
                                ),
                              ))
                          .toList(),
                    )
                  ],
                ),
                padding10,
                Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          if (index == selectedindex) {
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: const Color(0xff5e6c93)),
                              height: 200,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    padding10,
                                    Row(
                                      children: [0, 1, 2, 3, 4]
                                          .map((e) => Expanded(
                                                child: switchWidgets(e, true),
                                              ))
                                          .toList(),
                                    ),
                                    padding10,
                                    const Divider(color: Colors.white54),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          buildInfoWidget(
                                              'Id Payment', '#000138684'),
                                          buildInfoWidget('Payment Method',
                                              'MasterCard 404'),
                                          buildInfoWidget(
                                              'Invoice Date', '22 May 2024'),
                                          buildInfoWidget(
                                              'Due Date', '12 June 2024'),
                                          buildInfoWidget(
                                              'Date Paid', '11 June 2024'),
                                          Expanded(child: Container())
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }
                          return InkWell(
                            onTap: () {
                              setSelectedIndex(index);
                            },
                            child: SizedBox(
                              height: 100,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [0, 1, 2, 3, 4]
                                      .map((e) => Expanded(
                                            child: switchWidgets(e, false),
                                          ))
                                      .toList(),
                                ),
                              ),
                            ),
                          );
                        }))
              ],
            ),
          ),
        ),
      );
    });
  }

  buildInfoWidget(String text, String val) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(color: Colors.white54),
          ),
          Text(
            val,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

  switchWidgets(int val, bool isSelected) {
    switch (val) {
      case 0:
        return buildProfileWidget(isSelected);
      case 1:
        return buildDateWidget(isSelected);
      case 2:
        return buildPaymentWidget(isSelected);
      case 3:
        return buildCardWidget(isSelected);
      case 4:
        return buildButtonWidget(isSelected);
      default:
        return Container();
    }
  }

  buildProfileWidget(bool isSelected) {
    return SizedBox(
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.amber),
          ),
          padding10,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  child: Text('Alex PeterShow',
                      style: TextStyle(
                          color: isSelected ? Colors.white : null,
                          fontWeight: FontWeight.w700))),
              padding5,
              SizedBox(
                  child: Text('Online Shop',
                      style: TextStyle(
                        color: isSelected ? Colors.white : null,
                      ))),
            ],
          ),
        ],
      ),
    );
  }

  buildDateWidget(bool isSelected) {
    return SizedBox(
        child: Center(
            child: Text('June 5, 2022 , 08:22 AM',
                style: TextStyle(
                  color: isSelected ? Colors.white : null,
                ))));
  }

  buildPaymentWidget(bool isSelected) {
    return SizedBox(
        child: Center(
            child: Text('+\$5,563',
                style: TextStyle(
                    color: isSelected ? Colors.white : null,
                    fontSize: 18,
                    fontWeight: FontWeight.bold))));
  }

  buildCardWidget(bool isSelected) {
    return SizedBox(
        child: Center(
            child: Text('MasterCard 404',
                style: TextStyle(
                  color: isSelected ? Colors.white : null,
                ))));
  }

  buildButtonWidget(bool isSelected) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.green),
          child: const Center(
            child: Text('Completed',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
        padding13,
        IconButton(
            onPressed: () {},
            icon: Icon(
                color: isSelected ? Colors.white : null,
                Icons.arrow_forward_ios,
                size: 15))
      ],
    );
  }
}
