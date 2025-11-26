// DI
import 'package:get_it/get_it.dart';
// TimerUp
import 'package:timer_up/core/di/di_module.dart';
import 'package:timer_up/core/routing/router_service.dart';

final class RouterDIModule implements IDIModule {
  @override
  void register(GetIt getIt) {
    getIt.registerSingleton<RouterService>(RouterService());
  }
}
