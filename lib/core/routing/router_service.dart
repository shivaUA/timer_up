// Flutter & Dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// Router
import 'package:go_router/go_router.dart';
// TimerUp
import 'package:timer_up/core/routing/routes/home_routes.dart';
import 'package:timer_up/core/routing/i_route.dart';

final class RouterService {
  final navigatorKey = GlobalKey<NavigatorState>();
  final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  late final GoRouter router;

  RouterService() {
    router = GoRouter(
      initialLocation: '/',
      navigatorKey: navigatorKey,
      routes: [...HomeRoutes.routes()],
      debugLogDiagnostics: kDebugMode,
    );
  }

  Future<void> goTo({required IRoute route, Map<String, dynamic>? parameters}) async {
    navigatorKey.currentContext!.goNamed(route.name, extra: parameters);
  }

  Future<T?> push<T extends Object?>({
    required IRoute route,
    Map<String, dynamic>? parameters,
  }) async {
    return await navigatorKey.currentContext!.push(route.path, extra: parameters);
  }

  String get location =>
      navigatorKey.currentContext != null
          ? GoRouter.of(navigatorKey.currentContext!).state.path ?? "/"
          : "/";

  void pop<T extends Object>([T? result]) {
    var context = navigatorKey.currentState!.context;
    if (context.canPop()) {
      navigatorKey.currentState!.context.pop(result);
    }
  }
}
