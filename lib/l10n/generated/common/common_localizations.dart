import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'common_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of CommonLocalizations
/// returned by `CommonLocalizations.of(context)`.
///
/// Applications need to include `CommonLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'common/common_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: CommonLocalizations.localizationsDelegates,
///   supportedLocales: CommonLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the CommonLocalizations.supportedLocales
/// property.
abstract class CommonLocalizations {
  CommonLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static CommonLocalizations? of(BuildContext context) {
    return Localizations.of<CommonLocalizations>(context, CommonLocalizations);
  }

  static const LocalizationsDelegate<CommonLocalizations> delegate = _CommonLocalizationsDelegate();

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

  /// No description provided for @common_language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get common_language;

  /// No description provided for @common_create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get common_create;

  /// No description provided for @common_refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get common_refresh;

  /// No description provided for @common_edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get common_edit;

  /// No description provided for @common_delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get common_delete;

  /// No description provided for @common_email.
  ///
  /// In en, this message translates to:
  /// **'E-mail'**
  String get common_email;

  /// No description provided for @common_emailValidation.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid E-mail address'**
  String get common_emailValidation;

  /// No description provided for @common_userName.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get common_userName;

  /// No description provided for @common_ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get common_ok;

  /// No description provided for @common_close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get common_close;

  /// No description provided for @common_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get common_cancel;

  /// No description provided for @common_save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get common_save;

  /// No description provided for @common_saveAndClose.
  ///
  /// In en, this message translates to:
  /// **'Save and close'**
  String get common_saveAndClose;

  /// No description provided for @common_active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get common_active;

  /// No description provided for @common_name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get common_name;

  /// No description provided for @common_sortOrder.
  ///
  /// In en, this message translates to:
  /// **'Sort order'**
  String get common_sortOrder;

  /// No description provided for @common_modifiedAt.
  ///
  /// In en, this message translates to:
  /// **'Modified at'**
  String get common_modifiedAt;

  /// No description provided for @common_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get common_description;

  /// No description provided for @common_select.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get common_select;

  /// No description provided for @common_yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get common_yes;

  /// No description provided for @common_no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get common_no;

  /// No description provided for @common_title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get common_title;

  /// No description provided for @common_picture.
  ///
  /// In en, this message translates to:
  /// **'Picture'**
  String get common_picture;

  /// No description provided for @common_detailsPicture.
  ///
  /// In en, this message translates to:
  /// **'Details picture'**
  String get common_detailsPicture;

  /// No description provided for @common_detailsPictures.
  ///
  /// In en, this message translates to:
  /// **'Details picture'**
  String get common_detailsPictures;

  /// No description provided for @common_text.
  ///
  /// In en, this message translates to:
  /// **'Text'**
  String get common_text;

  /// No description provided for @common_date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get common_date;

  /// No description provided for @common_import.
  ///
  /// In en, this message translates to:
  /// **'Import'**
  String get common_import;

  /// No description provided for @common_key.
  ///
  /// In en, this message translates to:
  /// **'Key'**
  String get common_key;

  /// No description provided for @common_keyValidation.
  ///
  /// In en, this message translates to:
  /// **'Specify a key'**
  String get common_keyValidation;

  /// No description provided for @common_number.
  ///
  /// In en, this message translates to:
  /// **'Number'**
  String get common_number;

  /// No description provided for @common_sortOrderValidation.
  ///
  /// In en, this message translates to:
  /// **'Please enter a number from -32768 to 32767'**
  String get common_sortOrderValidation;

  /// No description provided for @network_dioExceptions_cancel.
  ///
  /// In en, this message translates to:
  /// **'Request to the server was cancelled.'**
  String get network_dioExceptions_cancel;

  /// No description provided for @network_dioExceptions_connectionTimeout.
  ///
  /// In en, this message translates to:
  /// **'Connection timed out.'**
  String get network_dioExceptions_connectionTimeout;

