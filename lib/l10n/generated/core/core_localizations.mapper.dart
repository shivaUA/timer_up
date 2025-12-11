// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// L10nMapperGenerator
// **************************************************************************

import 'package:timer_up/l10n/generated/core/core_localizations.dart';
import 'package:flutter/widgets.dart';

extension BuildContextExtension on BuildContext {
  CoreLocalizations get _localizations => CoreLocalizations.of(this)!;
  CoreLocalizations get l10n => _localizations;
  Locale get locale => Localizations.localeOf(this);
  String parseL10n(String translationKey, {List<Object>? arguments}) {
    final localizations = CoreLocalizations.of(this)!;
    return L10nHelper.parseL10n(
      localizations,
      translationKey,
      arguments: arguments,
    );
  }
}

extension CoreLocalizationsExtension on CoreLocalizations {
  String parseL10n(String translationKey, {List<Object>? arguments}) {
    return L10nHelper.parseL10n(this, translationKey, arguments: arguments);
  }
}

class L10nHelper {
  static String parseL10n(
    CoreLocalizations localizations,
    String translationKey, {
    List<Object>? arguments,
  }) {
    const mapper = CoreLocalizationsMapper();
    final object = mapper.toLocalizationMap(localizations)[translationKey];
    if (object == null) return 'Translation key not found!';
    if (object is String) return object;
    assert(arguments != null, 'Arguments should not be null!');
    assert(arguments!.isNotEmpty, 'Arguments should not be empty!');
    return Function.apply(object, arguments);
  }
}

class CoreLocalizationsMapper {
  const CoreLocalizationsMapper();
  Map<String, dynamic> toLocalizationMap(CoreLocalizations localizations) {
    return {
      'localeName': localizations.localeName,
      'tray_openHideApp': localizations.tray_openHideApp,
      'tray_settings': localizations.tray_settings,
      'tray_commands': localizations.tray_commands,
      'tray_quit': localizations.tray_quit,
      'tray_about': localizations.tray_about,
      'tray_quit_confirmation_activeTimers':
          localizations.tray_quit_confirmation_activeTimers,
      'settings_language': localizations.settings_language,
      'settings_language_system': localizations.settings_language_system,
      'settings_theme': localizations.settings_theme,
      'settings_theme_light': localizations.settings_theme_light,
      'settings_theme_dark': localizations.settings_theme_dark,
      'settings_timeFormat': localizations.settings_timeFormat,
      'settings_timeFormat_24h': localizations.settings_timeFormat_24h,
      'settings_timeFormat_12h': localizations.settings_timeFormat_12h,
      'settings_autoLaunch': localizations.settings_autoLaunch,
      'settings_showNotifications': localizations.settings_showNotifications,
      'settings_showNotifications_hint':
          localizations.settings_showNotifications_hint,
      'commands_shutdown': localizations.commands_shutdown,
      'commands_sleep': localizations.commands_sleep,
      'commands_restart': localizations.commands_restart,
      'commands_lock': localizations.commands_lock,
      'commands_logOut': localizations.commands_logOut,
      'commands_hybernate': localizations.commands_hybernate,
      'routes_powerTimers': localizations.routes_powerTimers,
      'routes_stopwatch': localizations.routes_stopwatch,
      'routes_reminders': localizations.routes_reminders,
      'routes_interruptionTimers': localizations.routes_interruptionTimers,
      'routes_settings': localizations.routes_settings,
    };
  }
}
