// TimerUp
import 'package:timer_up/core/localization/app_locale.dart';
import 'package:timer_up/core/settings/time_format.dart';
import 'package:timer_up/themes/theme_type.dart';

final class SettingsModel {
  final ThemeType theme;
  final TimeFormat timeFormat;
  final AppLocale? language;
  final bool startWithOS;
  final bool showNotifications;

  SettingsModel({
    required this.theme,
    required this.timeFormat,
    required this.language,
    required this.startWithOS,
    required this.showNotifications,
  });
}
