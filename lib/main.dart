// Flutter & Dart
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart' hide Image;
// Package & Window
import 'package:window_size/window_size.dart';
// TimerUp
import 'package:timer_up/core/di/di.dart';
import 'package:timer_up/core/routing/router_service.dart';
import 'package:timer_up/themes/theme_type.dart';
import 'package:timer_up/themes/themes.dart';
import 'package:timer_up/core/models/app_locale.dart';
import 'package:timer_up/features/tray/tray_service.dart';
import 'package:timer_up/l10n/language_utils.dart';

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
    AppLocale("English", true, "en", "en-US"),
    AppLocale("Deutsch", false, "de", "de-DE"),
  ];

  late AppLocale selectedLocale;

  @override
  void initState() {
    super.initState();

    // TODO: implement shared preferences and load previously selected culture
    // var prefs = SharedPreferencesProvider.instance;
    // var culture = prefs.getString("selCulture") ?? _defaultCultureCode;

    // Locale from the device
    final locale = PlatformDispatcher.instance.locale;

    var defaultCultureCode = locales.where((x) => x.isDefault).first.countryCode!.toUpperCase();
    var culture = locale.countryCode?.toUpperCase() ?? defaultCultureCode;

    selectedLocale =
        locales.where((e) => e.countryCode!.toUpperCase() == culture).firstOrNull ??
        locales.where((e) => e.countryCode!.toUpperCase() == defaultCultureCode).first;

    resolve<TrayService>().init();
  }

  Future<void> setLocale(AppLocale locale) async {
    if (locale.countryCode == selectedLocale.countryCode ||
        !locales.any((x) => x.countryCode == locale.countryCode)) {
      return;
    }

    setState(() {
      selectedLocale = locale;
    });

    resolve<TrayService>().updateTranslations();
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
        localizationsDelegates: [...LangUtils.localizationDelegates],
        scaffoldMessengerKey: rs.scaffoldKey,
        theme: themeData.theme,
        title: 'TimerUp',
        debugShowCheckedModeBanner: false,
      ),
    );
  }

  @override
  void dispose() {
    resolve<TrayService>().dispose();

    super.dispose();
  }
}
