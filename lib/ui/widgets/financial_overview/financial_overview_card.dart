import 'package:finance_app/common/app_colors.dart';
import 'package:finance_app/common/app_svgs.dart';
import 'package:finance_app/common/app_text_styles.dart';
import 'package:finance_app/generated/l10n.dart';
import 'package:finance_app/ui/widgets/divider/app_divider.dart';
import 'package:finance_app/ui/widgets/financial_overview/financial_process_bar.dart';
import 'package:finance_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FinancialOverviewCard extends StatelessWidget {
  final double? totalBalance;
  final double? totalExpense;
  final double? budgetLimit;
  final double? percentage;
  final VoidCallback? onPress;

  const FinancialOverviewCard({
    super.key,
    this.totalBalance,
    this.totalExpense,
    this.budgetLimit,
    this.percentage,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 52.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTitleFinancial(
                S.of(context).home_total_balance,
                context,
                value: totalBalance,
              ),
              AppDividers().vertical,
              _buildTitleFinancial(
                S.of(context).home_total_expense,
                context,
                value: totalExpense,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20.0),
        FinancialProcessBar(percentage: percentage, budgetLimit: budgetLimit),
        const SizedBox(height: 10.0),
        _buildMessage(context),
      ],
    );
  }

  Widget _buildTitleFinancial(
    String title,
    BuildContext context, {
    double? value = 0,
  }) {
    final isIncome = title == S.of(context).home_total_balance;
    return InkWell(
      onTap: onPress,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                isIncome ? AppSVGs.income : AppSVGs.expense,
                width: 12,
                height: 12,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 6.0),
              Text(title, style: AppTextStyles.blackGreenS12Regular),
            ],
          ),
          Text(
            isIncome
                ? S
                      .of(context)
                      .home_budget_income(Utils().formatCurrencyEN(value!))
                : S
                      .of(context)
                      .home_budget_expense(Utils().formatCurrencyEN(value!)),
            style: isIncome
                ? AppTextStyles.whiteS24Bold
                : AppTextStyles.whiteS24Bold.copyWith(color: AppColors.tBlue),
          ),


        ],
      ),
    );
  }

  Widget _buildMessage(BuildContext context){
    String message = S.of(context).home_message_good("${percentage! * 100}%");
    if(percentage! > 0.5) {
      message = S.of(context).home_message_bad("$percentage%");
    }
    return Text(
      message,
      style: AppTextStyles.blackGreenS14Regular,
      textAlign: TextAlign.center,
    );
  }
}
