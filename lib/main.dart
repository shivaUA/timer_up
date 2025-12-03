// Flutter & Dart
import 'package:flutter/material.dart';
// TimerUp
import 'package:timer_up/core/di/di.dart';
import 'package:timer_up/timer_up_app.dart';

Future<void> main(List<String> args) async {
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

  // TODO: implement a functionality for opening proper window specified in args
  // probably no DI needed for some windows (except localizations, settings and shared preferences)
  // or some other stuff is needed for others

  // Register the DI modules
  await DI.init();

  runApp(TimerUpApp());
}
