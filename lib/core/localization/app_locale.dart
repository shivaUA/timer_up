// Flutter & Dart
import 'dart:ui';

/// Extended Locale class that is used everywhere in the app instead of a basic Locale one
class AppLocale extends Locale {
  /// Name of the language that will be displayed to the user
  final String name;

  /// Is it a default language or not<br />
  /// Default language is used in case system language is not supported by the app
  final bool isDefault;

  const AppLocale(this.name, this.isDefault, super.languageCode, [super._countryCode]);
}
