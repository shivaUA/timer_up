// Flutter & Dart
import 'dart:ui';

class AppLocale extends Locale {
  final String name;

  const AppLocale(this.name, super.languageCode, [super._countryCode]);
}
