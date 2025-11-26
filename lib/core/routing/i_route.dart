// Flutter & Dart
import 'package:flutter/material.dart';
// Router
import 'package:go_router/go_router.dart';

abstract interface class IRoute {
  final String path;
  final String name;

  const IRoute({required this.path, required this.name});

  Widget render(Map<String, dynamic>? parameters);

  RouteBase get route;
}
