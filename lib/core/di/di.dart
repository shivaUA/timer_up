// DI
import 'package:get_it/get_it.dart';
// TimerUp
import 'package:timer_up/core/routing/router_service.dart';
import 'package:timer_up/core/settings/shared_preferences_service.dart';
import 'package:timer_up/features/tray/tray_service.dart';
import 'package:timer_up/l10n/localization_service.dart';

final class DI {
  static GetIt getIt = GetIt.instance;

  static void init() {
    getIt.registerSingleton<RouterService>(RouterService());

    getIt.registerSingleton<LocalizationService>(LocalizationService());

    getIt.registerLazySingleton<TrayService>(TrayService.new);

    getIt.registerLazySingletonAsync(SharedPreferencesService.create);
  }
}

S resolve<S extends Object>() => GetIt.instance.get<S>();
