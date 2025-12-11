import 'package:finance_app/routers/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigator {
  BuildContext context;

  AppNavigator({required this.context});

  void pop({Object? extra}) {
    GoRouter.of(context).pop(extra);
  }

  Future<dynamic> pushName(String name, {Object? arguments}) {
    return GoRouter.of(context).pushNamed(name, extra: arguments);
  }

  Future<dynamic> pushReplacementName(String name, {Object? arguments}) {
    return GoRouter.of(context).pushReplacementNamed(name, extra: arguments);
  }

  Future<void> openSignIn() async {
    // while (GoRouter.of(context).canPop()) {
    //   GoRouter.of(context).pop();
    // }
    // return GoRouter.of(context).pushReplacementNamed(AppRouter.login);
    GoRouter.of(context).go(AppRouter.signIn);
  }
}
