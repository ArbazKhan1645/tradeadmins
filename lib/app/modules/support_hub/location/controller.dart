// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages, avoid_print

import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:partner_hub/app/models/bussiness_type_model.dart';
import 'package:partner_hub/app/modules/support_hub/location/place_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart' show kIsWeb;
import '../../../models/LocationModel.dart';
import '../../../models/country_model.dart';
import '../../../models/models/mobile_phones_model.dart';

final supbaseClient = Supabase.instance.client;

class LocationControllerProvider extends GetxController {
  late Future<List<LocationModel>> locationsFuture;
  final ImagePicker picker = ImagePicker();
  final GlobalKey<FormState> formKeysLocation = GlobalKey<FormState>();
  bool isLocationLoading = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  removeImagelistitems(var image) {
    imageslist.remove(image);
    update();
  }

  Future<dynamic> pickImage() async {
    try {
      // For web platform
      if (kIsWeb) {
        final XFile? image =
            await picker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          final bytes = await image.readAsBytes();
          return bytes;
        }
      }
      // For mobile and desktop platforms
      else {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['jpg', 'jpeg', 'png'],
        );

        if (result != null) {
          return File(result.files.single.path!);
        }
      }
      return null;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  var selectedImage;
  bool isclickablePickImage = false;
  setisclickablePickImage() {
    isclickablePickImage = !isclickablePickImage;
    update();
  }

  pickimagefromstorage(BuildContext context) async {
    if (isclickablePickImage == true) return;
    isclickablePickImage = true;
    selectedImage = await pickImage().then((v) {
      isclickablePickImage = false;
      return v;
    });

    if (selectedImage != null) {
      addimagetoImagelist(selectedImage, context);
      update();
    }
  }

  String errormessage = '';
  bool isValidUrl(String url) {
    Uri uri = Uri.parse(url);
    return uri.isScheme("http") || uri.isScheme("https");
  }

  bool loadedimagevalidation = false;
  setloadingofImageValidationCheck() {
    loadedimagevalidation = !loadedimagevalidation;
    update();
  }

