import 'package:finance_app/common/app_colors.dart';
import 'package:finance_app/common/app_dimens.dart';
import 'package:finance_app/common/app_svgs.dart';
import 'package:finance_app/generated/l10n.dart';
import 'package:finance_app/ui/widgets/divider/app_divider.dart';
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
    this.topExpenseName,
    this.topExpenseAmount = 0,
    this.incomeLastWeek = 0,
    this.targetProgress = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: AppDimens.marginNormal,
        right: AppDimens.marginNormal,
        top: 34.0,
      ),
      height: 152.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: AppColors.primary,
      ),

      child: Padding(
        padding: const EdgeInsets.only(
          left: 36,
          right: 36,
          top: 22,
          bottom: 22,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildGoalWidget(context),
            AppDividers.vertical
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
        SvgPicture.asset(
          topExpenseIconPath!,
          width: 24,
          height: 24,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
