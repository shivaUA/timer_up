import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:timer_up/core/routing/routes/main_routes.dart';
import 'package:timer_up/core/routing/routes/i_route.dart';

final class MainMenuItemData {
  final IRoute? route;
  final IconData? icon;

  const MainMenuItemData.simple(this.route, this.icon);

  bool isCurrent(String routePath) {
    return route != null && route!.path.toUpperCase() == routePath.toUpperCase();
  }
}

const List<MainMenuItemData> menuItems = [
  MainMenuItemData.simple(MainRoutes.powerTimers, Symbols.power_settings_new_rounded),
  MainMenuItemData.simple(MainRoutes.stopwatch, Symbols.timer_rounded),
  MainMenuItemData.simple(MainRoutes.interruptionTimers, Symbols.timer_pause_rounded),
  MainMenuItemData.simple(MainRoutes.alarms, Symbols.notifications_rounded),
  MainMenuItemData.simple(MainRoutes.settings, Symbols.tune_rounded),
];
