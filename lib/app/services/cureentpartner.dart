import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instance = UserPreferences._internal();
  late String _userId;

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._internal();

  Future<void> init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _userId = prefs.getString('currentuser') ?? '';
  }

  String get userId => _userId;
}
// can you cop