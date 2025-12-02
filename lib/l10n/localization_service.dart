// Flutter & Dart
import 'dart:async';
import 'dart:ui';

import 'package:flutter/widgets.dart';
// i10n
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:timer_up/l10n/locale_change_args.dart';
import 'package:timer_up/l10n/generated/common/common_localizations.dart';
import 'package:timer_up/l10n/generated/system/system_localizations.dart';
// TimerUp
import 'package:timer_up/core/di/di.dart';
import 'package:timer_up/core/idisposable.dart';
import 'package:timer_up/core/events/streamer.dart';
import 'package:timer_up/core/models/app_locale.dart';
import 'package:timer_up/core/routing/router_service.dart';

class LocalizationService implements IDisposable {
  late final Streamer<LocaleChangeArgs> _streamer;

  final List<AppLocale> locales = const [
    AppLocale("English", true, "en", "en-US"),
    AppLocale("Deutsch", false, "de", "de-DE"),
  ];

  final String defaultLocaleCountryCode = "en-US";

  late AppLocale currentLocale;

  LocalizationService() {
    // TODO: implement shared preferences and load previously selected culture
    // var prefs = SharedPreferencesProvider.instance;
    // var culture = prefs.getString("selCulture") ?? _defaultCultureCode;

    final locale = PlatformDispatcher.instance.locale;

    _streamer = Streamer<LocaleChangeArgs>();

    currentLocale =
        _getLocaleByCountryCode(locale.countryCode ?? defaultLocaleCountryCode) ?? defaultLocale;
  }

  Iterable<LocalizationsDelegate<dynamic>> get localizationDelegates {
    return [
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      CommonLocalizations.delegate,
      SystemLocalizations.delegate,
    ];
  }

  AppLocale get defaultLocale => _getLocaleByCountryCode(defaultLocaleCountryCode)!;

  CommonLocalizations get commonLocalizations {
    var navigatorKey = resolve<RouterService>().navigatorKey;
    return CommonLocalizations.of(navigatorKey.currentContext!)!;
  }

  SystemLocalizations get systemLocalizations {
    var navigatorKey = resolve<RouterService>().navigatorKey;
    return SystemLocalizations.of(navigatorKey.currentContext!)!;
  }

  void changeLocale(AppLocale locale) {
    if (currentLocale.countryCode == locale.countryCode) {
      return;
    }

    currentLocale = locale;

    _streamer.stream(LocaleChangeArgs(currentLocale, defaultLocale));
  }

  AppLocale? _getLocaleByCountryCode(String countryCode) {
    return locales
        .where((e) => e.countryCode!.toUpperCase() == countryCode.toUpperCase())
        .firstOrNull;
  }

  void onLocaleChange(Future<void> Function(LocaleChangeArgs args) method) {
    _streamer.subscribe(method);
  }

  void cancelOnLocaleChange(Future<void> Function(LocaleChangeArgs args) method) {
    _streamer.unsubscribe(method);
  }

  @override
  Future<void> dispose() async {
    await _streamer.dispose();
  }
}
