// TimerUp
import 'package:timer_up/core/localization/app_locale.dart';
import 'package:timer_up/core/settings/time_format.dart';
import 'package:timer_up/themes/theme_type.dart';

final class SettingsChangeArgs {
  final bool themeChanged;
  final ThemeType theme;

  final bool timeFormatChanged;
  final TimeFormat timeFormat;

  final bool languageChanged;
  final AppLocale? language;

  final bool startWithOSChanged;
  final bool startWithOS;

  final bool showNotificationsChanged;
  final bool showNotifications;

  SettingsChangeArgs({
    this.themeChanged = false,
    this.theme = ThemeType.dark,

    this.timeFormatChanged = false,
    this.timeFormat = TimeFormat.h24,

    this.languageChanged = false,
    this.language,

    this.startWithOSChanged = false,
    this.startWithOS = false,

    this.showNotificationsChanged = false,
    this.showNotifications = false,
  });

  factory SettingsChangeArgs.theme(ThemeType theme) =>
      SettingsChangeArgs(theme: theme, themeChanged: true);

  factory SettingsChangeArgs.timeFormat(TimeFormat format) =>
      SettingsChangeArgs(timeFormat: format, timeFormatChanged: true);

  factory SettingsChangeArgs.language(AppLocale? locale) =>
      SettingsChangeArgs(language: locale, languageChanged: true);

  factory SettingsChangeArgs.startWithOS(bool autostart) =>
      SettingsChangeArgs(startWithOS: autostart, startWithOSChanged: true);

  factory SettingsChangeArgs.showNotifications(bool show) =>
      SettingsChangeArgs(showNotifications: show, showNotificationsChanged: true);
}
