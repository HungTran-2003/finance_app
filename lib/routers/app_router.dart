import 'package:finance_app/ui/pages/account_balance/account_balance_page.dart';
import 'package:finance_app/ui/pages/analysis/analysis_page.dart';
import 'package:finance_app/ui/pages/app_start/onboarding/onboarding_page.dart';
import 'package:finance_app/ui/pages/app_start/splash/splash_page.dart';
import 'package:finance_app/ui/pages/auth/sign_in/sign_in_page.dart';
import 'package:finance_app/ui/pages/auth/sign_up/sign_up_page.dart';
import 'package:finance_app/ui/pages/category/category_page.dart';
import 'package:finance_app/ui/pages/home/home_page.dart';
import 'package:finance_app/ui/pages/main/main_page.dart';
import 'package:finance_app/ui/pages/quickly_analysis/quickly_analysis_page.dart';
import 'package:finance_app/ui/pages/transactions/transaction_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static final navigationKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    initialLocation: _homePath,
    routes: _routes,
    navigatorKey: navigationKey,
    debugLogDiagnostics: true,
  );

  static const String splash = "/splash";
  static const String onboarding = "/onboarding";
  static const String home = "home";
  static const String signIn = "/sign_in";
  static const String signUp = "/sign_up";
  static const String accountBalance = "account_balance";
  static const String quicklyAnalysis = "quickly_analysis";
  static const String analysis = "analysis";
  static const String categories = "categories";
  static const String profile = "profile";
  static const String transactions = "transactions";

  //Path
  static const String _splashPath = "/splash";
  static const String _analysisPath = "/analysis";
  static const String _homePath = "/home";
  static const String _categoriesPath = "/categories";
  static const String _profilePath = "/profile";
  static const String _transactionsPath = "/transactions";


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
    GoRoute(
      name: signUp,
      path: signUp,
      builder: (context, state) => const SignUpPage(),
    ),
    ShellRoute(
      builder: (context, state, child) {
        return MainPage(child: child,);
      },
      routes: [
        GoRoute(
          name: home,
          path: _homePath,
          builder: (context, state) => const HomePage(),
          routes: [
            GoRoute(
              name: accountBalance,
              path: accountBalance,
              builder: (context, state) => const AccountBalancePage(),
            ),
            GoRoute(
              name: quicklyAnalysis,
              path: quicklyAnalysis,
              builder: (context, state) => const QuicklyAnalysisPage(),
            )
          ]
        ),
        GoRoute(
          name: analysis,
          path: _analysisPath,
          builder: (context, state) => const AnalysisPage(),
        ),

        GoRoute(
          name: categories,
          path: _categoriesPath,
          builder: (context, state) => const CategoryPage(),
        ),

        GoRoute(
          name: transactions,
          path: _transactionsPath,
          builder: (context, state) => const TransactionPage(),
        )
      ]
    ),
  ];
}
