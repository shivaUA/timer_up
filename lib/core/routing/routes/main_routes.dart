// Dart & Flutter
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// Router
import 'package:go_router/go_router.dart';
// TimerUp
import 'package:timer_up/core/routing/routes/i_route.dart';
import 'package:timer_up/features/home/home_page.dart';

enum MainRoutes implements IRoute {
  powerTimers(path: "/powerTimers", name: 'powerTimers'),
  stopwatch(path: "/stopwatch", name: 'stopwatch'),
  alarms(path: "/reminders", name: 'reminders'),
  interruptionTimers(path: "/interruptionTimers", name: 'interruptionTimers'),
  settings(path: "/settings", name: 'settings');

  @override
  final String path;
  @override
  final String name;

  const MainRoutes({required this.path, required this.name});

  @override
  Widget render(Map<String, dynamic>? parameters) {
    switch (this) {
      case MainRoutes.powerTimers:
        return BlocProvider(
          create: (context) => MyPageCubit(),
          child: const MyHomePage(title: "Test Title"),
        );
      default:
        return BlocProvider(
          create: (context) => MyPageCubit(),
          child: const MyHomePage(title: "Test Title"),
        );
    }
  }

  @override
  RouteBase get route {
    return GoRoute(
      name: name,
      path: path,
      builder: (context, state) => render(state.extra as Map<String, dynamic>?),
    );
  }

  static List<RouteBase> routes() => values.map((route) => route.route).toList();
}
