// Flutter & Dart
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
// Package & Window
import 'package:window_size/window_size.dart';
// Localization
import 'package:flutter_localizations/flutter_localizations.dart';
// TimerUp
import 'package:timer_up/core/di/di.dart';
import 'package:timer_up/core/routing/router_service.dart';
import 'package:timer_up/l10n/generated/common/common_localizations.dart';
import 'package:timer_up/l10n/generated/system/system_localizations.dart';
import 'package:timer_up/themes/theme_type.dart';
import 'package:timer_up/themes/themes.dart';
import 'package:timer_up/core/models/app_locale.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    //var packageInfo = await PackageInfo.fromPlatform();

    //setWindowTitle(packageInfo.appName);
    setWindowMinSize(const Size(500, 300));
  }

  // Register the DI modules
  DI.init();

  runApp(TimerUpApp(key: TimerUpApp._appKey));
}

class TimerUpApp extends StatefulWidget {
  static final GlobalKey<_TimerUpAppState> _appKey = GlobalKey<_TimerUpAppState>();

  const TimerUpApp({super.key});

  static AppLocale get selectedLocale => _appKey.currentState!.selectedLocale;

  static set selectedLocale(AppLocale locale) {
    _appKey.currentState!.setLocale(locale);
  }

  static List<AppLocale> get locales => _appKey.currentState!.locales;

  @override
  State<TimerUpApp> createState() => _TimerUpAppState();
}

class _TimerUpAppState extends State<TimerUpApp> {
  final List<AppLocale> locales = const [
    AppLocale("English", "en", "en-US"),
    AppLocale("Deutsch", "de", "de-DE"),
  ];

  static const String _defaultCultureCode = "EN-US";

  late AppLocale selectedLocale;

  @override
  void initState() {
    super.initState();

    // TODO: implement shared preferences and load previously selected culture
    // var prefs = SharedPreferencesProvider.instance;
    // var culture = prefs.getString("selCulture") ?? _defaultCultureCode;

    // Locale from the device
    final locale = PlatformDispatcher.instance.locale;

    var culture = locale.countryCode?.toUpperCase() ?? _defaultCultureCode;

    selectedLocale =
        locales.where((e) => e.countryCode!.toUpperCase() == culture).firstOrNull ??
        locales.where((e) => e.countryCode!.toUpperCase() == _defaultCultureCode).first;
  }

  Future<void> setLocale(AppLocale locale) async {
    if (locale.countryCode == selectedLocale.countryCode ||
        !locales.any((x) => x.countryCode == locale.countryCode)) {
      return;
    }

    setState(() {
      selectedLocale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    final rs = resolve<RouterService>();

    var themeData = AppTheme.combine(ThemeType.dark);

    return AppThemeContainer(
      themeData: themeData,
      child: MaterialApp.router(
        routerConfig: rs.router,
        supportedLocales: locales,
        locale: selectedLocale,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          SystemLocalizations.delegate,
          CommonLocalizations.delegate,
        ],
        scaffoldMessengerKey: rs.scaffoldKey,
        theme: themeData.theme,
        title: 'TimerUp',
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
