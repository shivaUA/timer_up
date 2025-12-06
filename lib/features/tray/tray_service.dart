// ignore_for_file: constant_identifier_names

// Flutter & Dart
import 'dart:async';
import 'dart:io';
// Tray
import 'package:system_tray/system_tray.dart';
// Window
import 'package:window_manager/window_manager.dart';
// Localization
import 'package:timer_up/core/localization/app_locale.dart';
import 'package:timer_up/core/settings/settings_change_args.dart';
import 'package:timer_up/core/settings/settings_model.dart';
import 'package:timer_up/core/settings/settings_service.dart';
import 'package:timer_up/core/settings/time_format.dart';
import 'package:timer_up/l10n/generated/core/core_localizations.dart';
import 'package:timer_up/core/localization/localization_service.dart';
// TimerUp
import 'package:timer_up/core/di/di.dart';
import 'package:timer_up/core/idisposable.dart';
import 'package:timer_up/themes/theme_type.dart';

final class TrayService implements IDisposable {
  bool _initialized = false;

  late Menu _contextMenu;
  late AppWindow _appWindow;
  late SystemTray? _systemTray;
  final Map<_TrayMenuItemType, MenuItemBase> _items = {};

  Future<void> init() async {
    if (_initialized) {
      return;
    }

    _systemTray = await _prepareTrayIcon();
    if (_systemTray == null) {
      return;
    }

    var settings = await resolve<SettingsService>().loadSettings();

    var ls = resolve<LocalizationService>();
    var localeSupported = CoreLocalizations.delegate.isSupported(ls.currentLocale);
    var coreLoc = await CoreLocalizations.delegate.load(
      localeSupported ? ls.currentLocale : LocalizationService.defaultLocale,
    );

    _appWindow = AppWindow();
    _contextMenu = _prepareContextMenu(coreLoc, settings);

    await _systemTray!.setContextMenu(_contextMenu);

    // handle system tray event
    _systemTray!.registerSystemTrayEventHandler((eventName) {
      if (eventName == kSystemTrayEventClick && !Platform.isWindows) {
        _systemTray!.popUpContextMenu();
      } else if (eventName == kSystemTrayEventDoubleClick && Platform.isWindows) {
        windowManager.show();
      } else if (eventName == kSystemTrayEventRightClick) {
        Platform.isWindows ? _systemTray!.popUpContextMenu() : _appWindow.show();
      }
    });

    ls.onLocaleChange(_updateTranslations);

    SettingsService.onSettingsChange(_onSettingsChange);

    _initialized = true;
  }

  Future<void> _onSettingsChange(SettingsChangeArgs args) async {
    if (args.showNotificationsChanged) {
      _items[_TrayMenuItemType.settings_notifications]?.setCheck(args.showNotificationsChanged);
    }

    if (args.startWithOSChanged) {
      _items[_TrayMenuItemType.settings_autoLaunch]?.setCheck(args.startWithOSChanged);
    }

    if (args.themeChanged) {
      _items[_TrayMenuItemType.settings_theme_light]?.setCheck(args.theme == ThemeType.light);
      _items[_TrayMenuItemType.settings_theme_dark]?.setCheck(args.theme == ThemeType.dark);
    }

    if (args.timeFormatChanged) {
      _items[_TrayMenuItemType.settings_timeFormat_12h]?.setCheck(
        args.timeFormat == TimeFormat.h12,
      );
      _items[_TrayMenuItemType.settings_timeFormat_24h]?.setCheck(
        args.timeFormat == TimeFormat.h24,
      );
    }

    if (args.languageChanged) {
      var langMenu = _items[_TrayMenuItemType.settings_language] as SubMenu?;
      for (var loc in langMenu?.children ?? <MenuItemBase>[]) {
        loc.setCheck(
          (loc.name == null && args.language == null) || loc.name == args.language?.countryCode,
        );
      }
    }
  }

