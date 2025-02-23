import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:partner_hub/app/constants/constants_colors.dart';
import 'package:partner_hub/app/models/models/mobile_phones_model.dart';
import 'package:partner_hub/app/modules/support_hub/location/add_location.dart';
import 'package:partner_hub/app/modules/support_hub/location/ne.dart'
    show AddMobilePhoneDrawer;
import 'dart:ui';

import '../../../models/merchant_model/merchant_model.dart';
import '../../../models/models/brands_model.dart';
import '../../../models/models/types_model.dart';
import '../controllers/support_hub_controller.dart';
import '../location/add_brand_and_type.dart';
import '../widgets/homepage_view.dart';
import '../widgets/sh_location.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<SupportHubController>();
    return Scaffold(
      backgroundColor: const Color(0xFFE6E8F0),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xffDBD7ED).withOpacity(0.8), Color(0xFFDBE6E9)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                buildSliverAppBar(),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              height: 120,
                              decoration: BoxDecoration(
                                color: Color(0xffF5F3FB),
                                border:
                                    Border.all(width: 2.5, color: Colors.white),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.all(20),
                              child: SearchBar(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 30),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            height: 120,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Color(0xffF5F3FB),
                              border:
                                  Border.all(width: 2.8, color: Colors.white),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.all(20),
                            child: MaterialButton(
                              onPressed: () {
                                showNewLocationdialog(
                                        context,
                                        controller.brandsList,
                                        controller.typesList)
                                    .then((a) {
                                  controller.initializedData();
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: Colors.blue[50],
                                  borderRadius: BorderRadius.circular(12),
                                  border:
                                      Border.all(color: Colors.blue, width: 1),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add, color: Colors.blue),
                                    SizedBox(width: 8),
                                    Text(
                                      "New Model",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                !controller.loadingAllData
                    ? Center(
                        child: SpinKitThreeBounce(
                          color: AppColors.primaryColor,
                          size: 50.0,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: SupportHubLocations(),
                      ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<SupportHubController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextField(
            onChanged: (val) {
              controller.filterLocations(val);
            },
            decoration: InputDecoration(
              hintText: 'Search Model Phone',
              prefixIcon: Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        MaterialButton(
          onPressed: () async {
            await showDialogsShopPage(
              context: context,
              returnValue: (value) {},
            ).then((value) => controller.initializedData());
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black26, width: 1),
            ),
            child: Row(
              children: [
                SizedBox(width: 8),
                Icon(Icons.filter_alt_outlined, color: Colors.black),
                SizedBox(width: 8),
                Text(
                  "Add Brands",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8),
              ],
            ),
          ),
        ),
        MaterialButton(
          onPressed: () {
            // Add your onPressed logic
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black26, width: 1),
            ),
            child: Row(
              children: [
                SizedBox(width: 8),
                Icon(Icons.not_listed_location_sharp, color: Colors.black),
                SizedBox(width: 8),
                Text(
                  '${controller.selectedMerchantLocations.length} Models',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ClientTable extends StatelessWidget {
  final List<Map<String, String>> clients = [
    {
      'name': 'Netflix UK',
      'country': 'United Kingdom',
      'status': 'Activated',
      'balance': '15,000.00 GBP'
    },
    {
      'name': 'HBO GO',
      'country': 'Spain',
      'status': 'Pending',
      'balance': '0.00 EUR'
    },
    {
      'name': 'Glovo UA',
      'country': 'Ukraine',
      'status': 'Blocked',
      'balance': '0.00 PLN'
    },
    {
      'name': 'DHL Parcel',
      'country': 'Poland',
      'status': 'Deactivated',
      'balance': '0.00 PLN'
    },
    {
      'name': 'Disney UK',
      'country': 'United Kingdom',
      'status': 'Activated',
      'balance': '10,000.00 GBP'
    },
    {
      'name': 'Spotify PL',
      'country': 'Poland',
      'status': 'Activated',
      'balance': '5,000.00 GBP'
    },
  ];

  ClientTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: clients.map((client) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey.shade200,
              child: Text(client['name']![0]),
            ),
            title: Text(client['name']!,
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(client['country']!),
            trailing: Text(client['balance']!),
          ),
        );
      }).toList(),
    );
  }
}

Future showNewLocationdialog(BuildContext context, List<BrandsModel> brandsList,
    List<TypesModel> typesList,
    {MobilePhonesModel? model}) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AddMobilePhoneDrawers(
          brandsList: brandsList,
          model: model,
          typesList: typesList,
        );
      });
}
