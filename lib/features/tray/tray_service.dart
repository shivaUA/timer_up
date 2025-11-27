import 'dart:io';

import 'package:nativeapi/nativeapi.dart';
import 'package:timer_up/l10n/generated/system/system_localizations.dart';
import 'package:timer_up/main.dart';

final class TrayService {
  bool _initialized = false;

  late TrayIcon? trayIcon;
  late Menu contextMenu;

  Future<void> init() async {
    if (_initialized) {
      return;
    }

    var sysLoc = SystemLocalizations.delegate.isSupported(TimerUpApp.selectedLocale)
        ? await SystemLocalizations.delegate.load(TimerUpApp.selectedLocale)
        : await SystemLocalizations.delegate.load(
            TimerUpApp.locales.where((x) => x.isDefault).first,
          );

    contextMenu = _prepareContextMenu(sysLoc);
    trayIcon = _prepareTrayIcon(sysLoc);

    trayIcon?.contextMenu = contextMenu;

    _initialized = true;
  }

  Future<void> updateTranslations() async {
    if (!_initialized) {
      return;
    }

    var sysLoc = SystemLocalizations.delegate.isSupported(TimerUpApp.selectedLocale)
        ? await SystemLocalizations.delegate.load(TimerUpApp.selectedLocale)
        : await SystemLocalizations.delegate.load(
            TimerUpApp.locales.where((x) => x.isDefault).first,
          );

    _setTrayIconTranslations(sysLoc);
    _setContextMenuTranslations(sysLoc);
  }

  void dispose() {
    trayIcon?.dispose();
    contextMenu.dispose();
  }

  TrayIcon? _prepareTrayIcon(SystemLocalizations sysLoc) {
    try {
      var icon = TrayIcon();

      final img = Image.fromAsset('resources/images/timer_up_logo.png');
      if (img != null) {
        icon.icon = img;
      }

      icon.title = "TimerUp";
      icon.tooltip = "TimerUp - click and tick";
      icon.isVisible = true;
      icon.contextMenuTrigger = ContextMenuTrigger.none;

      icon.on<TrayIconRightClickedEvent>((event) {
        icon.openContextMenu();
      });

      return icon;
    } catch (e) {
      return null;
    }
  }

  Menu _prepareContextMenu(SystemLocalizations sysLoc) {
    final menu = Menu();

    // Listen to menu events
    // menu.addCallbackListener<MenuOpenedEvent>((event) {});
    // menu.addCallbackListener<MenuClosedEvent>((event) {});

    // Add menu items
    final showItem = MenuItem('Show Window ${TimerUpApp.selectedLocale.name}');
    final hideItem = MenuItem('Hide Window');
    final separatorItem = MenuItem('', MenuItemType.separator);
    final toggleItem = MenuItem('Toggle Visibility');
    final separatorItem2 = MenuItem('', MenuItemType.separator);

    // Create submenu
    final submenuMenu = Menu();
    final submenuItem1 = MenuItem('Submenu Item 1');
    final submenuItem2 = MenuItem('Submenu Item 2');
    final submenuItem3 = MenuItem('Submenu Item 3');

    // Add submenu items
    submenuMenu.addItem(submenuItem1);
    submenuMenu.addItem(submenuItem2);
    submenuMenu.addItem(submenuItem3);

    // Create submenu menu item
    final submenuMenuItem = MenuItem('More Options', MenuItemType.submenu);
    submenuMenuItem.submenu = submenuMenu;

    // Listen to submenu open/close events
    //submenuMenuItem.on<MenuItemSubmenuOpenedEvent>((event) {});

    //submenuMenuItem.on<MenuItemSubmenuClosedEvent>((event) {});

    // Add event listeners for submenu items
    //submenuItem1.on<MenuItemClickedEvent>((event) {});
    //submenuItem2.on<MenuItemClickedEvent>((event) {});
    //submenuItem3.on<MenuItemClickedEvent>((event) {});

    final separatorItem3 = MenuItem('', MenuItemType.separator);
    final aboutItem = MenuItem('About');
    final quitItem = MenuItem('Quit');

    // Add event listeners for menu items
    // showItem.on<MenuItemClickedEvent>((event) {});
    // hideItem.on<MenuItemClickedEvent>((event) {});
    // toggleItem.on<MenuItemClickedEvent>((event) {});
    // aboutItem.on<MenuItemClickedEvent>((event) {});
    quitItem.on<MenuItemClickedEvent>((event) {
      exit(0);
    });

    // Add items to menu
    menu.addItem(showItem);
    menu.addItem(hideItem);
    menu.addItem(separatorItem);
    menu.addItem(toggleItem);
    menu.addItem(separatorItem2);
    menu.addItem(submenuMenuItem);
    menu.addItem(separatorItem3);
    menu.addItem(aboutItem);
    menu.addItem(quitItem);

    return menu;
  }

  void _setTrayIconTranslations(SystemLocalizations sysLoc) {
    trayIcon?.title = "TimerUp";
    trayIcon?.tooltip = "TimerUp - click and tick - ${sysLoc.localeName}";
  }

  void _setContextMenuTranslations(SystemLocalizations sysLoc) {}
}
