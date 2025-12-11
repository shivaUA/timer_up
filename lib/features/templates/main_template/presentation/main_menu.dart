import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:timer_up/core/routing/routes/main_routes.dart';
import 'package:timer_up/features/templates/main_template/model/main_menu_data.dart';
import 'package:timer_up/l10n/generated/core/core_localizations.dart';
import 'package:timer_up/l10n/generated/core/core_localizations.mapper.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    routerUserToPage(String page) async {
      context.pop();
    }

    var routerState = GoRouterState.of(context);
    var currentRoutePath = routerState.uri.path;
    var loc = CoreLocalizations.of(context)!;

    return Drawer(
      child: ListView(
        children: _renderMenuItems(loc, menuItems, routerUserToPage, currentRoutePath),
      ),
    );
  }

  List<Widget> _renderMenuItems(
    CoreLocalizations loc,
    List<MainMenuItemData> items,
    Future<void> Function(String route) onRoute,
    String currentRoutePath,
  ) {
    List<Widget> res = [];

    items.forEach((menuItem) {
      final title = menuItem.route?.name == null
          ? "-"
          : loc.parseL10n("routes_${menuItem.route!.name}");

      res.add(
        DrawerListTile(
          title: title,
          icon: menuItem.icon ?? Symbols.square_rounded,
          isSelected: menuItem.isCurrent(currentRoutePath),
          press: () {
            onRoute(menuItem.route?.path ?? MainRoutes.powerTimers.path);
          },
        ),
      );
    });

    return res;
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    required this.icon,
    required this.press,
    required this.isSelected,
  });

  final String title;
  final IconData icon;
  final VoidCallback press;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      enabled: !isSelected,
      leading: Padding(padding: const EdgeInsets.only(right: 15), child: Icon(icon, size: 22)),
      title: Text(title),
    );
  }
}