  Future<void> _updateTranslations(AppLocale args) async {
    if (!_initialized) {
      return;
    }

    var localeSupported = CoreLocalizations.delegate.isSupported(args);

    var coreLoc = await CoreLocalizations.delegate.load(
      localeSupported ? args : LocalizationService.defaultLocale,
    );

    _setTrayIconTranslations(coreLoc);
    _setContextMenuTranslations(coreLoc);
  }

  Future<SystemTray?> _prepareTrayIcon() async {
    try {
      var tray = SystemTray();

      // We first init the systray menu
      await tray.initSystemTray(
        title: "TimerUp",
        toolTip: "TimerUp",
        iconPath: "resources/images/timer_up_logo.ico",
      );

      return tray;
    } catch (e) {
      return null;
    }
  }

  Menu _prepareContextMenu(CoreLocalizations coreLoc, SettingsModel settings) {
    final openHideAppItem = MenuItemLabel(
      label: _translateMenuItem(_TrayMenuItemType.openHideApp, coreLoc),
      onClicked: (_) async {
        var visible = await windowManager.isVisible();
        visible ? await windowManager.hide() : await windowManager.show();
      },
    );
    _items[_TrayMenuItemType.openHideApp] = openHideAppItem;

    final settingsItem = SubMenu(
      label: _translateMenuItem(_TrayMenuItemType.settings, coreLoc),
      children: _prepareSettingsMenu(coreLoc, settings),
    );
    _items[_TrayMenuItemType.settings] = settingsItem;

    final commandsItem = SubMenu(
      label: _translateMenuItem(_TrayMenuItemType.commands, coreLoc),
      children: _prepareCommandsMenu(coreLoc),
    );
    _items[_TrayMenuItemType.commands] = commandsItem;

    final aboutItem = MenuItemLabel(
      label: _translateMenuItem(_TrayMenuItemType.about, coreLoc),
      onClicked: (_) {
        // TODO: open main window and navigate to about page
      },
    );
    _items[_TrayMenuItemType.about] = aboutItem;

    final quitItem = MenuItemLabel(
      label: _translateMenuItem(_TrayMenuItemType.quit, coreLoc),
      onClicked: (_) {
        // TODO: check if any timer is running and confirm with user
        exit(0);
      },
    );
    _items[_TrayMenuItemType.quit] = quitItem;

    final res = Menu();
    res.buildFrom([
      openHideAppItem,
      settingsItem,
      commandsItem,
      MenuSeparator(),
      aboutItem,
      quitItem,
    ]);

    return res;
  }

  List<MenuItemBase> _prepareCommandsMenu(CoreLocalizations coreLoc) {
    final lockItem = MenuItemLabel(
      label: _translateMenuItem(_TrayMenuItemType.commands_lock, coreLoc),
      onClicked: (_) {},
    );
    _items[_TrayMenuItemType.commands_lock] = lockItem;

    final sleepItem = MenuItemLabel(
      label: _translateMenuItem(_TrayMenuItemType.commands_sleep, coreLoc),
      onClicked: (_) {},
    );
    _items[_TrayMenuItemType.commands_sleep] = sleepItem;

    final restartItem = MenuItemLabel(
      label: _translateMenuItem(_TrayMenuItemType.commands_restart, coreLoc),
      onClicked: (_) {},
    );
    _items[_TrayMenuItemType.commands_restart] = restartItem;

    final shutDownItem = MenuItemLabel(
      label: _translateMenuItem(_TrayMenuItemType.commands_shutDown, coreLoc),
      onClicked: (_) {},
    );
    _items[_TrayMenuItemType.commands_shutDown] = shutDownItem;

    // TODO: these two are special
    // LogOut not always an option even on Windows
    // And Hybernation might be turned off on the PC
    // So it needs further investigation
    // final logOutItem = MenuItem(coreLoc.commands_logOut);
    // final hybernateItem = MenuItem(coreLoc.commands_hybernate);

    return [lockItem, sleepItem, restartItem, shutDownItem];
  }

