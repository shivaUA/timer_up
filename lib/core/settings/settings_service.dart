// Flutter & Dart
import 'dart:io';
// Packages
import 'package:launch_at_startup/launch_at_startup.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
//Localization
import 'package:timer_up/core/localization/app_locale.dart';
import 'package:timer_up/core/localization/localization_service.dart';
// TimerUp
import 'package:timer_up/core/di/di.dart';
import 'package:timer_up/core/events/streamer.dart';
import 'package:timer_up/core/settings/settings_change_args.dart';
import 'package:timer_up/core/settings/settings_model.dart';
import 'package:timer_up/core/settings/time_format.dart';
import 'package:timer_up/core/storage/shared_preferences_service.dart';
import 'package:timer_up/themes/theme_type.dart';

final class SettingsService {
  static final Streamer<SettingsChangeArgs> _streamer = Streamer<SettingsChangeArgs>();

  final String _themeKey = "settings_theme";
  final String _timeFormatKey = "settings_timeFormat";
  final String _languageKey = "settings_language";
  final String _showNotificationsKey = "settings_showNotifications";

  Future<SettingsModel> loadSettings() async {
    var sp = resolve<SharedPreferencesService>();

    return SettingsModel(
      theme: _getTheme(sp),
      timeFormat: _getTimeFormat(sp),
      language: _getLanguage(sp.instance),
      startWithOS: await launchAtStartup.isEnabled(),
      showNotifications: _getShowNotifications(sp.instance),
    );
  }

  ThemeType getTheme() {
    var sp = resolve<SharedPreferencesService>();

    return _getTheme(sp);
  }

  Future<TimeFormat> getTimeFormat() async {
    var sp = resolve<SharedPreferencesService>();

    return _getTimeFormat(sp);
  }

  AppLocale? getLanguage() {
    var sp = resolve<SharedPreferencesService>().instance;

    return _getLanguage(sp);
  }

  Future<void> setTheme(ThemeType theme) async {
    var sp = resolve<SharedPreferencesService>();
    var current = _getTheme(sp);

    await sp.setThemeType(_themeKey, theme);

    if (current != theme) {
      _streamer.stream(SettingsChangeArgs.theme(theme));
    }
  }

  Future<void> setTimeFormat(TimeFormat format) async {
    var sp = resolve<SharedPreferencesService>();
    var current = _getTimeFormat(sp);

    await sp.setTimeFormat(_timeFormatKey, format);

    if (current != format) {
      _streamer.stream(SettingsChangeArgs.timeFormat(format));
    }
  }

  Future<void> setLanguage(AppLocale? locale) async {
    var sp = resolve<SharedPreferencesService>().instance;
    var current = _getLanguage(sp);

    if (locale?.countryCode == null) {
      await sp.remove(_languageKey);
    } else {
      await sp.setString(_languageKey, locale!.countryCode!);
    }

    if (current != locale) {
      _streamer.stream(SettingsChangeArgs.language(locale));
    }
  }

  Future<void> setShowNotifications(bool show) async {
    var sp = resolve<SharedPreferencesService>().instance;
    var current = _getShowNotifications(sp);

    sp.setBool(_showNotificationsKey, show);

    if (current != show) {
      _streamer.stream(SettingsChangeArgs.showNotifications(show));
    }
  }

  Future<void> setStartWithOS(bool start) async {
    var enabled = await launchAtStartup.isEnabled();

    if (start && !enabled) {
      launchAtStartup.enable();
    } else if (!start && enabled) {
      launchAtStartup.disable();
    } else {
      return;
    }

    _streamer.stream(SettingsChangeArgs.startWithOS(start));
  }

  ThemeType _getTheme(SharedPreferencesService service) =>
      service.getThemeType(_themeKey) ?? ThemeType.dark;

  TimeFormat _getTimeFormat(SharedPreferencesService service) =>
      service.getTimeFormat(_themeKey) ?? TimeFormat.h24;

  AppLocale? _getLanguage(SharedPreferences prefs) {
    var loc = prefs.getString(_languageKey)?.toUpperCase();

    return loc == null
        ? null
        : LocalizationService.locales.where((x) => x.countryCode?.toUpperCase() == loc).firstOrNull;
  }

  bool _getShowNotifications(SharedPreferences prefs) {
    return prefs.getBool(_showNotificationsKey) ?? true;
  }

  static Future<void> setupStartupLaunch() async {
    var packageInfo = await PackageInfo.fromPlatform();

    launchAtStartup.setup(
      appName: packageInfo.appName,
      appPath: Platform.resolvedExecutable,
      // Set packageName parameter to support MSIX.
      packageName: 'bielikan.apps.timer_up',
      // TODO: change package name to a proper one
    );
  }

  static void onSettingsChange(Future<void> Function(SettingsChangeArgs args) method) {
    _streamer.subscribe(method);
  }

  static void cancelOnSettingsChange(Future<void> Function(SettingsChangeArgs args) method) {
    _streamer.unsubscribe(method);
  }
}
