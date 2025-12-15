import 'package:finance_app/common/app_colors.dart';
import 'package:finance_app/common/app_dimens.dart';
import 'package:finance_app/common/app_text_styles.dart';
import 'package:flutter/material.dart';

class AuthBasePage extends StatelessWidget {
  final String title;
  final Widget child;
  const AuthBasePage({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBodyPage(),
    );
  }

  Widget _buildBodyPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 100),
        Text(
          title,
          style: AppTextStyles.blackGreenS30SemiBold,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 65.0),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppDimens.cornerRadius),
                topRight: Radius.circular(AppDimens.cornerRadius),
              ),
            ),
            child: child,
          ),
        ),
      ],
    );
  }
}