  List<MenuItemBase> _prepareSettingsMenu(CoreLocalizations coreLoc, SettingsModel settings) {
    final languageItem = SubMenu(
      label: _translateMenuItem(_TrayMenuItemType.settings_language, coreLoc),
      children: _prepareLanguagesMenu(coreLoc, settings),
    );
    _items[_TrayMenuItemType.settings_language] = languageItem;

    final themesItem = SubMenu(
      label: _translateMenuItem(_TrayMenuItemType.settings_theme, coreLoc),
      children: _prepareThemesMenu(coreLoc, settings),
    );
    _items[_TrayMenuItemType.settings_theme] = themesItem;

    final timeFormatsItem = SubMenu(
      label: _translateMenuItem(_TrayMenuItemType.settings_timeFormat, coreLoc),
      children: _prepareTimeFormatsMenu(coreLoc, settings),
    );
    _items[_TrayMenuItemType.settings_timeFormat] = timeFormatsItem;

    final notificationsItem = MenuItemCheckbox(
      label: _translateMenuItem(_TrayMenuItemType.settings_notifications, coreLoc),
      checked: settings.showNotifications,
      onClicked: (_) {
        resolve<SettingsService>().setShowNotifications(
          !_items[_TrayMenuItemType.settings_notifications]!.checked,
        );
      },
    );
    _items[_TrayMenuItemType.settings_notifications] = notificationsItem;

    final autoLaunchItem = MenuItemCheckbox(
      label: _translateMenuItem(_TrayMenuItemType.settings_autoLaunch, coreLoc),
      checked: settings.startWithOS,
      onClicked: (_) {
        resolve<SettingsService>().setStartWithOS(
          !_items[_TrayMenuItemType.settings_autoLaunch]!.checked,
        );
      },
    );
    _items[_TrayMenuItemType.settings_autoLaunch] = autoLaunchItem;

    // Add items to menu
    return [themesItem, timeFormatsItem, languageItem, notificationsItem, autoLaunchItem];
  }

  List<MenuItemBase> _prepareLanguagesMenu(CoreLocalizations coreLoc, SettingsModel settings) {
    List<MenuItemBase> res = [];

    final systemLanguageItem = MenuItemCheckbox(
      label: _translateMenuItem(_TrayMenuItemType.settings_language_system, coreLoc),
      checked: settings.language == null,
      onClicked: (_) {
        resolve<SettingsService>().setLanguage(null);
      },
    );
    _items[_TrayMenuItemType.settings_language_system] = systemLanguageItem;

    res.add(systemLanguageItem);

    for (var locale in LocalizationService.locales) {
      final localeItem = MenuItemCheckbox(
        name: locale.countryCode,
        label: locale.name,
        checked: settings.language?.countryCode == locale.countryCode,
        onClicked: (_) {
          resolve<SettingsService>().setLanguage(locale);
        },
      );

      res.add(localeItem);
    }

    return res;
  }

  List<MenuItemBase> _prepareThemesMenu(CoreLocalizations coreLoc, SettingsModel settings) {
    final lightItem = MenuItemCheckbox(
      label: _translateMenuItem(_TrayMenuItemType.settings_theme_light, coreLoc),
      checked: settings.theme == ThemeType.light,
      onClicked: (_) {
        resolve<SettingsService>().setTheme(ThemeType.light);
      },
    );
    _items[_TrayMenuItemType.settings_theme_light] = lightItem;

    final darkItem = MenuItemCheckbox(
      label: _translateMenuItem(_TrayMenuItemType.settings_theme_dark, coreLoc),
      checked: settings.theme == ThemeType.dark,
      onClicked: (_) {
        resolve<SettingsService>().setTheme(ThemeType.dark);
      },
    );
    _items[_TrayMenuItemType.settings_theme_dark] = darkItem;

    return [lightItem, darkItem];
  }

