import 'package:finance_app/common/app_colors.dart';
import 'package:finance_app/common/app_dimens.dart';
import 'package:finance_app/common/app_svgs.dart';
import 'package:finance_app/common/app_text_styles.dart';
import 'package:finance_app/ui/widgets/app_buttons/app_icon_button.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget{
  final String? title;
  final bool? isBack;
  final String? actionPath;
  final VoidCallback? onPressBack;
  final VoidCallback? onPressAction;

  const AppBarWidget({
    super.key,
    this.title,
    this.isBack = false,
    this.actionPath = AppSVGs.notification,
    this.onPressBack,
    this.onPressAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: AppBar(
        title: Text(title ?? "", style: AppTextStyles.title,),
        centerTitle: true,
        leading: isBack! ? IconButton(
          onPressed: onPressBack,
          icon: const Icon(Icons.arrow_back, size: 24, color: AppColors.background,),
        ) : null,
        actions: [
          AppIconButton(asset: actionPath!, size: 24, onPressed: onPressAction, bgColor: AppColors.background,)
        ],
        backgroundColor: AppColors.primary,
        scrolledUnderElevation: 0,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppDimens.appBarHeight);
}
