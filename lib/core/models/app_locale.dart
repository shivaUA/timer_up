// Flutter & Dart
import 'dart:ui';

class AppLocale extends Locale {
  final String name;
  final bool isDefault;

  const AppLocale(this.name, this.isDefault, super.languageCode, [super._countryCode]);
}
