import 'package:finance_app/common/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  ///White
  static const white = TextStyle(color: AppColors.tWhite);

  static final whiteS52 = white.copyWith(fontSize: 52.0);
  static final whiteS52Bold = whiteS52.copyWith(fontWeight: FontWeight.w600);

  ///BlackGreen
  static const blackGreen = TextStyle(color: AppColors.tBlackGreen);

  //S14
  static final blackGreenS14 = blackGreen.copyWith(fontSize: 14.0);
  static final blackGreenS14Medium = blackGreenS14.copyWith(
    fontWeight: FontWeight.w500,
  );


  //S15
  static final blackGreenS15 = blackGreen.copyWith(fontSize: 15.0);
  static final blackGreenS15Medium = blackGreenS15.copyWith(
    fontWeight: FontWeight.w500,
  );

  //S16
  static final blackGreenS16 = blackGreen.copyWith(fontSize: 16.0);
  static final blackGreenS16Medium = blackGreenS16.copyWith(
    fontWeight: FontWeight.w500,
  );
  //S20
  static final blackGreenS20 = blackGreen.copyWith(fontSize: 20.0);
  static final blackGreenS20SemiBold = blackGreenS20.copyWith(
    fontWeight: FontWeight.w600,
  );

  //S30
  static final blackGreenS30 = blackGreen.copyWith(fontSize: 30.0);
  static final blackGreenS30SemiBold = blackGreenS30.copyWith(
    fontWeight: FontWeight.w600,
  );
}
