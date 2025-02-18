// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import '../../../models/models/brands_model.dart';
import '../../../models/models/mobile_phones_model.dart';
import '../../../models/models/types_model.dart';
import 'controller.dart';

class AddMobilePhoneDrawers extends StatefulWidget {
  const AddMobilePhoneDrawers(
      {super.key, required this.brandsList, required this.typesList});
  final List<BrandsModel> brandsList;
  final List<TypesModel> typesList;

  @override
  State<AddMobilePhoneDrawers> createState() => _AddMobilePhoneDrawersState();
}

class _AddMobilePhoneDrawersState extends State<AddMobilePhoneDrawers> {
  final ScrollController _controller = ScrollController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController brandNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: GetBuilder<LocationControllerProvider>(
            init: LocationControllerProvider(),
            builder: (controller) {
              return Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Form(
                    key: controller.formKeysLocation,
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Add New Mobile Phone',
                                style: TextStyle(fontSize: 20),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.grey.shade200),
                                  child: const Center(
                                    child:
                                        Icon(Icons.highlight_remove_outlined),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 12, right: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  paddingwidget(),
                                  customtextfieldwidget(
                                      maxLines: 1,
                                      labelText: 'Phone Name',
                                      controller: nameController),
                                  paddingwidget(),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xffF0F0F4),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Center(
                                      child: DropdownButtonFormField<String>(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please Select Brand';
                                          }
                                          return null;
                                        },
                                        value: null,
                                        onChanged: (value) {
                                          if (value == null) return;
                                          controller.selectedBrand = value;
                                          brandNameController.text = widget
                                              .brandsList
                                              .firstWhere((element) =>
                                                  element.id.toString() ==
                                                  value)
                                              .name
                                              .toString();
                                          setState(() {});
                                        },
                                        items: widget.brandsList
                                            .map<DropdownMenuItem<String>>(
                                                (e) => DropdownMenuItem(
                                                    value: e.id.toString(),
                                                    child: Text(
                                                        e.name.toString())))
                                            .toList(),
                                        decoration: InputDecoration(
                                            fillColor: Colors.white,
                                            filled: true,
                                            labelStyle: const TextStyle(
                                              color: Colors.black54,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: const BorderSide(
                                                  color: Colors.black26,
                                                  width: 1),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: const BorderSide(
                                                  color: Color(0xff2f68c0),
                                                  width: 1),
                                            ),
                                            labelText: 'Select Brand'),
                                      ),
                                    ),
                                  ),
                                  paddingwidget(),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xffF0F0F4),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Center(
                                      child: DropdownButtonFormField<String>(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please Select Type';
                                          }
                                          return null;
                                        },
                                        value: null,
                                        onChanged: (value) {
                                          if (value == null) return;
                                          controller.selectedType = value;
                                          setState(() {});
                                        },
                                        items: widget.typesList
                                            .map<DropdownMenuItem<String>>(
                                                (e) => DropdownMenuItem(
                                                    value: e.id.toString(),
                                                    child: Text(
                                                        e.name.toString())))
                                            .toList(),
                                        decoration: InputDecoration(
                                            fillColor: Colors.white,
                                            filled: true,
                                            labelStyle: const TextStyle(
                                              color: Colors.black54,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: const BorderSide(
                                                  color: Colors.black26,
                                                  width: 1),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: const BorderSide(
                                                  color: Color(0xff2f68c0),
                                                  width: 1),
                                            ),
                                            labelText: 'Select Type'),
                                      ),
                                    ),
                                  ),
                                  paddingwidget(),
                                  DottedBorder(
                                    color: Colors.grey,
                                    strokeWidth: 1,
                                    child: Container(
                                      height: 170,
                                      width: double.infinity,
                                      color: const Color(0xffF0EFF4),
                                      child: Scrollbar(
                                        controller: _controller,
                                        child: SingleChildScrollView(
                                          controller: _controller,
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              Row(
                                                children: controller.imageslist
                                                    .map((e) => SizedBox(
                                                        width: 200,
                                                        child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Stack(
                                                              children: [
                                                                Container(
                                                                  height: 200,
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20)),
                                                                  child: Center(
                                                                    child: e
                                                                            is File
                                                                        ? Image
                                                                            .file(
                                                                            e,
                                                                            width:
                                                                                180,
                                                                            height:
                                                                                180,
                                                                          )
                                                                        : Image.network(
                                                                            e),
                                                                  ),
                                                                ),
                                                                Positioned(
                                                                    right: 10,
                                                                    top: 10,
                                                                    child:
                                                                        CircleAvatar(
                                                                      backgroundColor:
                                                                          const Color(
                                                                              0xffFDC9C9),
                                                                      child: Center(
                                                                          child: IconButton(
                                                                        onPressed:
                                                                            () {
                                                                          controller
                                                                              .removeImagelistitems(e);
                                                                        },
                                                                        icon:
                                                                            const Icon(
                                                                          Icons
                                                                              .delete_outline,
                                                                          color:
                                                                              Colors.red,
                                                                        ),
                                                                      )),
                                                                    ))
                                                              ],
                                                            ))))
                                                    .toList(),
                                              ),
                                              if (controller.imageslist.isEmpty)
                                                DragTarget<String>(
                                                  onAcceptWithDetails:
                                                      (data) {},
                                                  builder: (context,
                                                      candidateData,
                                                      rejectedData) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        controller
                                                            .pickimagefromstorage(
                                                                context);
                                                      },
                                                      child: SizedBox(
                                                        width: 200,
                                                        height: 200,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: DottedBorder(
                                                              color:
                                                                  Colors.grey,
                                                              child:
                                                                  const Center(
                                                                child: SizedBox(
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .upload,
                                                                        color: Colors
                                                                            .grey,
                                                                        size:
                                                                            30,
                                                                      ),
                                                                      Text(
                                                                        'Upload Model Image',
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.grey),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              )),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  paddingwidget(),
                                  MaterialButton(
                                      onPressed: () async {
                                        try {
                                          if (controller
                                              .formKeysLocation.currentState!
                                              .validate()) {
                                            String imageUrl = '';
                                            if (controller
                                                .imageslist.isNotEmpty) {
                                              if (controller.imageslist.first
                                                  is String) {
                                                imageUrl =
                                                    controller.imageslist.first;
                                              }
                                              if (controller.imageslist.first
                                                  is File) {
                                                imageUrl = await controller
                                                    .uploadImage(controller
                                                        .imageslist.first);
                                              }
                                            }

                                            final mobilePhone =
                                                MobilePhonesModel(
                                              name: nameController.text,
                                              image: imageUrl,
                                              brandName:
                                                  brandNameController.text,
                                              brands: int.parse(
                                                  controller.selectedBrand),
                                              type: int.parse(
                                                  controller.selectedType),
                                              createdAt: DateTime.now(),
                                            );

                                            await controller
                                                .insertLocationSupabase(
                                                    mobilePhone, context);
                                            Navigator.of(context).pop();
                                          }
                                        } on Exception catch (e) {
                                          print(e);
                                          controller.errormessage =
                                              e.toString();
                                          controller.update();
                                        }
                                      },
                                      child: Container(
                                        height: 55,
                                        width: 250,
                                        decoration: BoxDecoration(
                                            color: const Color(0xff0645FF),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Center(
                                          child: controller.isLoading
                                              ? const CircularProgressIndicator(
                                                  color: Colors.white,
                                                )
                                              : const Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.save,
                                                        color: Colors.white,
                                                        size: 30),
                                                    SizedBox(height: 15),
                                                    Text(
                                                      'Add Mobile Phone',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )
                                                  ],
                                                ),
                                        ),
                                      )),
                                ],
                              ),
                            )),
                          ],
                        )
                      ],
                    ),
                  ));
            }));
  }
}