  /// No description provided for @network_dioExceptions_receiveTimeout.
  ///
  /// In en, this message translates to:
  /// **'Receiving timeout occurred.'**
  String get network_dioExceptions_receiveTimeout;

  /// No description provided for @network_dioExceptions_sendTimeout.
  ///
  /// In en, this message translates to:
  /// **'Request send timeout.'**
  String get network_dioExceptions_sendTimeout;

  /// No description provided for @network_dioExceptions_noInternet.
  ///
  /// In en, this message translates to:
  /// **'No Internet.'**
  String get network_dioExceptions_noInternet;

  /// No description provided for @network_dioExceptions_unexpectedError.
  ///
  /// In en, this message translates to:
  /// **'Unexpected error occurred.'**
  String get network_dioExceptions_unexpectedError;

  /// No description provided for @network_httpStatuses_400.
  ///
  /// In en, this message translates to:
  /// **'Provided request data is not correct.'**
  String get network_httpStatuses_400;

  /// No description provided for @network_httpStatuses_401.
  ///
  /// In en, this message translates to:
  /// **'Session expired, please login again.'**
  String get network_httpStatuses_401;

  /// No description provided for @network_httpStatuses_403.
  ///
  /// In en, this message translates to:
  /// **'The authenticated user is not allowed to access the specified API endpoint.'**
  String get network_httpStatuses_403;

  /// No description provided for @network_httpStatuses_404.
  ///
  /// In en, this message translates to:
  /// **'The requested resource does not exist.'**
  String get network_httpStatuses_404;

  /// No description provided for @network_httpStatuses_405.
  ///
  /// In en, this message translates to:
  /// **'Method not allowed. Please check the Allow header for the allowed HTTP methods.'**
  String get network_httpStatuses_405;

  /// No description provided for @network_httpStatuses_406.
  ///
  /// In en, this message translates to:
  /// **'Operation was denied. Please check the data and be sure you are attempting the right action.'**
  String get network_httpStatuses_406;

  /// No description provided for @network_httpStatuses_415.
  ///
  /// In en, this message translates to:
  /// **'Unsupported media type. The requested content type or version number is invalid.'**
  String get network_httpStatuses_415;

  /// No description provided for @network_httpStatuses_422.
  ///
  /// In en, this message translates to:
  /// **'Data validation failed.'**
  String get network_httpStatuses_422;

  /// No description provided for @network_httpStatuses_429.
  ///
  /// In en, this message translates to:
  /// **'Too many requests.'**
  String get network_httpStatuses_429;

  /// No description provided for @network_httpStatuses_500.
  ///
  /// In en, this message translates to:
  /// **'Internal server error.'**
  String get network_httpStatuses_500;

  /// No description provided for @network_httpStatuses_general.
  ///
  /// In en, this message translates to:
  /// **'Oops something went wrong!'**
  String get network_httpStatuses_general;

  /// No description provided for @textEditor_dialog_fullScreen.
  ///
  /// In en, this message translates to:
  /// **'Edit text'**
  String get textEditor_dialog_fullScreen;

  /// No description provided for @textEditor_dialog_code.
  ///
  /// In en, this message translates to:
  /// **'Edit markdown code'**
  String get textEditor_dialog_code;

  /// No description provided for @textEditor_toolbar_fullScreen.
  ///
  /// In en, this message translates to:
  /// **'Open full-screen editor'**
  String get textEditor_toolbar_fullScreen;

  /// No description provided for @textEditor_toolbar_code.
  ///
  /// In en, this message translates to:
  /// **'Open code editor'**
  String get textEditor_toolbar_code;

  /// No description provided for @editors_date_dialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get editors_date_dialogTitle;

  /// No description provided for @editors_date_validation.
  ///
  /// In en, this message translates to:
  /// **'Select a valid date'**
  String get editors_date_validation;

  /// No description provided for @editors_dateTime_dialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Select Date & Time'**
  String get editors_dateTime_dialogTitle;

