// Flutter & Dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// Router
import 'package:go_router/go_router.dart';
// TimerUp
import 'package:timer_up/core/routing/routes/main_routes.dart';
import 'package:timer_up/core/routing/routes/i_route.dart';
import 'package:timer_up/features/templates/main_template/presentation/template.dart';

final class RouterService {
  final _navigatorKey = GlobalKey<NavigatorState>();
  final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  final _mainTemplateKey = GlobalKey<NavigatorState>(debugLabel: 'main_template');
  late final GoRouter router;

  RouterService() {
    router = GoRouter(
      initialLocation: MainRoutes.powerTimers.path,
      navigatorKey: _navigatorKey,
      routes: [
        ShellRoute(
          navigatorKey: _mainTemplateKey,
          pageBuilder: (context, state, child) {
            var name = state.topRoute?.name ?? state.fullPath?.replaceAll("/", "");
            return MaterialPage(
              child: SelectionArea(
                child: MainTemplate(childWidget: child, screenName: name),
              ),
              name: name,
            );
          },
          routes: [...MainRoutes.routes()],
        ),
      ],
      debugLogDiagnostics: kDebugMode,
    );
  }

  Future<void> goTo({required IRoute route, Map<String, dynamic>? parameters}) async {
    _navigatorKey.currentContext!.goNamed(route.name, extra: parameters);
  }

  Future<T?> push<T extends Object?>({
    required IRoute route,
    Map<String, dynamic>? parameters,
  }) async {
    return await _navigatorKey.currentContext!.push(route.path, extra: parameters);
  }

  String get location => _navigatorKey.currentContext != null
      ? GoRouter.of(_navigatorKey.currentContext!).state.path ?? "/"
      : "/";

  void pop<T extends Object>([T? result]) {
    var context = _navigatorKey.currentState!.context;
    if (context.canPop()) {
      _navigatorKey.currentState!.context.pop(result);
    }
  }
}
