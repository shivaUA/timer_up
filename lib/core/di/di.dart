// DI
import 'package:get_it/get_it.dart';
// TimerUp
import 'package:timer_up/core/di/di_module.dart';
import 'package:timer_up/core/di/modules/router_module.dart';
import 'package:timer_up/core/di/modules/tray_module.dart';

final class DI {
  static GetIt getIt = GetIt.instance;

  static final List<IDIModule Function()> _modules = [RouterDIModule.new, TrayDIModule.new];

  static void init() {
    for (var element in _modules) {
      element().register(getIt);
    }
  }

  static T get<T extends Object>() => getIt.get<T>();
}

S resolve<S extends Object>() => DI.get<S>();
