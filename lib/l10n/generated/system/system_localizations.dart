import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'system_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of SystemLocalizations
/// returned by `SystemLocalizations.of(context)`.
///
/// Applications need to include `SystemLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'system/system_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: SystemLocalizations.localizationsDelegates,
///   supportedLocales: SystemLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the SystemLocalizations.supportedLocales
/// property.
abstract class SystemLocalizations {
  SystemLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static SystemLocalizations? of(BuildContext context) {
    return Localizations.of<SystemLocalizations>(context, SystemLocalizations);
  }

  static const LocalizationsDelegate<SystemLocalizations> delegate = _SystemLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// No description provided for @languages_nameValidation.
  ///
  /// In en, this message translates to:
  /// **'Enter a language name'**
  String get languages_nameValidation;

  /// No description provided for @languages_cultureCode.
  ///
  /// In en, this message translates to:
  /// **'Culture code'**
  String get languages_cultureCode;

  /// No description provided for @languages_cultureCodeValidation.
  ///
  /// In en, this message translates to:
  /// **'Enter a culture code (e.g. en-US)'**
  String get languages_cultureCodeValidation;

  /// No description provided for @languages_default.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get languages_default;

  /// No description provided for @languages_editContentIfInactive.
  ///
  /// In en, this message translates to:
  /// **'Edit content if inactive'**
  String get languages_editContentIfInactive;

  /// No description provided for @languages_deleteLanguage.
  ///
  /// In en, this message translates to:
  /// **'Delete language'**
  String get languages_deleteLanguage;

  /// A message with a string parameter
  ///
  /// In en, this message translates to:
  /// **'You are about to delete a language \"{name}\". Are you sure you want to proceed?'**
  String languages_deleteLanguageMessage(String name);

  /// No description provided for @languages_savedMessage.
  ///
  /// In en, this message translates to:
  /// **'Language saved successfully'**
  String get languages_savedMessage;

  /// No description provided for @languages_editLanguage.
  ///
  /// In en, this message translates to:
  /// **'Edit language'**
  String get languages_editLanguage;

  /// No description provided for @languages_createLanguage.
  ///
  /// In en, this message translates to:
  /// **'Create language'**
  String get languages_createLanguage;

  /// No description provided for @tags_deleteTag.
  ///
  /// In en, this message translates to:
  /// **'Delete tag'**
  String get tags_deleteTag;

  /// A message with a string parameter
  ///
  /// In en, this message translates to:
  /// **'You are about to delete a tag \"{text}\". Are you sure you want to proceed?'**
  String tags_deleteTagMessage(String text);

  /// No description provided for @tags_savedMessage.
  ///
  /// In en, this message translates to:
  /// **'Tag saved successfully'**
  String get tags_savedMessage;

  /// No description provided for @tags_tagDetails.
  ///
  /// In en, this message translates to:
  /// **'Tag details'**
  String get tags_tagDetails;

  /// No description provided for @tags_editTag.
  ///
  /// In en, this message translates to:
  /// **'Edit tag'**
  String get tags_editTag;

  /// No description provided for @tags_createTag.
  ///
  /// In en, this message translates to:
  /// **'Create tag'**
  String get tags_createTag;

  /// No description provided for @tags_loadErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Tag details are not loaded.\r\nPlease try again.'**
  String get tags_loadErrorMessage;

  /// No description provided for @interests_favoritesCount.
  ///
  /// In en, this message translates to:
  /// **'Favorites count'**
  String get interests_favoritesCount;

  /// No description provided for @interests_showDuringOnboarding.
  ///
  /// In en, this message translates to:
  /// **'Show during onboarding'**
  String get interests_showDuringOnboarding;

  /// No description provided for @interests_deleteInterest.
  ///
  /// In en, this message translates to:
  /// **'Delete interest'**
  String get interests_deleteInterest;

  /// A message with a string parameter
  ///
  /// In en, this message translates to:
  /// **'You are about to delete a interest \"{text}\". Are you sure you want to proceed?'**
  String interests_deleteInterestMessage(String text);

  /// No description provided for @interests_savedMessage.
  ///
  /// In en, this message translates to:
  /// **'Interest saved successfully'**
  String get interests_savedMessage;

  /// No description provided for @interests_interestDetails.
  ///
  /// In en, this message translates to:
  /// **'Interest details'**
  String get interests_interestDetails;

  /// No description provided for @interests_editInterest.
  ///
  /// In en, this message translates to:
  /// **'Edit interest'**
  String get interests_editInterest;

  /// No description provided for @interests_createInterest.
  ///
  /// In en, this message translates to:
  /// **'Create interest'**
  String get interests_createInterest;

  /// No description provided for @interests_loadErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Interest details are not loaded.\r\nPlease try again.'**
  String get interests_loadErrorMessage;

  /// No description provided for @resourceStrings_translations.
  ///
  /// In en, this message translates to:
  /// **'Translations'**
  String get resourceStrings_translations;

  /// No description provided for @resourceStrings_deleteResourceString.
  ///
  /// In en, this message translates to:
  /// **'Delete resource string'**
  String get resourceStrings_deleteResourceString;

  /// A message with a string parameter
  ///
  /// In en, this message translates to:
  /// **'You are about to delete a resource string \"{key}\".\nAre you sure you want to proceed?'**
  String resourceStrings_deleteResourceStringMessage(String key);

  /// No description provided for @resourceStrings_savedMessage.
  ///
  /// In en, this message translates to:
  /// **'Resource saved successfully'**
  String get resourceStrings_savedMessage;

  /// No description provided for @resourceStrings_resourceStringDetails.
  ///
  /// In en, this message translates to:
  /// **'Resource string details'**
  String get resourceStrings_resourceStringDetails;

  /// No description provided for @resourceStrings_editResourceString.
  ///
  /// In en, this message translates to:
  /// **'Edit resource string'**
  String get resourceStrings_editResourceString;

  /// No description provided for @resourceStrings_createResourceString.
  ///
  /// In en, this message translates to:
  /// **'Create resource string'**
  String get resourceStrings_createResourceString;

  /// No description provided for @resourceStrings_loadErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Resource string details are not loaded.\r\nPlease try again.'**
  String get resourceStrings_loadErrorMessage;
}

class _SystemLocalizationsDelegate extends LocalizationsDelegate<SystemLocalizations> {
  const _SystemLocalizationsDelegate();

  @override
  Future<SystemLocalizations> load(Locale locale) {
    return SynchronousFuture<SystemLocalizations>(lookupSystemLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_SystemLocalizationsDelegate old) => false;
}

SystemLocalizations lookupSystemLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return SystemLocalizationsEn();
  }

  throw FlutterError(
    'SystemLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
