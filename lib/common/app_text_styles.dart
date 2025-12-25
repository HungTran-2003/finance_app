import 'package:finance_app/common/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  ///White
  static const white = TextStyle(color: AppColors.tWhite);

  //S20
  static final whiteS20 = white.copyWith(fontSize: 20.0);
  static final whiteS20SemiBold = whiteS20.copyWith(
    fontWeight: FontWeight.w600,
  );

  //S24
  static final whiteS24 = white.copyWith(fontSize: 24.0);
  static final whiteS24Bold = whiteS24.copyWith(fontWeight: FontWeight.w700);

  //S52
  static final whiteS52 = white.copyWith(fontSize: 52.0);
  static final whiteS52Bold = whiteS52.copyWith(fontWeight: FontWeight.w600);

  ///BlackGreen
  static const blackGreen = TextStyle(color: AppColors.tBlackGreen);

  //S12
  static final blackGreenS12 = blackGreen.copyWith(fontSize: 12.0);
  static final blackGreenS12Regular = blackGreenS12.copyWith(
    fontWeight: FontWeight.w400,
  );
  static final s12SemiBold = blackGreenS12.copyWith(
    fontWeight: FontWeight.w600,
  );

  //S13
  static final blackGreenS13 = blackGreen.copyWith(fontSize: 13.0);
  static final blackGreenS13Medium = blackGreenS13.copyWith(
    fontWeight: FontWeight.w500,
  );
  static final blackGreenS13Regular = blackGreenS13.copyWith(
    fontWeight: FontWeight.w400,
  );

  //S14
  static final blackGreenS14 = blackGreen.copyWith(fontSize: 14.0);
  static final blackGreenS14Medium = blackGreenS14.copyWith(
    fontWeight: FontWeight.w500,
  );
  static final blackGreenS14Regular = blackGreenS14.copyWith(
    fontWeight: FontWeight.w400,
  );
  static final blackGreenS14SemiBold = blackGreenS14.copyWith(
    fontWeight: FontWeight.w600,
  );

  //S15
  static final blackGreenS15 = blackGreen.copyWith(fontSize: 15.0);
  static final blackGreenS15Medium = blackGreenS15.copyWith(
    fontWeight: FontWeight.w500,
  );
  static final blackGreenS15Bold = blackGreenS15.copyWith(
    fontWeight: FontWeight.w700,
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

  static const subTitle = TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.w500,
    color: AppColors.tBlackGreen,
  );

  static const title = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    color: AppColors.tBlackGreen,
  );

  static const subText = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: AppColors.tBlackGreen,
  );
}
