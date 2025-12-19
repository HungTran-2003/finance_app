
import 'package:finance_app/common/app_text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TermsWidget extends StatelessWidget {
  final VoidCallback onTermsClick;
  final VoidCallback onPrivacyClick;

  const TermsWidget({
    super.key,
    required this.onTermsClick,
    required this.onPrivacyClick,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: AppTextStyles.blackGreenS14Regular,
        children: [
          const TextSpan(text: 'By continuing, you agree to\n'),
          TextSpan(
            text: 'Terms of Use',
            style: AppTextStyles.blackGreenS14SemiBold,
            recognizer: TapGestureRecognizer()
              ..onTap = onTermsClick,
          ),

          const TextSpan(text: ' and '),

          TextSpan(
            text: 'Privacy Policy.',
            style: AppTextStyles.blackGreenS14SemiBold,
            recognizer: TapGestureRecognizer()
              ..onTap = onPrivacyClick,
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