  /// No description provided for @editors_dateTime_validation.
  ///
  /// In en, this message translates to:
  /// **'Select a valid date and time'**
  String get editors_dateTime_validation;

  /// No description provided for @editors_time_hour.
  ///
  /// In en, this message translates to:
  /// **'Hour'**
  String get editors_time_hour;

  /// No description provided for @editors_time_minute.
  ///
  /// In en, this message translates to:
  /// **'Minute'**
  String get editors_time_minute;

  /// No description provided for @editors_time_second.
  ///
  /// In en, this message translates to:
  /// **'Second'**
  String get editors_time_second;

  /// A message with two String parameters
  ///
  /// In en, this message translates to:
  /// **'Value must be between \"{min}\" and \"{max}\"'**
  String editors_time_validation(String min, String max);

  /// A message with one String parameter
  ///
  /// In en, this message translates to:
  /// **'Enter value for \"{languageName}\"'**
  String editors_languageRows_validation(String languageName);

  /// A message with one String parameter
  ///
  /// In en, this message translates to:
  /// **'Please enter \"{fieldName}\"'**
  String editors_languageTabs_validation(String fieldName);

  /// No description provided for @import_inserted.
  ///
  /// In en, this message translates to:
  /// **'Inserted'**
  String get import_inserted;

  /// No description provided for @import_updated.
  ///
  /// In en, this message translates to:
  /// **'Updated'**
  String get import_updated;

  /// No description provided for @import_deleted.
  ///
  /// In en, this message translates to:
  /// **'Deleted'**
  String get import_deleted;

  /// No description provided for @routes_dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get routes_dashboard;

  /// No description provided for @routes_login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get routes_login;

  /// No description provided for @routes_users.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get routes_users;

  /// No description provided for @routes_roles.
  ///
  /// In en, this message translates to:
  /// **'Roles'**
  String get routes_roles;

  /// No description provided for @routes_accessRules.
  ///
  /// In en, this message translates to:
  /// **'Access rules'**
  String get routes_accessRules;

  /// No description provided for @routes_tags.
  ///
  /// In en, this message translates to:
  /// **'Tags'**
  String get routes_tags;

  /// No description provided for @routes_resourceStrings.
  ///
  /// In en, this message translates to:
  /// **'Resource strings'**
  String get routes_resourceStrings;

  /// No description provided for @routes_interests.
  ///
  /// In en, this message translates to:
  /// **'Interests'**
  String get routes_interests;

  /// No description provided for @routes_languages.
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get routes_languages;

  /// No description provided for @routes_stems.
  ///
  /// In en, this message translates to:
  /// **'Stems'**
  String get routes_stems;

  /// No description provided for @routes_dailyEnergy.
  ///
  /// In en, this message translates to:
  /// **'Daily energy'**
  String get routes_dailyEnergy;

  /// No description provided for @routes_products.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get routes_products;

  /// No description provided for @routes_ecommerceStatistics.
  ///
  /// In en, this message translates to:
  /// **'Ecommerce statistics'**
  String get routes_ecommerceStatistics;

  /// No description provided for @routes_sections.
  ///
  /// In en, this message translates to:
  /// **'Sections'**
  String get routes_sections;

  /// No description provided for @routes_categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get routes_categories;

  /// No description provided for @routes_programs.
  ///
  /// In en, this message translates to:
  /// **'Programs'**
  String get routes_programs;

  /// No description provided for @routes_doctors.
  ///
  /// In en, this message translates to:
  /// **'Doctors'**
  String get routes_doctors;

  /// No description provided for @routes_messageTemplates.
  ///
  /// In en, this message translates to:
  /// **'Message templates'**
  String get routes_messageTemplates;

  /// No description provided for @routes_notificationMessages.
  ///
  /// In en, this message translates to:
  /// **'Notification messages'**
  String get routes_notificationMessages;

  /// No description provided for @routes_moonPhases.
  ///
  /// In en, this message translates to:
  /// **'Moon phases'**
  String get routes_moonPhases;

