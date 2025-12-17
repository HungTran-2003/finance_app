import 'package:finance_app/common/app_colors.dart';
import 'package:flutter/material.dart';

class AppDividers {
  AppDividers._();

  static const horizontal = Divider(
    color: AppColors.divider,
    thickness: 1,
    height: 1,
  );

  static const vertical = VerticalDivider(
    color: AppColors.divider,
    thickness: 1,
    width: 1,
  );
}