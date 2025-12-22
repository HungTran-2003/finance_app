import 'package:finance_app/common/app_colors.dart';
import 'package:finance_app/common/app_svgs.dart';
import 'package:finance_app/common/app_text_styles.dart';
import 'package:finance_app/generated/l10n.dart';
import 'package:finance_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionTypeToggle extends StatelessWidget {
  final String? label;
  final bool? isSelected;
  final bool? isIncome;
  final double? value;
  final VoidCallback? onPress;
  final Color? colorIncome;
  final Color? colorExpense;
  final double? height;
  final double? width;

  const TransactionTypeToggle({
    super.key,
    this.label,
    this.isSelected = false,
    this.isIncome = true,
    this.value = 0.0,
    this.onPress,
    this.colorIncome = AppColors.primary,
    this.colorExpense = AppColors.oceanBlue,
    this.height = 100.0,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(15.0);

    return InkWell(
      onTap: onPress,
      borderRadius: borderRadius,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: isSelected! ? AppColors.oceanBlue : AppColors.secondary,
          borderRadius: borderRadius,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildIcon(),
              Text(
                label ?? "",
                style: !isSelected!
                    ? AppTextStyles.subTitle
                    : AppTextStyles.subTitle.copyWith(
                        color: AppColors.background,
                      ),
              ),
              _buildTextBalance(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon() {
    if (isSelected!) {
      return SvgPicture.asset(
        isIncome! ? AppSVGs.income : AppSVGs.expense,
        width: 25.0,
        height: 25.0,
        colorFilter: ColorFilter.mode(AppColors.background, BlendMode.srcIn),
      );
    }
    return SvgPicture.asset(
      isIncome! ? AppSVGs.income : AppSVGs.expense,
      width: 25.0,
      height: 25.0,
      colorFilter: ColorFilter.mode(
        isIncome! ? colorIncome! : colorExpense!,
        BlendMode.srcIn,
      ),
    );
  }

  Widget _buildTextBalance(BuildContext context){
    if(isSelected!){
      return Text(
        S.of(context).home_budget_income(Utils.formatCurrencyEN(value!)),
        style: AppTextStyles.title.copyWith(color: AppColors.background),
      );
    }
    return Text(
      S.of(context).home_budget_income(Utils.formatCurrencyEN(value!)),
      style: isIncome!
          ? AppTextStyles.title
          : AppTextStyles.title.copyWith(color: AppColors.oceanBlue),
    );
  }
}
