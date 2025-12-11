// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'core_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class CoreLocalizationsUk extends CoreLocalizations {
  CoreLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get tray_openHideApp => 'Open/Hide app';

  @override
  String get tray_settings => 'Settings';

  @override
  String get tray_commands => 'Commands';

  @override
  String get tray_quit => 'Quit';

  @override
  String get tray_about => 'About';

  @override
  String get tray_quit_confirmation_activeTimers => 'There are active timers running. They will be completely stopped.\r\nAre you sure you want to close TimerUp?';

  @override
  String get settings_language => 'Language';

  @override
  String get settings_language_system => 'Use system language';

  @override
  String get settings_theme => 'Theme';

  @override
  String get settings_theme_light => 'Light';

  @override
  String get settings_theme_dark => 'Dark';

  @override
  String get settings_timeFormat => 'Time format';

  @override
  String get settings_timeFormat_24h => '24-hour (00:00)';

  @override
  String get settings_timeFormat_12h => '12-hour (12 AM)';

  @override
  String get settings_autoLaunch => 'Automatically start on login';

  @override
  String get settings_showNotifications => 'Show notifications';

  @override
  String get settings_showNotifications_hint => '';

  @override
  String get commands_shutdown => 'Shut down';

  @override
  String get commands_sleep => 'Sleep';

  @override
  String get commands_restart => 'Restart';

  @override
  String get commands_lock => 'Lock';

  @override
  String get commands_logOut => 'Log out';

  @override
  String get commands_hybernate => 'Hybernate';

  @override
  String get routes_powerTimers => 'Таймери живлення';

  @override
  String get routes_stopwatch => 'Секундомір';

  @override
  String get routes_reminders => 'Нагадування';

  @override
  String get routes_interruptionTimers => 'Таймери перерви';

  @override
  String get routes_settings => 'Налаштування';
}
