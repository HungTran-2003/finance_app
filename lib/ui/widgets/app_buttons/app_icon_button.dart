import 'package:finance_app/common/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppIconButton extends StatelessWidget {
  final String asset;
  final VoidCallback? onPressed;
  final double size;
  final Color? bgColor;

  const AppIconButton({
    super.key,
    required this.asset,
    this.onPressed,
    required this.size,
    this.bgColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(bgColor),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.btCornerRadius),
          ),
        ),
      ),
      icon: SvgPicture.asset(
        asset,
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }
}
