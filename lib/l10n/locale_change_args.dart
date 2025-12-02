// TimerUp
import 'package:timer_up/core/models/app_locale.dart';

class LocaleChangeArgs {
  final AppLocale locale;
  final AppLocale defaultLocale;

  LocaleChangeArgs(this.locale, this.defaultLocale);
}
