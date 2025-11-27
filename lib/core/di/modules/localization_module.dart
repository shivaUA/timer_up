// DI
import 'package:get_it/get_it.dart';
// TimerUp
import 'package:timer_up/core/di/di_module.dart';
import 'package:timer_up/l10n/localization_service.dart';

final class LocalizationDIModule implements IDIModule {
  @override
  void register(GetIt getIt) {
    getIt.registerSingleton<LocalizationService>(LocalizationService());
  }
}
