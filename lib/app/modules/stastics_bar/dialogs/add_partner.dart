// // ignore_for_file: avoid_print

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

// import '../../Home/services/current_user_service.dart';
// import '../../stores/software_packages/controllers/software_packages_controller.dart';

// class PartnerDialogClass {
//   final _formKey = GlobalKey<FormState>();
//   final _formKeyHelpline = GlobalKey<FormState>();
//   final _formKeyProfile = GlobalKey<FormState>();

//   final _userController = Get.find<UserController>();

//   final firstNameController = TextEditingController();
//   final lastNameController = TextEditingController();
//   File? selectedImage;
//   String imageurl = '';
//   final _softwarePackageController = Get.put(SoftwarePackagesController());

//   final btelephoneNumberController = TextEditingController();
//   final bcountryController = TextEditingController();
//   final brandNamecontroller = TextEditingController();
//   final bemailController = TextEditingController();
//   final bpasswordController = TextEditingController();
//   final bbusiinessnamecontroller = TextEditingController();
//   final bwebsitecontroller = TextEditingController();
//   final bvatcontroller = TextEditingController();
//   final bpostcontroller = TextEditingController();
//   final bcitycontroller = TextEditingController();
//   final bbuildingcontroller = TextEditingController();
//   final bstreetcontroller = TextEditingController();
//   final bfacebookcontroller = TextEditingController();
//   final bgooglecontroller = TextEditingController();
//   final byoutubecontroller = TextEditingController();

//   // profile controller

//   final pfirstNameController = TextEditingController();
//   final plastNameController = TextEditingController();
//   final pemailController = TextEditingController();
//   final ppostcodeController = TextEditingController();
//   final pcityController = TextEditingController();
//   final pbuildingController = TextEditingController();
//   final pstreetController = TextEditingController();
//   final pcountryController = TextEditingController();
//   final ppictureurlController = TextEditingController();

//   // helpline controller
//   final hNameController = TextEditingController();
//   final hEmailController = TextEditingController();
//   final hphoneController = TextEditingController();
//   final hwhatsappController = TextEditingController();
//   final hdescriptionController = TextEditingController();

//   String? selectedValue;
//   final businessTypeController = TextEditingController();
//   void _clearForm() {
//     _formKey.currentState?.reset();
//     _formKeyHelpline.currentState?.reset();
//     _formKeyProfile.currentState?.reset();
//   }

//   Widget _buildTextField(
//       String label, TextEditingController controller, IconData icon,
//       {dynamic validator, TextInputType? keyboardType, required obsecure}) {
//     return TextFormField(
//       controller: controller,
//       validator: validator,
//       obscureText: obsecure,
//       keyboardType: keyboardType,
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: Colors.grey[200],
//         border: InputBorder.none,
//         hintText: 'Type $label',
//       ),
//       cursorColor: const Color.fromARGB(255, 87, 86, 86),
//       style: const TextStyle(
//         height: 2.3,
//         color: Color.fromARGB(255, 86, 84, 84),
//       ),
//     );
//   }

//   Future showBrandingDailog(BuildContext context) async {
//     final data = await _softwarePackageController.getBranding();
//     brandNamecontroller.text = data.business_name ?? '';
//     bemailController.text = data.email ?? '';
//     bwebsitecontroller.text = data.website ?? '';
//     bbuildingcontroller.text = data.building_number ?? '';
//     bpostcontroller.text = data.post_zip_code ?? '';
//     bcitycontroller.text = data.city ?? '';
//     bstreetcontroller.text = data.address ?? '';
//     bcountryController.text = data.country ?? '';
//     btelephoneNumberController.text = data.phone_number ?? '';
//     bfacebookcontroller.text = data.facebook ?? '';
//     bgooglecontroller.text = data.google ?? '';
//     byoutubecontroller.text = data.youtube ?? '';

