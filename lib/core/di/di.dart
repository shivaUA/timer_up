// DI
import 'package:get_it/get_it.dart';
// Services
import 'package:timer_up/core/routing/router_service.dart';
import 'package:timer_up/core/settings/settings_service.dart';
import 'package:timer_up/core/storage/shared_preferences_service.dart';
import 'package:timer_up/features/tray/tray_service.dart';
import 'package:timer_up/core/localization/localization_service.dart';

final class DI {
  static GetIt getIt = GetIt.instance;

  static Future<void> init() async {
    getIt.registerSingleton<SharedPreferencesService>(await SharedPreferencesService.create());

    getIt.registerLazySingleton<SettingsService>(SettingsService.new, useWeakReference: true);

    getIt.registerSingleton<RouterService>(RouterService());

    getIt.registerSingleton<LocalizationService>(LocalizationService());

    getIt.registerLazySingleton<TrayService>(TrayService.new);
  }
}

S resolve<S extends Object>() => GetIt.instance.get<S>();
