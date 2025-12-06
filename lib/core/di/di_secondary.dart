// DI
import 'package:get_it/get_it.dart';
// TimerUp
import 'package:timer_up/core/di/di.dart';

final class DISecondary extends DI {
  @override
  Future<GetIt> register() async {
    return await super.register();
  }
}
