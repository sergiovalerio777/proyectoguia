import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loginprueba/freatures/home/screens/home_screen.dart';
import 'package:loginprueba/freatures/login/screens/login_screen.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/inicio',
  routes: [
    // Ruta inicio
    GoRoute(
      path: '/inicio',
      name: 'inicio',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
