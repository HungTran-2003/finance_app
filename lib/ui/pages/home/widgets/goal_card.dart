import 'dart:developer';

import 'package:finance_app/common/app_colors.dart';
import 'package:finance_app/common/app_svgs.dart';
import 'package:finance_app/common/app_text_styles.dart';
import 'package:finance_app/generated/l10n.dart';
import 'package:finance_app/ui/widgets/app_buttons/app_icon_button.dart';
import 'package:finance_app/ui/widgets/divider/app_divider.dart';
import 'package:finance_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoalCard extends StatelessWidget {
  final String? topExpenseIconPath;
  final String? topExpenseName;
  final double? topExpenseAmount;
  final double? incomeLastWeek;
  final double? targetProgress;
  const GoalCard({
    super.key,
    this.topExpenseIconPath = AppSVGs.add,
    this.topExpenseName = "Empty",
    this.topExpenseAmount = 0,
    this.incomeLastWeek = 0,
    this.targetProgress = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 154.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: AppColors.primary,
      ),

      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          top: 22,
          right: 16,
          bottom: 20,
        ),
        child: Row(
          children: [
            SizedBox(width: 70, child: _buildGoalWidget(context)),
            const SizedBox(width: 16.0),
            AppDividers(thickness: 2).vertical,
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildWeeklySummary(
                    S.of(context).home_revenue_last_week,
                    incomeLastWeek!,
                    true,
                    context,
                  ),
                  AppDividers(thickness: 2).horizontal,
                  _buildWeeklySummary(
                    S.of(context).home_top_expense_last_week(topExpenseName!),
                    topExpenseAmount!,
                    false,
                    context,
                    iconPath: topExpenseIconPath,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGoalWidget(BuildContext context) {
    return Column(
      children: [
        _buildProgressWidget(),
        Text(
          topExpenseIconPath! == AppSVGs.add
              ? S.of(context).home_message_goal_add
              : S.of(context).home_message_goal,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildProgressWidget() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            border: BoxBorder.all(color: AppColors.background, width: 3),
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(
          width: 68,
          height: 68,
          child: CircularProgressIndicator(
            value: targetProgress,
            strokeWidth: 4,
            backgroundColor: Colors.transparent,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.tBlue),
          ),
        ),
        AppIconButton(asset: topExpenseIconPath!, size: 24, onPressed: (){
          log("jadad");
        },)
      ],
    );
  }

  Widget _buildWeeklySummary(
    String title,
    double value,
    bool isIncome,
    BuildContext context, {
    String? iconPath = AppSVGs.salary,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 28.0,
          child: SvgPicture.asset(
            iconPath!,
            width: 28,
            height: 28,
            fit: BoxFit.fitWidth,
          ),
        ),
        const SizedBox(width: 4.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTextStyles.blackGreenS12Regular),
            Text(
              isIncome
                  ? S
                        .of(context)
                        .home_budget_income(Utils().formatCurrencyEN(value))
                  : S
                        .of(context)
                        .home_budget_expense(Utils().formatCurrencyEN(value)),
              style: isIncome
                  ? AppTextStyles.blackGreenS15Bold
                  : AppTextStyles.blackGreenS15Bold.copyWith(
                      color: AppColors.tBlue,
                    ),
            ),
          ],
        ),
      ],
    );
  }
}
