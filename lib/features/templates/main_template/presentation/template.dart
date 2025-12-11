import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:timer_up/features/templates/main_template/presentation/main_menu.dart';
import 'package:timer_up/l10n/generated/core/core_localizations.dart';
import 'package:timer_up/l10n/generated/core/core_localizations.mapper.dart';

class MainTemplate extends StatefulWidget {
  const MainTemplate({super.key, required this.childWidget, this.screenName});

  final Widget childWidget;
  final String? screenName;

  @override
  State<MainTemplate> createState() => _MainTemplate();
}

class _MainTemplate extends State<MainTemplate> {
  static var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    final coreLoc = CoreLocalizations.of(context)!;

    var screenTitle = widget.screenName ?? "";
    screenTitle = screenTitle.isEmpty ? screenTitle : coreLoc.parseL10n("routes_$screenTitle");

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(screenTitle),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Symbols.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          PopupMenuButton(
            popUpAnimationStyle: AnimationStyle(duration: const Duration(milliseconds: 170)),
            onSelected: (int value) {
              switch (value) {
                case -99:
                  Future.delayed(const Duration(milliseconds: 230), () async {
                    // NIULoader.showGlobal();

                    // await ref.read(authStateProvider.notifier).logout();

                    // ref.read(routeProvider).goNamed(Routes.LOGIN.name);

                    // NIULoader.hideGlobal();
                  });
                  break;
                default:
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
              PopupMenuItem<int>(
                value: -99,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 10,
                  children: [
                    // Icon(Symbols.logout, size: 24, color: theme.colors.errorTextColorDarker),
                    // Text(authLoc.login_signOut),
                  ],
                ),
              ),
            ],
            elevation: 10,
            position: PopupMenuPosition.under,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10,
                children: [
                  // Icon(Symbols.person, size: 25, color: theme.colors.infoTextColor),
                  // Text(authState.email, style: theme.theme.textTheme.bodyLarge),
                  // const Icon(Symbols.arrow_drop_down, size: 18),
                ],
              ),
            ),
          ),
        ],
        //iconTheme: IconThemeData(color: theme.colors.defaultTextColor),
      ),
      key: scaffoldKey,
      drawer: const MainMenu(),
      body: SafeArea(
        child: SizedBox(height: size.height, child: widget.childWidget),
      ),
    );
  }
}
