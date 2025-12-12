import 'package:finance_app/common/app_colors.dart';
import 'package:finance_app/common/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final TextStyle? style;
  final double? width;
  final double? height;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color,
    this.textColor,
    this.style,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        overlayColor: Colors.white.withAlpha(20),
        minimumSize: Size(width ?? double.infinity, height ?? 45.0),
      ),
      child: Text(label, style: style ?? AppTextStyles.blackGreenS20SemiBold),
    );
  }
}
