// DI
import 'package:get_it/get_it.dart';
import 'package:timer_up/core/di/di.dart';
// Services
import 'package:timer_up/core/routing/router_service.dart';
import 'package:timer_up/features/tray/tray_service.dart';

final class DIMain extends DI {
  @override
  Future<GetIt> register() async {
    var getIt = await super.register();

    getIt.registerSingleton<RouterService>(RouterService());

    getIt.registerLazySingleton<TrayService>(TrayService.new);

    return getIt;
  }
}
