// Dart & Flutter
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// Router
import 'package:go_router/go_router.dart';
// TimerUp
import 'package:timer_up/core/routing/i_route.dart';
import 'package:timer_up/features/home/home_page.dart';

enum HomeRoutes implements IRoute {
  home(path: '/', name: 'Home');

  @override
  final String path;
  @override
  final String name;

  const HomeRoutes({required this.path, required this.name});

  @override
  Widget render(Map<String, dynamic>? parameters) {
    switch (this) {
      case HomeRoutes.home:
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
