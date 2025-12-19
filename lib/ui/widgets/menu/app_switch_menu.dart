import 'package:finance_app/common/app_colors.dart';
import 'package:finance_app/common/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppSwitchMenu extends StatelessWidget {
  final List<String> itemsName;
  final Function(int) itemPress;
  final int currentIndex;
  final Color? colorActive;
  final Color? colorInactive;
  final double? borderRadius;
  final double? height;

  const AppSwitchMenu({
    super.key,
    required this.itemsName,
    required this.itemPress,
    required this.currentIndex,
    this.colorActive = AppColors.primary,
    this.colorInactive = Colors.transparent,
    this.borderRadius = 18.0,
    this.height = 60.0,
  });

  @override
  Widget build(BuildContext context) {
    if (itemsName.isEmpty) return Container();
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius!),
        color: AppColors.secondary,
      ),
      child: Stack(children: [_buildAnimation(), _buildMenuName()]),
    );
  }

  Widget _buildAnimation() {
    return AnimatedAlign(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      alignment: Alignment((currentIndex / (itemsName.length - 1)) * 2 - 1, 0),
      child: FractionallySizedBox(
        widthFactor: 1 / itemsName.length,
        heightFactor: 1.0,
        child: Container(
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: colorActive,
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuName() {
    return Row(
      children: List.generate(itemsName.length, (index) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              itemPress(index);
            } ,
            behavior: HitTestBehavior.opaque,
            child: Center(
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: AppTextStyles.blackGreenS15Medium,
                child: Text(itemsName[index]),
              ),
            ),
          ),
        );
      }),
    );
  }
}
