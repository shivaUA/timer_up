// DI
import 'package:get_it/get_it.dart';
// TimerUp
import 'package:timer_up/core/di/di_module.dart';
import 'package:timer_up/features/tray/tray_service.dart';

final class TrayDIModule implements IDIModule {
  @override
  void register(GetIt getIt) {
    getIt.registerSingleton<TrayService>(TrayService());
  }
}
