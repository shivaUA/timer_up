// Flutter & Dart
import 'package:flutter/material.dart';
// Window
import 'package:window_manager/window_manager.dart';
import 'package:flutter_window_close/flutter_window_close.dart';
// TimerUp
import 'package:timer_up/core/di/di.dart';
import 'package:timer_up/timer_up_app.dart';
import 'package:timer_up/core/di/di_main.dart';
import 'package:timer_up/core/di/di_secondary.dart';
import 'package:timer_up/features/tray/tray_service.dart';
import 'package:timer_up/core/settings/settings_service.dart';

Future<void> main(List<String> args) async {
  // Ensure all components are initialized
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  // Register services based on window type needed
  final di = args.isNotEmpty ? DISecondary() : DIMain();
  await di.register();

  // If main window
  if (args.isEmpty) {
    // Initialize autostart functioanlity
    await SettingsService.setupStartupLaunch();

    // Initialize tray icon and context menu
    await resolve<TrayService>().init();

    // Hide window if user closes it manually, we don't need to close it like this
    FlutterWindowClose.setWindowShouldCloseHandler(() async {
      await windowManager.hide();
      return false;
    });
  }

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

  runApp(TimerUpApp());
}
