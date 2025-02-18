import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:partner_hub/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class AppService extends GetxService {
  // FIELDS //
  //////////////////////////////////////////////////////////////////////////////
  late final SupabaseClient _supabaseClient;

  late final Stream<List<ConnectivityResult>> _connectivityResultStream;
  late final SharedPreferences _sharedPreferences;

  // LIFE-CYCLE HOOKS //
  //////////////////////////////////////////////////////////////////////////////
  Future<AppService> init() async {
    await _init();
    return this;
  }

  // LIFE-CYCLE METHODS //
  //////////////////////////////////////////////////////////////////////////////
  Future<void> _init() async {
    // Initialize fields

    try {
      await Supabase.initialize(
          realtimeClientOptions:
              const RealtimeClientOptions(logLevel: RealtimeLogLevel.info),
          url: currentEnv.supabaseUrl,
          anonKey: currentEnv.supabaseAnon);
      _supabaseClient = Supabase.instance.client;
      // _supabaseClient.auth.signOut();

      _connectivityResultStream =
          Connectivity().onConnectivityChanged.asBroadcastStream();

      _sharedPreferences = await SharedPreferences.getInstance();
    } on Exception catch (e) {
      // TODO
      print(e);
    }
  }

  // GETTERS
  //////////////////////////////////////////////////////////////////////////////
  SupabaseClient get supabaseClient {
    return _supabaseClient;
  }

  Stream<List<ConnectivityResult>> get connectivityResultStream {
    return _connectivityResultStream;
  }

  SharedPreferences get sharedPreferences {
    return _sharedPreferences;
  }
}
