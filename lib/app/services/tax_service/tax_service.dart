import 'package:get/get.dart';
import 'package:partner_hub/app/models/tax/tax_model.dart';
import 'package:partner_hub/app/models/tax/tax_type_model.dart';

import '../app/app_service.dart';


// ignore: depend_on_referenced_packages

class TaxService extends GetxService {
  late final AppService _appService;

  // FIELDS //
  //////////////////////////////////////////////////////////////////////////////

  // LIFE-CYCLE HOOKS //
  //////////////////////////////////////////////////////////////////////////////
  Future<TaxService> init() async {
    await _init();
    return this;
  }

  // LIFE-CYCLE METHODS //
  //////////////////////////////////////////////////////////////////////////////
  Future<void> _init() async {
    _appService = Get.find<AppService>();

    // Initialize fields
  }

  // GETTERS
  //////////////////////////////////////////////////////////////////////////////
  ///
  
  Future<List<TaxModel>> getAllTax()async{
    try {
      final response = await _appService.supabaseClient
          .from('tax_table')
          .select();
      return response.map((e) => TaxModel.fromJson(e)).toList();
    } catch (e) {
      print('error fetching tax data:$e');
      return [];
    }
  }
 

 // fetch all tax type 
  Future<List<TaxTypeModel>> getAllTaxType()async{
    try {
      final response = await _appService.supabaseClient
          .from('tax_type')
          .select();
      return response.map((e) => TaxTypeModel.fromMap(e)).toList();
    } catch (e) {
      print('error fetching tax type data:$e');
      return [];
    }
  }

}
