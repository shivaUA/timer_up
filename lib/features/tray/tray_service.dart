// ignore_for_file: constant_identifier_names

// Flutter & Dart
import 'dart:async';
import 'dart:io';
// Tray
import 'package:system_tray/system_tray.dart';
// Localization
import 'package:timer_up/core/localization/app_locale.dart';
import 'package:timer_up/core/settings/settings_change_args.dart';
import 'package:timer_up/core/settings/settings_service.dart';
import 'package:timer_up/l10n/generated/core/core_localizations.dart';
import 'package:timer_up/core/localization/localization_service.dart';
// TimerUp
import 'package:timer_up/core/di/di.dart';
import 'package:timer_up/core/idisposable.dart';

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

    var ls = resolve<LocalizationService>();
    var localeSupported = CoreLocalizations.delegate.isSupported(ls.currentLocale);

    var coreLoc = await CoreLocalizations.delegate.load(
      localeSupported ? ls.currentLocale : LocalizationService.defaultLocale,
    );

    _systemTray = await _prepareTrayIcon(coreLoc);
    if (_systemTray == null) {
      return;
    }

    _appWindow = AppWindow();
    _contextMenu = _prepareContextMenu(coreLoc);

    await _systemTray!.setContextMenu(_contextMenu);

    // handle system tray event
    _systemTray!.registerSystemTrayEventHandler((eventName) {
      if (eventName == kSystemTrayEventClick) {
        Platform.isWindows ? _appWindow.show() : _systemTray!.popUpContextMenu();
      } else if (eventName == kSystemTrayEventRightClick) {
        Platform.isWindows ? _systemTray!.popUpContextMenu() : _appWindow.show();
      }
    });

    ls.onLocaleChange(_updateTranslations);

    SettingsService.onSettingsChange(_onSettingsChange);

    _initialized = true;
  }

  Future<void> _onSettingsChange(SettingsChangeArgs args) async {}

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

  Future<SystemTray?> _prepareTrayIcon(CoreLocalizations coreLoc) async {
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

  Menu _prepareContextMenu(CoreLocalizations coreLoc) {
    final openHideAppItem = MenuItemLabel(label: coreLoc.tray_openHideApp, onClicked: (_) {});
    _items[_TrayMenuItemType.openHideApp] = openHideAppItem;

    final settingsItem = SubMenu(
      label: coreLoc.tray_settings,
      children: _prepareSettingsMenu(coreLoc),
    );
    _items[_TrayMenuItemType.settings] = settingsItem;

    final commandsItem = SubMenu(
      label: coreLoc.tray_commands,
      children: _prepareCommandsMenu(coreLoc),
    );
    _items[_TrayMenuItemType.commands] = commandsItem;

    final aboutItem = MenuItemLabel(label: coreLoc.tray_about, onClicked: (_) {});
    _items[_TrayMenuItemType.about] = aboutItem;

    final quitItem = MenuItemLabel(
      label: coreLoc.tray_quit,
      onClicked: (_) {
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
    final lockItem = MenuItemLabel(label: coreLoc.commands_lock, onClicked: (_) {});
    _items[_TrayMenuItemType.commands_lock] = lockItem;

    final sleepItem = MenuItemLabel(label: coreLoc.commands_sleep, onClicked: (_) {});
    _items[_TrayMenuItemType.commands_sleep] = sleepItem;

    final restartItem = MenuItemLabel(label: coreLoc.commands_restart, onClicked: (_) {});
    _items[_TrayMenuItemType.commands_restart] = restartItem;

    final shutDownItem = MenuItemLabel(label: coreLoc.commands_shutdown, onClicked: (_) {});
    _items[_TrayMenuItemType.commands_shutDown] = shutDownItem;

    // TODO: these two are special
    // LogOut not always an option even on Windows
    // And Hybernation might be turned off on the PC
    // So it needs further investigation
    // final logOutItem = MenuItem(coreLoc.commands_logOut);
    // final hybernateItem = MenuItem(coreLoc.commands_hybernate);

    return [lockItem, sleepItem, restartItem, shutDownItem];
  }

  List<MenuItemBase> _prepareSettingsMenu(CoreLocalizations coreLoc) {
    final languageItem = SubMenu(
      label: coreLoc.settings_language,
      children: _prepareLanguagesMenu(coreLoc),
    );
    _items[_TrayMenuItemType.settings_language] = languageItem;

    final themesItem = SubMenu(
      label: coreLoc.settings_theme,
      children: _prepareThemesMenu(coreLoc),
    );
    _items[_TrayMenuItemType.settings_theme] = themesItem;

    final timeFormatsItem = SubMenu(
      label: coreLoc.settings_timeFormat,
      children: _prepareTimeFormatsMenu(coreLoc),
    );
    _items[_TrayMenuItemType.settings_timeFormat] = timeFormatsItem;

    final notificationsItem = MenuItemCheckbox(
      label: coreLoc.settings_showNotifications,
      checked: true,
      onClicked: (_) {},
    );
    _items[_TrayMenuItemType.settings_notifications] = notificationsItem;

    final autoLaunchItem = MenuItemCheckbox(
      label: coreLoc.settings_autoLaunch,
      checked: false,
      onClicked: (_) {},
    );
    _items[_TrayMenuItemType.settings_autoLaunch] = autoLaunchItem;

    // Add items to menu
    return [themesItem, timeFormatsItem, languageItem, notificationsItem, autoLaunchItem];
  }

  List<MenuItemBase> _prepareLanguagesMenu(CoreLocalizations coreLoc) {
    List<MenuItemBase> res = [];

    final systemLanguageItem = MenuItemCheckbox(
      label: coreLoc.settings_language_system,
      checked: true,
      onClicked: (_) {},
    );
    _items[_TrayMenuItemType.settings_language_system] = systemLanguageItem;

    res.add(systemLanguageItem);

    for (var locale in LocalizationService.locales) {
      final localeItem = MenuItemCheckbox(label: locale.name, checked: false, onClicked: (_) {});

      res.add(localeItem);
    }

    return res;
  }

  List<MenuItemBase> _prepareThemesMenu(CoreLocalizations coreLoc) {
    final lightItem = MenuItemCheckbox(
      label: coreLoc.settings_theme_light,
      checked: false,
      onClicked: (_) {},
    );
    _items[_TrayMenuItemType.settings_theme_light] = lightItem;

    final darkItem = MenuItemCheckbox(
      label: coreLoc.settings_theme_dark,
      checked: true,
      onClicked: (_) {},
    );
    _items[_TrayMenuItemType.settings_theme_dark] = darkItem;

    return [lightItem, darkItem];
  }

  List<MenuItemBase> _prepareTimeFormatsMenu(CoreLocalizations coreLoc) {
    final h12Item = MenuItemCheckbox(
      label: coreLoc.settings_timeFormat_12h,
      checked: false,
      onClicked: (_) {},
    );
    _items[_TrayMenuItemType.settings_timeFormat_12h] = h12Item;

    final h24Item = MenuItemCheckbox(
      label: coreLoc.settings_timeFormat_24h,
      checked: true,
      onClicked: (_) {},
    );
    _items[_TrayMenuItemType.settings_timeFormat_24h] = h24Item;

    return [h12Item, h24Item];
  }

  void _setTrayIconTranslations(CoreLocalizations coreLoc) {
    _systemTray?.setTitle("TimerUp");
    _systemTray?.setToolTip("TimerUp");
  }

  void _setContextMenuTranslations(CoreLocalizations sysLoc) {}

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
  commands_lock(404) /*,
  commands_logOut(405),
  commands_hybernate(406)*/;

  const _TrayMenuItemType(this.value);
  final int value;
}
