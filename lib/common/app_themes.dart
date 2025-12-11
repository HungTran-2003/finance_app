import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  static const _font = "Poppins";

  ThemeData get theme {
    return ThemeData(
      primaryColor: AppColors.primary,
      fontFamily: _font,
      scaffoldBackgroundColor: AppColors.primary,
    );
  }
}
