import 'package:finance_app/common/app_colors.dart';
import 'package:flutter/material.dart';

class OnboardingIndicator extends StatelessWidget {
  final int totalDots;
  final int currentIndex;
  final Color activeColor;
  final Color inactiveColor;
  final double dotSize;
  final double spacing;

  const OnboardingIndicator({
    super.key,
    required this.totalDots,
    required this.currentIndex,
    this.activeColor = AppColors.primary,
    this.inactiveColor = Colors.transparent,
    required this.dotSize,
    required this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalDots,
        (index) => Container(
          width: dotSize,
          height: dotSize,
          margin: EdgeInsets.symmetric(horizontal: spacing / 2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == currentIndex ? activeColor : inactiveColor,
            border: Border.all(
              color: index == currentIndex
                  ? activeColor
                  : AppColors.borderBlack,
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