customtextfieldwidget({
  required String labelText,
  required TextEditingController controller,
  int? maxLines = 1, // Default to single-line input
  TextInputType keyboardType = TextInputType.text, // Default keyboard type
  bool isRequired = true, // Add default validation for required fields
  bool isEmail = false, // Add option for email validation
  bool isNumeric = false, // Add option for numeric validation
  bool isWebsite = false, // Add option for website validation
  int? maxLength, // Optional max length
}) {
  return TextFormField(
    keyboardType: keyboardType, // Set keyboard type
    inputFormatters: isNumeric
        ? [FilteringTextInputFormatter.digitsOnly] // Ensure only digits
        : null,
    validator: (value) {
      // Check if the field is required and empty
      if (isRequired && (value == null || value.isEmpty)) {
        return 'Please enter $labelText';
      }
      // Email-specific validation
      if (isEmail && value != null) {
        // Simple regex pattern to validate email format
        const emailPattern =
            r'^[a-zA-Z0-9.a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
        final regex = RegExp(emailPattern);
        if (!regex.hasMatch(value)) {
          return 'Please enter a valid email address';
        }
      }
      if (isWebsite && value != null) {
        const websitePattern =
            r'^(https?:\/\/)?(www\.)?([a-zA-Z0-9]+)(\.[a-zA-Z]{2,})+([\/\w \.-]*)*\/?$';
        final regex = RegExp(websitePattern);
        if (!regex.hasMatch(value)) {
          return 'Please enter a valid website URL';
        }
      }
      // Validate max length if provided
      if (maxLength != null && value!.length > maxLength) {
        return 'Maximum length is $maxLength characters';
      }
      return null;
    },
    onSaved: (value) {
      controller.text = value.toString();
    },
    controller: controller,
    maxLines: maxLines,
    maxLength: maxLength,
    decoration: InputDecoration(
        labelStyle: TextStyle(
            color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w600),
        contentPadding:
            const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black26, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xff2f68c0), width: 1),
        ),
        labelText: 'Enter $labelText'),
  );
}

