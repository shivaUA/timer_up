// Flutter & Dart
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
// i10n
import 'package:timer_up/core/localization/app_locale.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:timer_up/l10n/generated/common/common_localizations.dart';
import 'package:timer_up/l10n/generated/core/core_localizations.dart';
// TimerUp
import 'package:timer_up/core/di/di.dart';
import 'package:timer_up/core/idisposable.dart';
import 'package:timer_up/core/events/streamer.dart';
import 'package:timer_up/core/routing/router_service.dart';
import 'package:timer_up/core/settings/settings_service.dart';

class LocalizationService implements IDisposable {
  late final Streamer<AppLocale> _streamer;

  static final List<AppLocale> locales = const [
    AppLocale("English", true, "en", "en-US"),
    AppLocale("Українська", false, "uk", "uk-UA"),
  ];

  static final String _defaultLocaleCountryCode = "en-US";

  late AppLocale currentLocale;

  LocalizationService() {
    final setService = resolve<SettingsService>();
    final locale = setService.getLanguage();

    _streamer = Streamer<AppLocale>();

    currentLocale =
        _getLocaleByCountryCode(locale?.countryCode ?? _defaultLocaleCountryCode) ?? defaultLocale;
  }

  static Iterable<LocalizationsDelegate<dynamic>> get localizationDelegates {
    return [
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      CommonLocalizations.delegate,
      CoreLocalizations.delegate,
    ];
  }

  static AppLocale get defaultLocale => _getLocaleByCountryCode(_defaultLocaleCountryCode)!;

  static AppLocale? get _systemLocale =>
      _getLocaleByCountryCode(PlatformDispatcher.instance.locale.countryCode ?? "---");

  CommonLocalizations get commonLocalizations {
    var navigatorKey = resolve<RouterService>().navigatorKey;
    return CommonLocalizations.of(navigatorKey.currentContext!)!;
  }

  CoreLocalizations get coreLocalizations {
    var navigatorKey = resolve<RouterService>().navigatorKey;
    return CoreLocalizations.of(navigatorKey.currentContext!)!;
  }

  void changeLocale(AppLocale? locale) {
    var realLocale = locale ?? _systemLocale ?? defaultLocale;

    if (currentLocale.countryCode == realLocale.countryCode) {
      return;
    }

    currentLocale = realLocale;

    _streamer.stream(currentLocale);
  }

  static AppLocale? _getLocaleByCountryCode(String countryCode) {
    return locales
        .where((e) => e.countryCode!.toUpperCase() == countryCode.toUpperCase())
        .firstOrNull;
  }

  void onLocaleChange(Future<void> Function(AppLocale args) method) {
    _streamer.subscribe(method);
  }

  void cancelOnLocaleChange(Future<void> Function(AppLocale args) method) {
    _streamer.unsubscribe(method);
  }

  @override
  Future<void> dispose() async {
    await _streamer.dispose();
  }
}
