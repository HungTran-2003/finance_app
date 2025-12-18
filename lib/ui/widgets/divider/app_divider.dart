import 'package:finance_app/common/app_colors.dart';
import 'package:flutter/material.dart';

class AppDividers {
  final double? width;
  final double? height;
  final double? thickness;

  const AppDividers({
    this.width = 1,
    this.height = 1,
    this.thickness = 1,
  });

  Divider get horizontal => Divider(
    color: AppColors.divider,
    thickness: thickness,
    height: height,
  );

  VerticalDivider get vertical => VerticalDivider(
    color: AppColors.divider,
    thickness: thickness,
    width: width,
  );
}