//     return showDialog(
//       // ignore: use_build_context_synchronously
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return StatefulBuilder(
//             builder: (BuildContext context, StateSetter setState) {
//           updateimage() async {
//             final ImagePicker picker = ImagePicker();
//             final XFile? image =
//                 await picker.pickImage(source: ImageSource.gallery);
//             if (image != null) {
//               selectedImage = File(image.path);
//             }

//             setState(() {});
//           }

//           return Center(
//             child: Material(
//               color: Colors.transparent,
//               child: TweenAnimationBuilder<double>(
//                 tween: Tween(begin: 0.0, end: 1.0),
//                 duration: const Duration(seconds: 1),
//                 builder: (BuildContext context, double value, Widget? child) {
//                   const double dialogHeight = 900.0;
//                   final double translateY = value * -50;

//                   return Transform.translate(
//                     offset: Offset(0, translateY),
//                     child: Opacity(
//                       opacity: value,
//                       child: Container(
//                           padding: const EdgeInsets.all(20),
//                           margin: const EdgeInsets.all(20),
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(20)),
//                           width: 600,
//                           height: dialogHeight,
//                           child: Form(
//                             key: _formKey,
//                             child: SingleChildScrollView(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const Text(
//                                     'Bussiness Branding Details',
//                                     style: TextStyle(
//                                       fontSize: 25,
//                                       fontWeight: FontWeight.bold,
//                                       color: Color.fromARGB(255, 2, 66, 60),
//                                     ),
//                                   ),
//                                   const Text(
//                                     'Register Bussiness of a Partner by his Bussiness details.',
//                                     style: TextStyle(color: Colors.grey),
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   Row(
//                                     children: [
//                                       Expanded(
//                                           child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           const Text(
//                                             'Brand Name',
//                                             style:
//                                                 TextStyle(color: Colors.grey),
//                                           ),
//                                           const SizedBox(
//                                             height: 10,
//                                           ),
//                                           _buildTextField(
//                                               obsecure: false,
//                                               keyboardType: TextInputType.phone,
//                                               validator: (value) {
//                                             if (value.isEmpty) {
//                                               return 'Enter Brand Name';
//                                             }
//                                           }, 'Brand Name', brandNamecontroller,
//                                               Icons.location_city),
//                                         ],
//                                       )),
//                                     ],
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   Row(
//                                     children: [
//                                       Expanded(
//                                           child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           const Text(
//                                             'Bussiness Email',
//                                             style:
//                                                 TextStyle(color: Colors.grey),
//                                           ),
//                                           const SizedBox(
//                                             height: 10,
//                                           ),
//                                           _buildTextField(
//                                               obsecure: false,
//                                               keyboardType: TextInputType.phone,
//                                               validator: (value) {
//                                             if (value.isEmpty) {
//                                               return 'Enter Bussiness Email';
//                                             }
//                                           },
//                                               'Bussiness Email',
//                                               bemailController,
//                                               Icons.location_city),
//                                         ],
//                                       )),
//                                     ],
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   const Text(
//                                     'Website Url',
//                                     style: TextStyle(color: Colors.grey),
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   _buildTextField(
//                                       obsecure: false,
//                                       keyboardType: TextInputType
//                                           .visiblePassword, validator: (value) {
//                                     if (value.isEmpty) {
//                                       return 'Enter Website URl';
//                                     }
//                                   }, 'Website Url', bwebsitecontroller,
//                                       Icons.lock),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   Row(
//                                     children: [
//                                       Expanded(
//                                           child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           const Text(
//                                             'Building Number',
//                                             style:
//                                                 TextStyle(color: Colors.grey),
//                                           ),
//                                           const SizedBox(
//                                             height: 10,
//                                           ),
//                                           _buildTextField(
//                                               obsecure: false,
//                                               keyboardType: TextInputType.phone,
//                                               validator: (value) {
//                                             if (value.isEmpty) {
//                                               return 'Enter phone number';
//                                             }
//                                           }, 'Building Number',
//                                               bbuildingcontroller, Icons.phone),
//                                         ],
//                                       )),
//                                       const SizedBox(
//                                         width: 20,
//                                       ),
//                                       Expanded(
//                                           child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           const Text(
//                                             'Post Code',
//                                             style:
//                                                 TextStyle(color: Colors.grey),
//                                           ),
//                                           const SizedBox(
//                                             height: 10,
//                                           ),
//                                           _buildTextField(
//                                               obsecure: false,
//                                               keyboardType:
//                                                   TextInputType.emailAddress,
//                                               validator: (value) {
//                                             if (value.isEmpty) {
//                                               return 'Enter email';
//                                             }
//                                           }, 'Post Code', bpostcontroller,
//                                               Icons.email),
//                                         ],
//                                       )),
//                                       const SizedBox(
//                                         width: 20,
//                                       ),
//                                       Expanded(
//                                           child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           const Text(
//                                             'City',
//                                             style:
//                                                 TextStyle(color: Colors.grey),
//                                           ),
//                                           const SizedBox(
//                                             height: 10,
//                                           ),
//                                           _buildTextField(
//                                               obsecure: false,
//                                               keyboardType:
//                                                   TextInputType.emailAddress,
//                                               validator: (value) {
//                                             if (value.isEmpty) {
//                                               return 'Enter City';
//                                             }
//                                           }, "City", bcitycontroller,
//                                               Icons.email),
//                                         ],
//                                       )),
//                                     ],
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   const Text(
//                                     'Street Address',
//                                     style: TextStyle(color: Colors.grey),
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   _buildTextField(
//                                       obsecure: false,
//                                       keyboardType: TextInputType
//                                           .visiblePassword, validator: (value) {
//                                     if (value.isEmpty) {
//                                       return 'Enter Address';
//                                     }
//                                   }, 'Street Address', bstreetcontroller,
//                                       Icons.lock),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       const Text(
//                                         'Country',
//                                         style: TextStyle(color: Colors.grey),
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       _buildTextField(
//                                           obsecure: false,
//                                           keyboardType:
//                                               TextInputType.emailAddress,
//                                           validator: (value) {
//                                         if (value.isEmpty) {
//                                           return 'Enter country';
//                                         }
//                                       }, "Select Country", bcountryController,
//                                           Icons.email),
//                                     ],
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   const Text(
//                                     'Bussiness Telephone',
//                                     style: TextStyle(color: Colors.grey),
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   _buildTextField(
//                                       obsecure: false,
//                                       keyboardType: TextInputType.phone,
//                                       validator: (value) {
//                                     if (value.isEmpty) {
//                                       return 'Enter Bussiness Telephone';
//                                     }
//                                   },
//                                       'Bussiness Telephone',
//                                       btelephoneNumberController,
//                                       Icons.location_city),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   Row(
//                                     children: [
//                                       Expanded(
//                                           child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           const Text(
//                                             'Facebook',
//                                             style:
//                                                 TextStyle(color: Colors.grey),
//                                           ),
//                                           const SizedBox(
//                                             height: 10,
//                                           ),
//                                           _buildTextField(
//                                               obsecure: false,
//                                               keyboardType: TextInputType.text,
//                                               validator: (value) {
//                                             if (value.isEmpty) {
//                                               return 'Enter Facebook';
//                                             }
//                                           }, 'Facebook', bfacebookcontroller,
//                                               Icons.phone),
//                                         ],
//                                       )),
//                                       const SizedBox(
//                                         width: 20,
//                                       ),
//                                       Expanded(
//                                           child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           const Text(
//                                             'Youtube',
//                                             style:
//                                                 TextStyle(color: Colors.grey),
//                                           ),
//                                           const SizedBox(
//                                             height: 10,
//                                           ),
//                                           _buildTextField(
//                                               obsecure: false,
//                                               keyboardType:
//                                                   TextInputType.emailAddress,
//                                               validator: (value) {
//                                             if (value.isEmpty) {
//                                               return 'Enter youtube';
//                                             }
//                                           }, 'Youtube', byoutubecontroller,
//                                               Icons.email),
//                                         ],
//                                       )),
//                                       const SizedBox(
//                                         width: 20,
//                                       ),
//                                       Expanded(
//                                           child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           const Text(
//                                             'Google',
//                                             style:
//                                                 TextStyle(color: Colors.grey),
//                                           ),
//                                           const SizedBox(
//                                             height: 10,
//                                           ),
//                                           _buildTextField(
//                                               obsecure: false,
//                                               keyboardType:
//                                                   TextInputType.emailAddress,
//                                               validator: (value) {
//                                             if (value.isEmpty) {
//                                               return 'Enter google';
//                                             }
//                                           }, "Google", bgooglecontroller,
//                                               Icons.email),
//                                         ],
//                                       )),
//                                     ],
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   if (selectedImage != null)
//                                     Image.file(
//                                       selectedImage!,
//                                       width: 180,
//                                       height: 180,
//                                     )
//                                   else
//                                     data.logo != null
//                                         ? Image.network(
//                                             data.logo!,
//                                             height: 180,
//                                             width: 180,
//                                           )
//                                         : GestureDetector(
//                                             onTap: updateimage,
//                                             child: const SizedBox(
//                                               width: 180,
//                                               height: 180,
//                                               child: DottedBorderWidget(
//                                                 child: Center(
//                                                   child: Column(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .center,
//                                                     children: [
//                                                       Text(
//                                                         'No Branding Logo Selected',
//                                                         textAlign:
//                                                             TextAlign.center,
//                                                       ),
//                                                       Text(
//                                                         'Files Supported : JPEG, PNG',
//                                                         style: TextStyle(
//                                                             fontSize: 12,
//                                                             color: Colors.grey),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           selectedImage != null ||
//                                                   data.logo != null
//                                               ? TextButton(
//                                                   onPressed: updateimage,
//                                                   child: const Text(
//                                                       'Change Picture'))
//                                               : Container(),
//                                           const SizedBox(
//                                             width: 20,
//                                           ),
//                                           TextButton(
//                                               onPressed: () {
//                                                 _clearForm();
//                                                 Navigator.pop(context, null);
//                                               },
//                                               child: const Text('Cancel')),
//                                           const SizedBox(
//                                             width: 20,
//                                           ),
//                                           ElevatedButton(
//                                             onPressed: () async {
//                                               if (_formKey.currentState!
//                                                   .validate()) {
//                                                 final data =
//                                                     await _softwarePackageController
//                                                         .getBranding();
//                                                 final response =
//                                                     await _softwarePackageController
//                                                         .updateBranding(
//                                                             data.copyWith(
//                                                   id: data.id,
//                                                   business_name:
//                                                       brandNamecontroller.text,
//                                                   email: bemailController.text,
//                                                   website:
//                                                       bwebsitecontroller.text,
//                                                   building_number:
//                                                       bbuildingcontroller.text,
//                                                   post_zip_code:
//                                                       bpostcontroller.text,
//                                                   city: bcitycontroller.text,
//                                                   address:
//                                                       bstreetcontroller.text,
//                                                   country:
//                                                       bcountryController.text,
//                                                   phone_number:
//                                                       btelephoneNumberController
//                                                           .text,
//                                                   facebook:
//                                                       bfacebookcontroller.text,
//                                                   google:
//                                                       bgooglecontroller.text,
//                                                   youtube:
//                                                       byoutubecontroller.text,
//                                                   logo: selectedImage != null
//                                                       ? selectedImage!.path
//                                                       : data.logo,
//                                                 ));
//                                                 if (response) {
//                                                   _clearForm();
//                                                   Get.back();
//                                                 }
//                                               }
//                                             },
//                                             style: ElevatedButton.styleFrom(
//                                               minimumSize: const Size(
//                                                   250, 50), // Adjust the size
//                                               backgroundColor:
//                                                   const Color.fromARGB(
//                                                       255, 2, 66, 60),
//                                               shape: RoundedRectangleBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(
//                                                         10.0), // Border radius
//                                               ),
//                                             ),
//                                             child: const Row(
//                                               mainAxisSize: MainAxisSize.min,
//                                               children: [
//                                                 Icon(
//                                                   Icons.save,
//                                                   color: Colors.white,
//                                                 ),
//                                                 SizedBox(width: 8),
//                                                 Text(
//                                                   'Update',
//                                                   style: TextStyle(
//                                                       color: Colors.white),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           )),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           );
//         });
//       },
//     );
//   }

//   Future showProfileDailog(BuildContext context) async {
//     final data = _userController.currentUser;
//     print(data!.country_id);

//     final countryData =
//         await _softwarePackageController.getCountryByid(data.country_id ?? 0);
//     pfirstNameController.text = data.first_name ?? '';
//     plastNameController.text = data.last_name ?? '';
//     pemailController.text = data.email ?? '';
//     ppostcodeController.text = data.postcode ?? '';
//     pcityController.text = data.city ?? '';
//     pbuildingController.text = data.building_number ?? '';
//     pstreetController.text = data.street_address ?? '';
//     ppictureurlController.text = data.pictureurl ?? '';
//     pcountryController.text = countryData.countryName ?? '';

//     return showDialog(
//       // ignore: use_build_context_synchronously
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return StatefulBuilder(
//             builder: (BuildContext context, StateSetter setState) {
//           return Center(
//             child: Material(
//               color: Colors.transparent,
//               child: TweenAnimationBuilder<double>(
//                 tween: Tween(begin: 0.0, end: 1.0),
//                 duration: const Duration(seconds: 1),
//                 builder: (BuildContext context, double value, Widget? child) {
//                   const double dialogHeight = 900.0;
//                   final double translateY = value * -50;

//                   return Transform.translate(
//                     offset: Offset(0, translateY),
//                     child: Opacity(
//                       opacity: value,
//                       child: Container(
//                           padding: const EdgeInsets.all(20),
//                           margin: const EdgeInsets.all(20),
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(20)),
//                           width: 600,
//                           height: dialogHeight,
//                           child: Form(
//                             key: _formKeyProfile,
//                             child: SingleChildScrollView(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const Text(
//                                     'Profile Details',
//                                     style: TextStyle(
//                                       fontSize: 25,
//                                       fontWeight: FontWeight.bold,
//                                       color: Color.fromARGB(255, 2, 66, 60),
//                                     ),
//                                   ),
//                                   const Text(
//                                     'Partner Profile Details.',
//                                     style: TextStyle(color: Colors.grey),
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   Row(
//                                     children: [
//                                       Expanded(
//                                           child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           const Text(
//                                             'First Name',
//                                             style:
//                                                 TextStyle(color: Colors.grey),
//                                           ),
//                                           const SizedBox(
//                                             height: 10,
//                                           ),
//                                           _buildTextField(
//                                               obsecure: false,
//                                               keyboardType: TextInputType.text,
//                                               validator: (value) {
//                                             if (value.isEmpty) {
//                                               return 'Enter First Name';
//                                             }
//                                           }, 'First Name', pfirstNameController,
//                                               Icons.location_city),
//                                         ],
//                                       )),
//                                       const SizedBox(
//                                         width: 20,
//                                       ),
//                                       Expanded(
//                                           child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           const Text(
//                                             'Last Name',
//                                             style:
//                                                 TextStyle(color: Colors.grey),
//                                           ),
//                                           const SizedBox(
//                                             height: 10,
//                                           ),
//                                           _buildTextField(
//                                               obsecure: false,
//                                               keyboardType: TextInputType.text,
//                                               validator: (value) {
//                                             if (value.isEmpty) {
//                                               return 'Last Name';
//                                             }
//                                           }, 'Last Name', plastNameController,
//                                               Icons.location_city),
//                                         ],
//                                       )),
//                                     ],
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   Row(
//                                     children: [
//                                       Expanded(
//                                           child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           const Text(
//                                             'Email',
//                                             style:
//                                                 TextStyle(color: Colors.grey),
//                                           ),
//                                           const SizedBox(
//                                             height: 10,
//                                           ),
//                                           _buildTextField(
//                                               obsecure: false,
//                                               keyboardType: TextInputType.phone,
//                                               validator: (value) {
//                                             if (value.isEmpty) {
//                                               return 'Enter Email';
//                                             }
//                                           }, 'Email', pemailController,
//                                               Icons.location_city),
//                                         ],
//                                       )),
//                                     ],
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       const Text(
//                                         'Country',
//                                         style: TextStyle(color: Colors.grey),
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       _buildTextField(
//                                           obsecure: false,
//                                           keyboardType:
//                                               TextInputType.emailAddress,
//                                           validator: (value) {
//                                         if (value.isEmpty) {
//                                           return 'Enter country';
//                                         }
//                                       }, "Select Country", bcountryController,
//                                           Icons.email),
//                                     ],
//                                   ),
//                                   Row(
//                                     children: [
//                                       Expanded(
//                                           child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           const Text(
//                                             'Building Number',
//                                             style:
//                                                 TextStyle(color: Colors.grey),
//                                           ),
//                                           const SizedBox(
//                                             height: 10,
//                                           ),
//                                           _buildTextField(
//                                               obsecure: false,
//                                               keyboardType: TextInputType.phone,
//                                               validator: (value) {
//                                             if (value.isEmpty) {
//                                               return 'Enter phone number';
//                                             }
//                                           }, 'Building Number',
//                                               pbuildingController, Icons.phone),
//                                         ],
//                                       )),
//                                       const SizedBox(
//                                         width: 20,
//                                       ),
//                                       Expanded(
//                                           child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           const Text(
//                                             'Post Code',
//                                             style:
//                                                 TextStyle(color: Colors.grey),
//                                           ),
//                                           const SizedBox(
//                                             height: 10,
//                                           ),
//                                           _buildTextField(
//                                               obsecure: false,
//                                               keyboardType: TextInputType.text,
//                                               validator: (value) {
//                                             if (value.isEmpty) {
//                                               return 'Enter email';
//                                             }
//                                           }, 'Post Code', ppostcodeController,
//                                               Icons.email),
//                                         ],
//                                       )),
//                                       const SizedBox(
//                                         width: 20,
//                                       ),
//                                       Expanded(
//                                           child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           const Text(
//                                             'City',
//                                             style:
//                                                 TextStyle(color: Colors.grey),
//                                           ),
//                                           const SizedBox(
//                                             height: 10,
//                                           ),
//                                           _buildTextField(
//                                               obsecure: false,
//                                               keyboardType:
//                                                   TextInputType.emailAddress,
//                                               validator: (value) {
//                                             if (value.isEmpty) {
//                                               return 'Enter City';
//                                             }
//                                           }, "City", pcityController,
//                                               Icons.email),
//                                         ],
//                                       )),
//                                     ],
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   const Text(
//                                     'Street Address',
//                                     style: TextStyle(color: Colors.grey),
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   _buildTextField(
//                                       obsecure: false,
//                                       keyboardType: TextInputType
//                                           .visiblePassword, validator: (value) {
//                                     if (value.isEmpty) {
//                                       return 'Enter Address';
//                                     }
//                                   }, 'Street Address', pstreetController,
//                                       Icons.lock),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           TextButton(
//                                               onPressed: () {
//                                                 _clearForm();
//                                                 Navigator.pop(context, null);
//                                               },
//                                               child: const Text('Cancel')),
//                                           const SizedBox(
//                                             width: 20,
//                                           ),
//                                           ElevatedButton(
//                                             onPressed: () async {
//                                               if (_formKeyProfile.currentState!
//                                                   .validate()) {
//                                                 final response =
//                                                     await _softwarePackageController
//                                                         .updateProfile(
//                                                             data.copyWith(
//                                                   first_name:
//                                                       pfirstNameController.text,
//                                                   last_name:
//                                                       plastNameController.text,
//                                                 ));
//                                                 if (response) {
//                                                   _clearForm();
//                                                   Get.back();
//                                                 }
//                                               }
//                                             },
//                                             style: ElevatedButton.styleFrom(
//                                               minimumSize: const Size(
//                                                   250, 50), // Adjust the size
//                                               backgroundColor:
//                                                   const Color.fromARGB(
//                                                       255, 2, 66, 60),
//                                               shape: RoundedRectangleBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(
//                                                         10.0), // Border radius
//                                               ),
//                                             ),
//                                             child: const Row(
//                                               mainAxisSize: MainAxisSize.min,
//                                               children: [
//                                                 Icon(
//                                                   Icons.save,
//                                                   color: Colors.white,
//                                                 ),
//                                                 SizedBox(width: 8),
//                                                 Text(
//                                                   'Update',
//                                                   style: TextStyle(
//                                                       color: Colors.white),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           )),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           );
//         });
//       },
//     );
//   }

//   // helpline dialog
//   Future showHelplineDailog(BuildContext context) async {
//     final data = await _softwarePackageController.getHelpline();
//     print(data);
//     hNameController.text = data.name ?? '';
//     hEmailController.text = data.email ?? '';
//     hphoneController.text = data.phone_number ?? '';
//     hwhatsappController.text = data.whatsapp ?? '';
//     hdescriptionController.text = data.description ?? '';

//     return showDialog(
//       // ignore: use_build_context_synchronously
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return StatefulBuilder(
//             builder: (BuildContext context, StateSetter setState) {
//           return Center(
//             child: Material(
//               color: Colors.transparent,
//               child: TweenAnimationBuilder<double>(
//                 tween: Tween(begin: 0.0, end: 1.0),
//                 duration: const Duration(seconds: 1),
//                 builder: (BuildContext context, double value, Widget? child) {
//                   const double dialogHeight = 900.0;
//                   final double translateY = value * -50;

//                   return Transform.translate(
//                     offset: Offset(0, translateY),
//                     child: Opacity(
//                       opacity: value,
//                       child: Container(
//                           padding: const EdgeInsets.all(20),
//                           margin: const EdgeInsets.all(20),
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(20)),
//                           width: 600,
//                           height: dialogHeight,
//                           child: Form(
//                             key: _formKeyHelpline,
//                             child: SingleChildScrollView(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const Text(
//                                     'Partner Helpline',
//                                     style: TextStyle(
//                                       fontSize: 25,
//                                       fontWeight: FontWeight.bold,
//                                       color: Color.fromARGB(255, 2, 66, 60),
//                                     ),
//                                   ),
//                                   const Text(
//                                     'Partner Helpline Details.',
//                                     style: TextStyle(color: Colors.grey),
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   Row(
//                                     children: [
//                                       Expanded(
//                                           child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           const Text(
//                                             'Name',
//                                             style:
//                                                 TextStyle(color: Colors.grey),
//                                           ),
//                                           const SizedBox(
//                                             height: 10,
//                                           ),
//                                           _buildTextField(
//                                               obsecure: false,
//                                               keyboardType: TextInputType.phone,
//                                               validator: (value) {
//                                             if (value.isEmpty) {
//                                               return 'Enter helpline Name';
//                                             }
//                                           }, 'Name', hNameController,
//                                               Icons.location_city),
//                                         ],
//                                       )),
//                                     ],
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   Row(
//                                     children: [
//                                       Expanded(
//                                           child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           const Text(
//                                             'Email',
//                                             style:
//                                                 TextStyle(color: Colors.grey),
//                                           ),
//                                           const SizedBox(
//                                             height: 10,
//                                           ),
//                                           _buildTextField(
//                                               obsecure: false,
//                                               keyboardType: TextInputType.phone,
//                                               validator: (value) {
//                                             if (value.isEmpty) {
//                                               return 'Enter helpline Email';
//                                             }
//                                           }, 'Email', bemailController,
//                                               Icons.location_city),
//                                         ],
//                                       )),
//                                     ],
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   Row(
//                                     children: [
//                                       Expanded(
//                                           child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           const Text(
//                                             'Phone Number',
//                                             style:
//                                                 TextStyle(color: Colors.grey),
//                                           ),
//                                           const SizedBox(
//                                             height: 10,
//                                           ),
//                                           _buildTextField(
//                                               obsecure: false,
//                                               keyboardType: TextInputType.phone,
//                                               validator: (value) {
//                                             if (value.isEmpty) {
//                                               return 'Enter Phone Number';
//                                             }
//                                           }, 'Phone Number', hphoneController,
//                                               Icons.location_city),
//                                           const SizedBox(
//                                             height: 10,
//                                           ),
//                                         ],
//                                       )),
//                                       const SizedBox(
//                                         width: 20,
//                                       ),
//                                       Expanded(
//                                           child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           const Text(
//                                             'Whatsapp',
//                                             style:
//                                                 TextStyle(color: Colors.grey),
//                                           ),
//                                           const SizedBox(
//                                             height: 10,
//                                           ),
//                                           _buildTextField(
//                                               obsecure: false,
//                                               keyboardType: TextInputType.phone,
//                                               validator: (value) {
//                                             if (value.isEmpty) {
//                                               return 'Enter Whatsapp';
//                                             }
//                                           }, 'Whatsapp', hwhatsappController,
//                                               Icons.location_city),
//                                         ],
//                                       )),
//                                     ],
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       const Text(
//                                         'Description',
//                                         style: TextStyle(color: Colors.grey),
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       _buildTextField(
//                                           obsecure: false,
//                                           keyboardType: TextInputType.phone,
//                                           validator: (value) {
//                                         if (value.isEmpty) {
//                                           return 'Enter Description';
//                                         }
//                                       }, 'Description', hdescriptionController,
//                                           Icons.location_city),
//                                     ],
//                                   ),
//                                   const SizedBox(
//                                     height: 50,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           TextButton(
//                                               onPressed: () {
//                                                 _clearForm();
//                                                 Navigator.pop(context, null);
//                                               },
//                                               child: const Text('Cancel')),
//                                           const SizedBox(
//                                             width: 20,
//                                           ),
//                                           ElevatedButton(
//                                             onPressed: () async {
//                                               if (_formKeyHelpline.currentState!
//                                                   .validate()) {
//                                                 final response =
//                                                     await _softwarePackageController
//                                                         .updateHelpline(
//                                                             data.copyWith(
//                                                   id: data.id,
//                                                   name: hNameController.text,
//                                                   email: hEmailController.text,
//                                                   phone_number:
//                                                       hphoneController.text,
//                                                   whatsapp:
//                                                       hwhatsappController.text,
//                                                 ));
//                                                 if (response) {
//                                                   _clearForm();
//                                                   Get.back();
//                                                 }
//                                               }
//                                             },
//                                             style: ElevatedButton.styleFrom(
//                                               minimumSize: const Size(
//                                                   250, 50), // Adjust the size
//                                               backgroundColor:
//                                                   const Color.fromARGB(
//                                                       255, 2, 66, 60),
//                                               shape: RoundedRectangleBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(
//                                                         10.0), // Border radius
//                                               ),
//                                             ),
//                                             child: const Row(
//                                               mainAxisSize: MainAxisSize.min,
//                                               children: [
//                                                 Icon(
//                                                   Icons.save,
//                                                   color: Colors.white,
//                                                 ),
//                                                 SizedBox(width: 8),
//                                                 Text(
//                                                   'Update',
//                                                   style: TextStyle(
//                                                       color: Colors.white),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           )),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           );
//         });
//       },
//     );
//   }
// }

// class DottedBorderPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final Paint paint = Paint()
//       ..color = Colors.grey[300] as Color
//       ..strokeWidth = 2.0
//       ..style = PaintingStyle.stroke;

//     const double dashWidth = 5.0;
//     const double dashSpace = 5.0;

//     double startX = 0.0;

//     while (startX < size.width) {
//       canvas.drawLine(
//         Offset(startX, 0),
//         Offset(startX + dashWidth, 0),
//         paint,
//       );

//       startX += dashWidth + dashSpace;
//     }

//     double startY = 0.0;

//     while (startY < size.height) {
//       canvas.drawLine(
//         Offset(0, startY),
//         Offset(0, startY + dashWidth),
//         paint,
//       );

//       startY += dashWidth + dashSpace;
//     }
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }

// class DottedBorderWidget extends StatelessWidget {
//   final Widget child;

//   const DottedBorderWidget({super.key, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         CustomPaint(
//           painter: DottedBorderPainter(),
//           child: Container(),
//         ),
//         child,
//       ],
//     );
//   }
// }
