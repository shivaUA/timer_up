// Flutter & Dart
import 'package:flutter/material.dart';
// Window
//import 'package:window_manager/window_manager.dart';
// TimerUp
import 'package:timer_up/core/di/di.dart';
import 'package:timer_up/core/routing/router_service.dart';
import 'package:timer_up/themes/theme_type.dart';
import 'package:timer_up/themes/themes.dart';
import 'package:timer_up/core/models/app_locale.dart';
import 'package:timer_up/features/tray/tray_service.dart';
import 'package:timer_up/l10n/localization_service.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();

  //await windowManager.ensureInitialized();

  //if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
  //var packageInfo = await PackageInfo.fromPlatform();

  //setWindowTitle(packageInfo.appName);
  //setWindowMinSize(const Size(500, 300));
  //}

  // var windowOptions = WindowOptions(
  //   alwaysOnTop: true,
  //   fullScreen: true,
  //   skipTaskbar: true,
  //   backgroundColor: Colors.transparent,
  //   titleBarStyle: TitleBarStyle.hidden,
  // );

  // windowManager.waitUntilReadyToShow(windowOptions, () async {
  //   // var screens = await getScreenList();
  //   // windowManager.setBounds(screens.last.frame);

  //   await windowManager.show();
  //   await windowManager.focus();
  // });

  // Register the DI modules
  DI.init();

  runApp(TimerUpApp(key: TimerUpApp._appKey));
}

class TimerUpApp extends StatefulWidget {
  static final GlobalKey<_TimerUpAppState> _appKey = GlobalKey<_TimerUpAppState>();

  const TimerUpApp({super.key});

  static void redraw() {
    _appKey.currentState!.redraw();
  }

  @override
  State<TimerUpApp> createState() => _TimerUpAppState();
}

class _TimerUpAppState extends State<TimerUpApp> {
  late AppLocale currentLocale;

  @override
  void initState() {
    super.initState();

    resolve<TrayService>().init();
  }

  void redraw() {
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
        supportedLocales: ls.locales,
        locale: ls.currentLocale,
        localizationsDelegates: [...ls.localizationDelegates],
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