  /// No description provided for @routes_zodiacSigns.
  ///
  /// In en, this message translates to:
  /// **'Zodiac signs'**
  String get routes_zodiacSigns;

  /// No description provided for @routes_actions.
  ///
  /// In en, this message translates to:
  /// **'Actions'**
  String get routes_actions;

  /// No description provided for @routes_recommendations.
  ///
  /// In en, this message translates to:
  /// **'Recommendations'**
  String get routes_recommendations;

  /// No description provided for @routes_daily_rituals.
  ///
  /// In en, this message translates to:
  /// **'Rituals'**
  String get routes_daily_rituals;

  /// No description provided for @routes_daily_rituals_days.
  ///
  /// In en, this message translates to:
  /// **'Ritual days'**
  String get routes_daily_rituals_days;

  /// No description provided for @routes_daily_rituals_categories.
  ///
  /// In en, this message translates to:
  /// **'Ritual categories'**
  String get routes_daily_rituals_categories;

  /// No description provided for @mainMenu_sections_programs.
  ///
  /// In en, this message translates to:
  /// **'Programs'**
  String get mainMenu_sections_programs;

  /// No description provided for @mainMenu_sections_auth.
  ///
  /// In en, this message translates to:
  /// **'Auth'**
  String get mainMenu_sections_auth;

  /// No description provided for @mainMenu_sections_bazi.
  ///
  /// In en, this message translates to:
  /// **'BaZi'**
  String get mainMenu_sections_bazi;

  /// No description provided for @mainMenu_sections_store.
  ///
  /// In en, this message translates to:
  /// **'Store'**
  String get mainMenu_sections_store;

  /// No description provided for @mainMenu_sections_messaging.
  ///
  /// In en, this message translates to:
  /// **'Messaging'**
  String get mainMenu_sections_messaging;

  /// No description provided for @mainMenu_sections_moonPhases.
  ///
  /// In en, this message translates to:
  /// **'Moon Phases'**
  String get mainMenu_sections_moonPhases;

  /// No description provided for @mainMenu_sections_system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get mainMenu_sections_system;

  /// No description provided for @mainMenu_sections_daily.
  ///
  /// In en, this message translates to:
  /// **'Daily'**
  String get mainMenu_sections_daily;

  /// No description provided for @autoTable_actionUnavailable.
  ///
  /// In en, this message translates to:
  /// **'This action is not available'**
  String get autoTable_actionUnavailable;

  /// No description provided for @autoTable_searchPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Type at least 3 characters to search...'**
  String get autoTable_searchPlaceholder;

  /// No description provided for @autoTable_searchButton.
  ///
  /// In en, this message translates to:
  /// **'Tap to search'**
  String get autoTable_searchButton;

  /// No description provided for @autoTable_searchCancelButton.
  ///
  /// In en, this message translates to:
  /// **'Tap to cancel current search'**
  String get autoTable_searchCancelButton;

  /// No description provided for @autoTable_noData.
  ///
  /// In en, this message translates to:
  /// **'No records found for current filters'**
  String get autoTable_noData;

  /// A message with a string parameter
  ///
  /// In en, this message translates to:
  /// **'Search results for request: \"{searchPhrase}\"'**
  String autoTable_searchResultsFor(String searchPhrase);

  /// No description provided for @autoTable_openMenu.
  ///
  /// In en, this message translates to:
  /// **'Open menu'**
  String get autoTable_openMenu;
}

class _CommonLocalizationsDelegate extends LocalizationsDelegate<CommonLocalizations> {
  const _CommonLocalizationsDelegate();

  @override
  Future<CommonLocalizations> load(Locale locale) {
    return SynchronousFuture<CommonLocalizations>(lookupCommonLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_CommonLocalizationsDelegate old) => false;
}

CommonLocalizations lookupCommonLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return CommonLocalizationsEn();
  }

  throw FlutterError(
    'CommonLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
