// Flutter & Dart
import 'package:flutter/widgets.dart';
// i10n
import 'package:flutter_localizations/flutter_localizations.dart';
// TimerUp
import 'package:timer_up/l10n/generated/common/common_localizations.dart';
import 'package:timer_up/l10n/generated/system/system_localizations.dart';

class LangUtils {
  static Iterable<LocalizationsDelegate<dynamic>> get localizationDelegates{
    return [
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      CommonLocalizations.delegate,
      SystemLocalizations.delegate,
    ];
  }
}