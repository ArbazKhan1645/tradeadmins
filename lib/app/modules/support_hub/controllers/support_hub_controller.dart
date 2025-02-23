// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:partner_hub/app/modules/Home/services/current_user_service.dart';
import 'package:partner_hub/app/services/supabase_fetch.dart';
import '../../../models/models/brands_model.dart';
import '../../../models/models/mobile_phones_model.dart';
import '../../../models/models/types_model.dart';

class SupportHubController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxBool peoplesIsGrid = true.obs;
  setPeoplesIsGrid() {
    peoplesIsGrid.value = !peoplesIsGrid.value;
    update();
  }

  List<Widget> getDashboardViewBodyScreen = [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
      ],
    ),
  ];

  //
  TextEditingController searchLocationController = TextEditingController();
  TextEditingController searchTerminalController = TextEditingController();
  final UserController _userController = Get.put(UserController());
  List<MobilePhonesModel> merchantsLocations = [];
  List<MobilePhonesModel> selectedMerchantLocations = [];
  List<MobilePhonesModel> filterselectedMerchantLocations = [];

  MobilePhonesModel? selectedLocation;
  bool loadingTerminals = false;
  bool loadingAllData = false;

  setLoadingAllData(bool val) {
    loadingAllData = val;
    update();
  }

  setLoadingTerminal(bool val) {
    loadingTerminals = val;
    update();
  }

  setloadingTerminals(bool val) {
    loadingTerminals = val;
    update();
  }

  void filterLocations(String val) {
    filterselectedMerchantLocations =
        selectedMerchantLocations.where((element) {
      final businessNameMatch =
          element.name.toString().toLowerCase().contains(val.toLowerCase());
      final locationIdMatch = element.brandName
          .toString()
          .trim()
          .toLowerCase()
          .contains(val.trim().toLowerCase());

      return businessNameMatch || locationIdMatch;
    }).toList();
    update();
  }

  watchPartnerMerchantLocations() async {
    try {
      await fetchTablesData('locations');

      selectedMerchantLocations.clear();
      selectedMerchantLocations.assignAll(merchantsLocations);
      filterselectedMerchantLocations = selectedMerchantLocations;
      filterselectedMerchantLocations.sort((a, b) {
        DateTime? dateA = DateTime.tryParse(a.createdAt.toString());
        DateTime? dateB = DateTime.tryParse(b.createdAt.toString());

        if (dateA == null && dateB == null) return 0;
        if (dateA == null) return 1;
        if (dateB == null) return -1;

        return dateA.compareTo(dateB);
      });

      print(filterselectedMerchantLocations.length);
      update();
    } on Exception catch (e) {
      seterrorOcured('Unknown error occured:$e Please reload again the page');
    }
  }

  fetchTablesData(String tablename) async {
    try {
      var fetchlocations = await SupabaseQueryBuilder.get<MobilePhonesModel>(
          tablename: 'phones_models',
          context: Get.context!,
          fromJson: MobilePhonesModel.fromJson);
      if (fetchlocations is List<MobilePhonesModel>) {
        merchantsLocations = fetchlocations;
      } else {
        merchantsLocations = [];
      }

      print(merchantsLocations.length);
    } on Exception catch (e) {
      seterrorOcured('error fetching $tablename data:$e');
    }
  }

  @override
  void onInit() {
    initializedData();
    super.onInit();
  }

  initializedData() async {
    try {
      brandOptions.clear();
      brandsList.clear();
      typesList.clear();
      typesOptions.clear;
      print(_userController.currentUser!.id);
      await fetchAllBrands(Get.context!);
      await fetchAllTypes(Get.context!);
      await watchPartnerMerchantLocations();
    } catch (e) {
      seterrorOcured(
          'An error occurred while initializing the Controller init data: $e');
    } finally {
      seterrorOcured('');
      setLoadingAllData(true);
      update();
    }
  }

  List<BrandsModel> brandsList = [];
  List<TypesModel> typesList = [];
  Map<String, bool> brandOptions = {};
  final Map<String, bool> typesOptions = {};

  fetchAllBrands(BuildContext context) async {
    var fetchData = await SupabaseQueryBuilder.get<BrandsModel>(
        fromJson: BrandsModel.fromJson, tablename: 'brands', context: context);
    if (fetchData is List<BrandsModel>) {
      brandsList = fetchData;
      for (var e in brandsList) {
        brandOptions[e.name.toString()] = false;
      }
    } else {
      brandsList = [];
      addErrorToErrorList(
          fetchData: fetchData,
          errorType: 'Failed To Fetch Countries Data, Error : $fetchData');
    }
    refreshUpdate();
  }

  refreshUpdate() {
    update();
  }

  fetchAllTypes(BuildContext context) async {
    var fetchData = await SupabaseQueryBuilder.get<TypesModel>(
        fromJson: TypesModel.fromJson,
        tablename: 'device_types',
        context: context);
    if (fetchData is List<TypesModel>) {
      typesList = fetchData;
      for (var e in typesList) {
        typesOptions[e.name.toString()] = false;
      }
    } else {
      typesList = [];
      addErrorToErrorList(
          fetchData: fetchData,
          errorType: 'Failed To Fetch all Locations Data, Error : $fetchData');
    }
    update();
  }

  String brandName(int id) {
    var brand = brandsList.where((e) => e.id == id).firstOrNull;
    if (brand != null) {
      return brand.name.toString();
    }
    return 'N/A';
  }

  String typeName(int id) {
    var type = typesList.where((e) => e.id == id).firstOrNull;
    if (type != null) {
      return type.name.toString();
    }
    return 'N/A';
  }

  void toggleSelection(String category, String option) {
    if (category == 'Brand') {
      brandOptions[option] = !(brandOptions[option] ?? false);
    } else if (category == 'Type') {
      typesOptions[option] = !(typesOptions[option] ?? false);
    }

    filterPhoneModelsFunctio();

    update();
  }

  List<String> getSelectedOptions(String category) {
    if (category == 'Brand') {
      return brandOptions.entries
          .where((entry) => entry.value)
          .map((entry) => entry.key)
          .toList();
    } else if (category == 'Type') {
      return typesOptions.entries
          .where((entry) => entry.value)
          .map((entry) => entry.key)
          .toList();
    }
    return [];
  }

  List<Map<String, dynamic>> errorListFetchingData = [];
  void addErrorToErrorList(
      {required var fetchData, required String errorType}) {
    if (fetchData is String) {
      var existingError = errorListFetchingData
          .where((element) =>
              element.containsKey(errorType) && element[errorType] == fetchData)
          .firstOrNull;
      if (existingError != null) {
        errorListFetchingData.remove(existingError);
      }
      errorListFetchingData.add({errorType: fetchData});
    }
  }

  void filterPhoneModelsFunctio() {
    List<String> selectedBrands = getSelectedOptions('Brand');
    List<String> selectedTypes = getSelectedOptions('Type');
    filterselectedMerchantLocations.clear();

    filterselectedMerchantLocations = merchantsLocations.where((phone) {
      bool matchesBrand = selectedBrands.isEmpty ||
          selectedBrands.contains(brandName(phone.brands ?? -1));
      bool matchesType = selectedTypes.isEmpty ||
          selectedTypes.contains(typeName(phone.type ?? -1));
      return matchesBrand && matchesType;
    }).toList();

    update();
  }

  String errorOccurred = '';
  seterrorOcured(String val) {
    errorOccurred = val;
    update();
  }
}