dropdowncustomtextfieldwidget(
    {required String title,
    required int maxlines,
    required TextEditingController controller,
    required List<DropdownMenuItem<int>> list,
    required List<Widget> selectedWidget}) {
  int? selectedValue;
  return Container(
    key: Key(list.toString()),
    decoration: BoxDecoration(
        color: const Color(0xffF0F0F4),
        borderRadius: BorderRadius.circular(12)),
    child: Center(
      child: DropdownButtonFormField<int>(
        validator: (value) {
          if (value == null || value.toString().isEmpty) {
            return 'Please Select $title';
          }

          return null;
        },
        onSaved: (value) {
          controller.text = value!.toString();
        },
        value: selectedValue,
        onChanged: (value) {
          controller.text = value.toString();
        },
        items: list,
        selectedItemBuilder: (context) {
          return selectedWidget;
        },
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            labelStyle: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.w600),
            contentPadding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.black26, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xff2f68c0), width: 1),
            ),
            labelText: 'Select $title'),
      ),
    ),
  );
}

amounttextfieldwidget(
    {required String title,
    required int maxlines,
    required TextEditingController controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title),
      const SizedBox(
        height: 10,
      ),
      Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Focus(
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter $title';
                }

                return null;
              },
              onSaved: (value) {
                controller.text = value!;
              },
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'[0-9]'),
                ),
              ],
              controller: controller,
              maxLines: maxlines,
              decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.price_change),
                  contentPadding: const EdgeInsetsDirectional.all(12),
                  border: InputBorder.none,
                  hintText: 'Enter $title'),
            ),
          ),
        ),
      ),
    ],
  );
}

paddingwidget() {
  return const SizedBox(
    height: 20,
    width: 20,
  );
}

final _items = [
  MultiSelectItem<String>('1', 'USA'),
  MultiSelectItem<String>('Canada', '2'),
  MultiSelectItem<String>('UK', '3'),
  MultiSelectItem<String>('Australia', '4'),
];