  Future<bool> validateAndAddImage(
      String imageUrl, BuildContext context) async {
    setloadingofImageValidationCheck();
    bool pictureloaded = false;
    errormessage = '';
    try {
      http.Response response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        String contentType = response.headers['content-type'] ?? '';
        if (contentType.startsWith('image/')) {
          pictureloaded = true;
        } else {
          errormessage = 'Invalid Content Type';
        }
      } else {
        errormessage = 'Failed to Load Image';
      }
    } catch (error) {
      errormessage = 'Error: $error';
    }
    setloadingofImageValidationCheck();
    return pictureloaded;
  }

  addimagetoImagelist(var image, BuildContext context) async {
    if (image is String) {
      if (isValidUrl(image)) {
        bool pictureloaded;
        pictureloaded = await validateAndAddImage(image, context);
        if (pictureloaded == true) {
          imageslist.add(image);
        }
      } else {
        errormessage = 'Invalid URLS';
      }
    } else {
      imageslist.add(image);
    }
    update();
  }

  List<dynamic> imageslist = [];

  fetchBusiness() async {
    await fetchSupabaseApiTableDataLinkedToSoftwarePackages(
        'business_category');
    await fetchSupabaseApiTableDataLinkedToSoftwarePackages('business_types');
  }

  List<CountryModel> countriesList = [];

  fetchSupabaseApiTableDataLinkedToSoftwarePackages(String tableName) async {
    try {
      switch (tableName) {
        case 'countries':
          countriesList =
              await FetchSupabaseRepository.fetchsupaBaseTablesDataLink<
                  CountryModel>(tableName, fromJson: CountryModel.fromJson);
          update();

          break;
        case 'business_types':
          bussinessTypeList = await FetchSupabaseRepository
              .fetchsupaBaseTablesDataLink<BussinessTypeModel>(tableName,
                  fromJson: BussinessTypeModel.fromJson);
          update();

          break;
        case 'business_category':
          businessCategoryList = await FetchSupabaseRepository
              .fetchsupaBaseTablesDataLink<BussinessCategoryModel>(tableName,
                  fromJson: BussinessCategoryModel.fromJson);
          update();

          break;
      }
    } catch (e) {
      return [];
    }
  }

  setbusineesList(List<String> list) {
    bussinessList = list;
    update();
  }

  List<String> bussinessList = [];
  List<BussinessTypeModel> bussinessTypeList = [];
  List<BussinessCategoryModel> businessCategoryList = [];
  List<BussinessTypeModel> filterbussinessTypeList = [];
  setfilterBusinessList(String id) {
    filterbussinessTypeList = bussinessTypeList
        .where((element) => element.business_category_id.toString() == id)
        .toList();
    update();
  }

  //////////////////////////////////////////////////////////////////
  void onHover(int? index) {
    if (index != null) {
      _hoverTimer?.cancel();
      _hoverTimer = Timer(const Duration(milliseconds: 500), () {
        _hoverTimer?.cancel();
        hoveredIndex = index;
        update();
      });
    } else {
      _hoverTimer?.cancel();
      hoveredIndex = index;
      update();
    }
  }

  double getLeftPosition(int index) {
    if (hoveredIndex == null || hoveredIndex != index) {
      return 0;
    }
    return -50;
  }

  double getRightPosition(int index) {
    if (hoveredIndex == null || hoveredIndex != index) {
      return 0;
    }
    if (index % 5 == 4) {
      return 0;
    }
    return -20;
  }

  int? hoveredIndex;
  Timer? _hoverTimer;

  var isLoading = false;
  var alpha2Code;
  var location;

  XFile? image;
  var merchantId = 0;
  var logoUrl = '';
  var isLoggingIn = false;
  bool isPasswordVisible = false;
  bool hasError = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var pageNumberShown = 0;
  var selectedLocation = 0;
  var businessTypeId = 0;
  var businessCategoryId = 0;
  final count = 0;
  final locationId = 0;
  var selectedType = '';
  var selectedBrand = '';
  final posThemeId = '';
  final deviceTypeId = '';
  final deviceId = '';
  final deviceName = '';
  final deviceOs = '';
  final deviceOsId = '';
  final ipAddressData = '';
  int categoryId = 0;

  setBusinessCategoryId(int id) {
    businessCategoryId = id;
    update();
  }

  Future<void> chooseImage() async {
    final ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      File file = File(image!.path);
      String fileName = image!.name;
      String bucketName = "locations";
      await supbaseClient.storage.from(bucketName).upload(fileName, file);
      logoUrl = supbaseClient.storage.from(bucketName).getPublicUrl(fileName);
      update();
    } else {}
  }

  Future<String> uploadImage(var image) async {
    try {
      if (image != null) {
        String fileName = 'image_${DateTime.now().millisecondsSinceEpoch}.jpg';
        if (image is Uint8List) {
          String filePath = 'phones_images/$fileName';
          await supbaseClient.storage
              .from('mobiles')
              .uploadBinary(filePath, image);
          String imageurl =
              'https://hnyyuaeeasyhuytscoxk.supabase.co/storage/v1/object/public/mobiles/phones_images/$fileName';

          return imageurl;
        } else {
          await supbaseClient.storage
              .from('mobiles')
              .upload('/phones_images/$fileName', image);
          String imageurl =
              'https://hnyyuaeeasyhuytscoxk.supabase.co/storage/v1/object/public/mobiles/phones_images/$fileName';

          return imageurl;
        }
      } else {
        return "";
      }
    } on TimeoutException catch (e) {
      print("Timeout Error: $e");
      return "";
    } on SocketException catch (e) {
      print("Internet Connection Error: $e");
      return ""; // Handle connection errors
    } on Exception catch (e) {
      print("Unknown Error: $e");
      return ""; // Handle any other errors
    } finally {
      update();
    }
  }

  setLocationModel(LocationModel data) {
    location = data;
    update();
  }

  setBusinessTypeId(int id) {
    businessTypeId = id;
    update();
  }

  setbusinessCategoryId(int value) {
    categoryId = value;
    update();
  }

  bool isLocationAdding = false;
  setisLocationAdding() {
    isLocationAdding = !isLocationAdding;
    update();
  }

  Future<void> insertLocationSupabase(
      MobilePhonesModel locationModel, BuildContext context,
      {Place? place}) async {
    try {
      isLoading = true;
      setlocationAddingerror('');
      await insertLocationSupabasesService(locationModel);
      isLoading = false;
    } catch (e) {
      setlocationAddingerror(e.toString());
      isLoading = false;
    }
  }

  String locationAddingerror = '';
  setlocationAddingerror(String error) {
    locationAddingerror = error;
    update();
  }

  var street = '';
  var city = '';

  Future<List<BussinessTypeModel>> getAllBusinessTypes(int id) async {
    final location = await supbaseClient
        .from('business_types')
        .select()
        .eq('business_category_id', id);
    return location.map((e) => BussinessTypeModel.fromJson(e)).toList();
  }

  Future<List<BussinessCategoryModel>> getAllbusinessCategory() async {
    try {
      final response = await supbaseClient.from('business_category').select();
      return response.map((e) => BussinessCategoryModel.fromJson(e)).toList();
    } catch (e) {
      if (kDebugMode) {
        print('Error in getting business category $e');
      }
      return [];
    }
  }

  Future<void> createLocation(LocationModel locationData) async {
    await supbaseClient.from('locations').insert(locationData.toJson());
  }

  Future<List<CountryModel>> getAllCountries() async {
    final location = await supbaseClient.from('countries').select();
    return location.map((e) => CountryModel.fromJson(e)).toList();
  }

  // insert a new location
  Future<void> insertLocationSupabasesService(
    MobilePhonesModel data,
  ) async {
    Map<String, dynamic> jsonData = data.toJson();

    // jsonData.remove('id');
    try {
      await supbaseClient.from('phones_models').insert(jsonData);
    } catch (e) {
      rethrow;
    }
  }
}

