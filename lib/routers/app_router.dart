import 'package:finance_app/ui/pages/app_start/onboarding/onboarding_page.dart';
import 'package:finance_app/ui/pages/app_start/splash/splash_page.dart';
import 'package:finance_app/ui/pages/auth/sign_in/sign_in_page.dart';
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
  static const String onboarding = "/onboarding";
  static const String home = "/home";
  static const String signIn = "/sign_in";

  static final _routes = <RouteBase>[
    GoRoute(
      name: splash,
      path: splash,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      name: onboarding,
      path: onboarding,
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      name: signIn,
      path: signIn,
      builder: (context, state) => const SignInPage(),
    ),
  ];
}
