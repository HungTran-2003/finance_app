import 'package:finance_app/common/app_colors.dart';
import 'package:flutter/material.dart';

class AppDividers {
  final double? width;
  final double? height;
  final double? thickness;
  final Color? color;


  const AppDividers({
    this.width = 1,
    this.height = 1,
    this.thickness = 1,
    this.color = AppColors.divider,
  });

  Divider get horizontal => Divider(
    color: color,
    thickness: thickness,
    height: height,
  );

  VerticalDivider get vertical => VerticalDivider(
    color: color,
    thickness: thickness,
    width: width,
  );
}