import 'package:finance_app/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TabIcons extends StatelessWidget {
  final String asset;
  final bool isSelected;
  const TabIcons({super.key, required this.asset, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 58.0,
      height: 52.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22.0),
        color: isSelected ? AppColors.primary : Colors.transparent,
      ),
      child: Center(
        child: SvgPicture.asset(
          asset,
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}
