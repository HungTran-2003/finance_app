import 'package:finance_app/common/app_text_styles.dart';
import 'package:finance_app/models/enum/onboarding_steps.dart';
import 'package:flutter/material.dart';

class OnboardingSubpage extends StatelessWidget {
  final OnboardingSteps step;
  const OnboardingSubpage({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 122,
          child: Center(
            child: Text(
              step.title,
              style: AppTextStyles.blackGreenS30SemiBold,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 150.0),
        Image.asset(step.asset, width: 287, height: 288, fit: BoxFit.cover),
      ],
    );
  }
}
