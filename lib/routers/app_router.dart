import 'package:finance_app/ui/pages/app_start/splash/splash_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static final navigationKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    initialLocation: splash,
    routes: _routes,
    navigatorKey: navigationKey,
    debugLogDiagnostics: true,
  );

  static const String splash = "/splash";
  static const String onBoarding = "/onboarding";
  static const String home = "/home";


  static final _routes = <RouteBase>[
    GoRoute(
      name: splash,
      path: splash,
      builder: (context, state) => const SplashPage(),
    ),
  ];
}
