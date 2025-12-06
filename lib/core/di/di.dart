// DI
import 'package:get_it/get_it.dart';
// Services
import 'package:timer_up/core/settings/settings_service.dart';
import 'package:timer_up/core/storage/shared_preferences_service.dart';
import 'package:timer_up/core/localization/localization_service.dart';

abstract base class DI {
  Future<GetIt> register() async {
    final getIt = GetIt.instance;

    getIt.registerSingleton<SharedPreferencesService>(await SharedPreferencesService.create());

    getIt.registerLazySingleton<SettingsService>(SettingsService.new, useWeakReference: true);

    getIt.registerSingleton<LocalizationService>(LocalizationService());

    return getIt;
  }
}

S resolve<S extends Object>() => GetIt.I.get<S>();
