import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final TextStyle textStyle;
  final double? width;

  const AppTextButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.textStyle,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(label, style: textStyle),
    );
  }
}
