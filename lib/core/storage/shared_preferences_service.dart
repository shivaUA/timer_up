import 'package:shared_preferences/shared_preferences.dart';
import 'package:timer_up/core/settings/time_format.dart';
import 'package:timer_up/themes/theme_type.dart';

final class SharedPreferencesService {
  late SharedPreferences _instance;

  SharedPreferences get instance => _instance;

  SharedPreferencesService._();

  static Future<SharedPreferencesService> create() async {
    var res = SharedPreferencesService._();
    await res._init();

    return res;
  }

  ThemeType? getThemeType(String key) {
    var th = _instance.getInt(key);

    return th == null ? null : ThemeType.values.where((x) => x.value == th).firstOrNull;
  }

  TimeFormat? getTimeFormat(String key) {
    var tf = _instance.getInt(key);

    return tf == null ? null : TimeFormat.values.where((x) => x.value == tf).firstOrNull;
  }

  Future<void> setThemeType(String key, ThemeType themeType) async {
    await _instance.setInt(key, themeType.value);
  }

  Future<void> setTimeFormat(String key, TimeFormat format) async {
    await _instance.setInt(key, format.value);
  }

  Future<void> _init() async {
    _instance = await SharedPreferences.getInstance();
  }
}
