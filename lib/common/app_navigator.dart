import 'package:finance_app/common/app_text_styles.dart';
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

  Future<void> showSimpleDialog({
    required String title,
    required String content,
    String textConfirm = "OK",
    String? textCancel,
    barrierDismissible = false,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title, style: AppTextStyles.blackGreenS14SemiBold),
          content: Text(content, style: AppTextStyles.blackGreenS14Medium),
          actions: [
            if (textCancel != null)
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  onCancel?.call();
                },
                child: Text(textCancel, style: AppTextStyles.blackGreenS14SemiBold),
              ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onConfirm?.call();
              },
              child: Text(textConfirm, style: AppTextStyles.blackGreenS14SemiBold),
            ),
          ],
        );
      },
    );
  }


}