class FetchSupabaseRepository {
  static Future fetchsupaBaseTablesDataLink<T>(String tablename,
      {BuildContext? contexts,
      T Function(Map<String, dynamic>)? fromJson,
      Map<String, dynamic>? eq,
      bool? delete,
      Map<String, dynamic>? updateValues}) async {
    try {
      final builder = supbaseClient.from(tablename).select();
      if (delete == true) {
        await _deleteRecords(tablename, eq, contexts!);
        return [];
      }

      if (updateValues != null) {
        await _updateRecords(tablename, eq, updateValues);
        return [];
      }

      if (eq != null) {
        for (var entry in eq.entries) {
          builder.eq(entry.key, entry.value);
        }
      }

      final response = await builder.select();
      List finalresponse;
      if (fromJson == null) {
        finalresponse = response as List;
      } else {
        finalresponse = (response as List).map((e) => fromJson(e)).toList();
      }

      if (response.isNotEmpty) {
        if (finalresponse.isNotEmpty) {
          return finalresponse;
        } else {
          return [];
        }
      } else {
        return 'nodata';
      }
    } catch (e) {
      String errorMessage = extractErrorMessage(e.toString());
      print(errorMessage);
    }
  }

  static Future<void> _deleteRecords(
    String tablename,
    Map<String, dynamic>? eq,
    BuildContext contexts,
  ) async {
    try {
      final deleteBuilder = supbaseClient.from(tablename).delete();

      if (eq != null) {
        for (var entry in eq.entries) {
          deleteBuilder.eq(entry.key, entry.value);
        }
      }

      await deleteBuilder.select();
    } catch (e) {
      String errorMessage = extractErrorMessage(e.toString());
      showErrorDialog(contexts, errorMessage);
    }
  }

  static Future<void> _updateRecords(
    String tablename,
    Map<String, dynamic>? eq,
    Map<String, dynamic> updateValues,
  ) async {
    try {
      final updateBuilder = supbaseClient.from(tablename).update(updateValues);

      if (eq != null) {
        for (var entry in eq.entries) {
          updateBuilder.eq(entry.key, entry.value);
        }
      }

      await updateBuilder.select();
    } catch (e) {
      String errorMessage = extractErrorMessage(e.toString());
      print(errorMessage);
    }
  }
}

String extractErrorMessage(String errorString) {
  int startIndex = errorString.indexOf('message: ') + 'message: '.length;
  int endIndex = errorString.indexOf(', code:');

  String errorMessage = errorString.substring(startIndex, endIndex).trim();

  return errorMessage;
}

void showErrorDialog(BuildContext context, String errorMessage) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Error'),
        content: Text(errorMessage),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
