// Flutter & Dart
import 'package:flutter/material.dart';
// i10n
import 'package:timer_up/core/localization/localization_service.dart';
// TimerUp
import 'package:timer_up/core/di/di.dart';
import 'package:timer_up/core/localization/app_locale.dart';
import 'package:timer_up/core/routing/router_service.dart';
import 'package:timer_up/core/settings/settings_service.dart';
import 'package:timer_up/features/tray/tray_service.dart';
import 'package:timer_up/themes/theme_type.dart';
import 'package:timer_up/themes/themes.dart';

class TimerUpApp extends StatefulWidget {
  const TimerUpApp({super.key});

  @override
  State<TimerUpApp> createState() => _TimerUpAppState();
}

class _TimerUpAppState extends State<TimerUpApp> {
  late AppLocale currentLocale;

  @override
  void initState() {
    super.initState();

    SettingsService.setupStartupLaunch();

    resolve<TrayService>().init();
    resolve<LocalizationService>().onLocaleChange(_onLocaleChange);
  }

  Future<void> _onLocaleChange(_) async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final rs = resolve<RouterService>();
    final ls = resolve<LocalizationService>();

    var themeData = AppTheme.combine(ThemeType.dark);

    return AppThemeContainer(
      themeData: themeData,
      child: MaterialApp.router(
        routerConfig: rs.router,
        supportedLocales: LocalizationService.locales,
        locale: ls.currentLocale,
        localizationsDelegates: [...LocalizationService.localizationDelegates],
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
    resolve<LocalizationService>().cancelOnLocaleChange(_onLocaleChange);

    super.dispose();
  }
}