  List<MenuItemBase> _prepareTimeFormatsMenu(CoreLocalizations coreLoc, SettingsModel settings) {
    final h12Item = MenuItemCheckbox(
      label: _translateMenuItem(_TrayMenuItemType.settings_timeFormat_12h, coreLoc),
      checked: settings.timeFormat == TimeFormat.h12,
      onClicked: (_) {
        resolve<SettingsService>().setTimeFormat(TimeFormat.h12);
      },
    );
    _items[_TrayMenuItemType.settings_timeFormat_12h] = h12Item;

    final h24Item = MenuItemCheckbox(
      label: _translateMenuItem(_TrayMenuItemType.settings_timeFormat_24h, coreLoc),
      checked: settings.timeFormat == TimeFormat.h24,
      onClicked: (_) {
        resolve<SettingsService>().setTimeFormat(TimeFormat.h24);
      },
    );
    _items[_TrayMenuItemType.settings_timeFormat_24h] = h24Item;

    return [h12Item, h24Item];
  }

  void _setTrayIconTranslations(CoreLocalizations coreLoc) {
    _systemTray?.setTitle("TimerUp");
    _systemTray?.setToolTip("TimerUp");
  }

  void _setContextMenuTranslations(CoreLocalizations coreLoc) {
    for (var item in _items.entries) {
      item.value.setLabel(_translateMenuItem(item.key, coreLoc));
    }
  }

  String _translateMenuItem(_TrayMenuItemType type, CoreLocalizations coreLoc) {
    return switch (type) {
      _TrayMenuItemType.quit => coreLoc.tray_quit,
      _TrayMenuItemType.about => coreLoc.tray_about,
      _TrayMenuItemType.openHideApp => coreLoc.tray_openHideApp,
      _TrayMenuItemType.settings => coreLoc.tray_settings,
      _TrayMenuItemType.settings_language => coreLoc.settings_language,
      _TrayMenuItemType.settings_language_system => coreLoc.settings_language_system,
      _TrayMenuItemType.settings_timeFormat => coreLoc.settings_timeFormat,
      _TrayMenuItemType.settings_timeFormat_12h => coreLoc.settings_timeFormat_12h,
      _TrayMenuItemType.settings_timeFormat_24h => coreLoc.settings_timeFormat_24h,
      _TrayMenuItemType.settings_theme => coreLoc.settings_theme,
      _TrayMenuItemType.settings_theme_light => coreLoc.settings_theme_light,
      _TrayMenuItemType.settings_theme_dark => coreLoc.settings_theme_dark,
      _TrayMenuItemType.settings_autoLaunch => coreLoc.settings_autoLaunch,
      _TrayMenuItemType.settings_notifications => coreLoc.settings_showNotifications,
      _TrayMenuItemType.commands => coreLoc.tray_commands,
      _TrayMenuItemType.commands_shutDown => coreLoc.commands_shutdown,
      _TrayMenuItemType.commands_sleep => coreLoc.commands_sleep,
      _TrayMenuItemType.commands_restart => coreLoc.commands_restart,
      _TrayMenuItemType.commands_lock => coreLoc.commands_lock,
      _TrayMenuItemType.commands_logOut => coreLoc.commands_logOut,
      _TrayMenuItemType.commands_hybernate => coreLoc.commands_hybernate,
    };
  }

  @override
  Future<void> dispose() async {
    resolve<LocalizationService>().cancelOnLocaleChange(_updateTranslations);
    SettingsService.cancelOnSettingsChange(_onSettingsChange);

    _systemTray?.destroy();
  }
}

enum _TrayMenuItemType {
  // GENERAL
  quit(0),
  about(10),
  openHideApp(20),

  // SETTINGS
  settings(30),
  settings_language(301),
  settings_language_system(3011),
  settings_timeFormat(302),
  settings_timeFormat_12h(3021),
  settings_timeFormat_24h(3022),

  settings_theme(303),
  settings_theme_light(3031),
  settings_theme_dark(3032),

  settings_autoLaunch(304),
  settings_notifications(305),

  // COMMANDS
  commands(40),
  commands_shutDown(401),
  commands_sleep(402),
  commands_restart(403),
  commands_lock(404),
  commands_logOut(405),
  commands_hybernate(406);

  const _TrayMenuItemType(this.value);
  final int value;
}
