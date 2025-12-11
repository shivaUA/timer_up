import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'core_localizations_en.dart';
import 'core_localizations_uk.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of CoreLocalizations
/// returned by `CoreLocalizations.of(context)`.
///
/// Applications need to include `CoreLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'core/core_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: CoreLocalizations.localizationsDelegates,
///   supportedLocales: CoreLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the CoreLocalizations.supportedLocales
/// property.
abstract class CoreLocalizations {
  CoreLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static CoreLocalizations? of(BuildContext context) {
    return Localizations.of<CoreLocalizations>(context, CoreLocalizations);
  }

  static const LocalizationsDelegate<CoreLocalizations> delegate = _CoreLocalizationsDelegate();

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
    Locale('en'),
    Locale('uk')
  ];

  /// No description provided for @tray_openHideApp.
  ///
  /// In en, this message translates to:
  /// **'Open/Hide app'**
  String get tray_openHideApp;

  /// No description provided for @tray_settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get tray_settings;

  /// No description provided for @tray_commands.
  ///
  /// In en, this message translates to:
  /// **'Commands'**
  String get tray_commands;

  /// No description provided for @tray_quit.
  ///
  /// In en, this message translates to:
  /// **'Quit'**
  String get tray_quit;

  /// No description provided for @tray_about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get tray_about;

  /// No description provided for @tray_quit_confirmation_activeTimers.
  ///
  /// In en, this message translates to:
  /// **'There are active timers running. They will be completely stopped.\r\nAre you sure you want to close TimerUp?'**
  String get tray_quit_confirmation_activeTimers;

  /// No description provided for @settings_language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settings_language;

  /// No description provided for @settings_language_system.
  ///
  /// In en, this message translates to:
  /// **'Use system language'**
  String get settings_language_system;

  /// No description provided for @settings_theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get settings_theme;

  /// No description provided for @settings_theme_light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get settings_theme_light;

  /// No description provided for @settings_theme_dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get settings_theme_dark;

  /// No description provided for @settings_timeFormat.
  ///
  /// In en, this message translates to:
  /// **'Time format'**
  String get settings_timeFormat;

  /// No description provided for @settings_timeFormat_24h.
  ///
  /// In en, this message translates to:
  /// **'24-hour (00:00)'**
  String get settings_timeFormat_24h;

  /// No description provided for @settings_timeFormat_12h.
  ///
  /// In en, this message translates to:
  /// **'12-hour (12 AM)'**
  String get settings_timeFormat_12h;

  /// No description provided for @settings_autoLaunch.
  ///
  /// In en, this message translates to:
  /// **'Automatically start on login'**
  String get settings_autoLaunch;

  /// No description provided for @settings_showNotifications.
  ///
  /// In en, this message translates to:
  /// **'Show notifications'**
  String get settings_showNotifications;

  /// No description provided for @settings_showNotifications_hint.
  ///
  /// In en, this message translates to:
  /// **''**
  String get settings_showNotifications_hint;

  /// No description provided for @commands_shutdown.
  ///
  /// In en, this message translates to:
  /// **'Shut down'**
  String get commands_shutdown;

  /// No description provided for @commands_sleep.
  ///
  /// In en, this message translates to:
  /// **'Sleep'**
  String get commands_sleep;

  /// No description provided for @commands_restart.
  ///
  /// In en, this message translates to:
  /// **'Restart'**
  String get commands_restart;

  /// No description provided for @commands_lock.
  ///
  /// In en, this message translates to:
  /// **'Lock'**
  String get commands_lock;

  /// No description provided for @commands_logOut.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get commands_logOut;

  /// No description provided for @commands_hybernate.
  ///
  /// In en, this message translates to:
  /// **'Hybernate'**
  String get commands_hybernate;

  /// No description provided for @routes_powerTimers.
  ///
  /// In en, this message translates to:
  /// **'Power timers'**
  String get routes_powerTimers;

  /// No description provided for @routes_stopwatch.
  ///
  /// In en, this message translates to:
  /// **'Stopwatch'**
  String get routes_stopwatch;

  /// No description provided for @routes_reminders.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get routes_reminders;

  /// No description provided for @routes_interruptionTimers.
  ///
  /// In en, this message translates to:
  /// **'Interruption timers'**
  String get routes_interruptionTimers;

  /// No description provided for @routes_settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get routes_settings;
}

class _CoreLocalizationsDelegate extends LocalizationsDelegate<CoreLocalizations> {
  const _CoreLocalizationsDelegate();

  @override
  Future<CoreLocalizations> load(Locale locale) {
    return SynchronousFuture<CoreLocalizations>(lookupCoreLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'uk'].contains(locale.languageCode);

  @override
  bool shouldReload(_CoreLocalizationsDelegate old) => false;
}

CoreLocalizations lookupCoreLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return CoreLocalizationsEn();
    case 'uk': return CoreLocalizationsUk();
  }

  throw FlutterError(
    'CoreLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
