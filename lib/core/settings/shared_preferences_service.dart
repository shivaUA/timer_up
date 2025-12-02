import 'package:shared_preferences/shared_preferences.dart';

final class SharedPreferencesService {
  late SharedPreferences _instance;

  SharedPreferences get instance => _instance;

  SharedPreferencesService._();

  static Future<SharedPreferencesService> create() async {
    var res = SharedPreferencesService._();
    res._init();

    return res;
  }

  Future<void> _init() async {
    _instance = await SharedPreferences.getInstance();
  }
}
