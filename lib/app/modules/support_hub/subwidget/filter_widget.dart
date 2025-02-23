import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner_hub/app/models/models/brands_model.dart';
import 'package:partner_hub/app/models/models/types_model.dart';
import 'package:partner_hub/app/modules/support_hub/location/controller.dart';
import 'package:partner_hub/app/modules/support_hub/widgets/peoples_widget_listview.dart';

import '../controllers/support_hub_controller.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SupportHubController>(
        init: SupportHubController(),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Filters',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              // Brand Filter Section
              const Text(
                'Brand',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              ...controller.brandOptions.keys.map((brand) {
                return CheckboxListTile(
                  value: controller.brandOptions[brand],
                  title: Row(
                    children: [
                      Expanded(child: Text(brand)),
                      IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return DeleteProductDialog(
                                  productName: brand,
                                  onDelete: () async {
                                    try {
                                      var con =
                                          Get.find<SupportHubController>();
                                      var brandres = await supbaseClient
                                          .from('brands')
                                          .select()
                                          .eq('name', brand)
                                          .single();
                                      BrandsModel fetchedbrand =
                                          BrandsModel.fromJson(brandres);
                                      print(fetchedbrand);
                                      await supbaseClient
                                          .from('phones_models')
                                          .delete()
                                          .eq('brands', fetchedbrand.id ?? 0);
                                      await supbaseClient
                                          .from('brands')
                                          .delete()
                                          .eq('id', fetchedbrand.id ?? 0);
                                      setState(() {});
                                      await con.initializedData();
                                      return true;
                                    } on Exception catch (e) {
                                      print(e);
                                      return false;
                                    }
                                  },
                                  onResult: (bool result) {
                                    if (result) {
                                      showError(
                                        "Deletion Successfully",
                                        "product delete sucessfull",
                                      );
                                    } else {
                                      showError(
                                        "Deletion Failed",
                                        "product delete failed",
                                      );
                                    }
                                  },
                                  onError: (String error) {
                                    showError(
                                      "Deletion Failed Available",
                                      "product delete failed $error",
                                    );
                                  },
                                );
                              },
                            ).then((c) async {
                              {
                                var con = Get.find<SupportHubController>();
                                return con.initializedData();
                              }
                            });
                          },
                          icon: Icon(Icons.delete,
                              color: Color(0xff5E85CC), size: 30)),
                    ],
                  ),
                  activeColor: Colors.pink,
                  onChanged: (value) =>
                      controller.toggleSelection('Brand', brand),
                  controlAffinity: ListTileControlAffinity.leading,
                );
              }),

              SizedBox(height: 20),
              const Text(
                'Type',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              ...controller.typesOptions.keys.map((type) {
                return CheckboxListTile(
                  value: controller.typesOptions[type],
                  title: Row(
                    children: [
                      Expanded(child: Text(type)),
                      IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return DeleteProductDialog(
                                  productName: type,
                                  onDelete: () async {
                                    try {
                                      var con =
                                          Get.find<SupportHubController>();
                                      var brandres = await supbaseClient
                                          .from('device_types')
                                          .select()
                                          .eq('name', type)
                                          .single();
                                      TypesModel fetchedType =
                                          TypesModel.fromJson(brandres);
                                      print(fetchedType);
                                      await supbaseClient
                                          .from('phones_models')
                                          .delete()
                                          .eq('type', fetchedType.id ?? 0);
                                      await supbaseClient
                                          .from('device_types')
                                          .delete()
                                          .eq('id', fetchedType.id ?? 0);
                                      setState(() {});
                                      await con.initializedData();
                                      return true;
                                    } on Exception catch (e) {
                                      print(e);
                                      return false;
                                    }
                                  },
                                  onResult: (bool result) {
                                    if (result) {
                                      showError(
                                        "Deletion Successfully",
                                        "type delete sucessfull",
                                      );
                                    } else {
                                      showError(
                                        "Deletion Failed",
                                        "type delete failed",
                                      );
                                    }
                                  },
                                  onError: (String error) {
                                    showError(
                                      "Deletion Failed Available",
                                      "type delete failed $error",
                                    );
                                  },
                                );
                              },
                            ).then((c) async {
                              {
                                var con = Get.find<SupportHubController>();
                                return con.initializedData();
                              }
                            });
                          },
                          icon: Icon(Icons.delete,
                              color: Color(0xff5E85CC), size: 30)),
                    ],
                  ),
                  activeColor: Colors.pink,
                  onChanged: (value) =>
                      controller.toggleSelection('Type', type),
                  controlAffinity: ListTileControlAffinity.leading,
                );
              }),
            ],
          );
        });
  }
}
