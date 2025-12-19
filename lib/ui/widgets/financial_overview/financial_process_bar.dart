import 'package:finance_app/common/app_colors.dart';
import 'package:finance_app/common/app_text_styles.dart';
import 'package:finance_app/generated/l10n.dart';
import 'package:finance_app/utils/utils.dart';
import 'package:flutter/material.dart';

class FinancialProcessBar extends StatelessWidget {
  final double? percentage;
  final double? budgetLimit;

  const FinancialProcessBar({
    super.key,
    this.percentage = 0,
    this.budgetLimit = 0,
  });

  @override
  Widget build(BuildContext context) {
    final double safePercentage = percentage!.clamp(0.0, 1.0);

    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxWidth = constraints.maxWidth;
        final double progressWidth = maxWidth * safePercentage;
        final double height = 30.0;

        return Container(
          height: height,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(13.0)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(13.0),
            child: Stack(
              children: [
                Container(
                  height: height,
                  width: maxWidth,
                  color: AppColors.secondary,
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeOutCubic,
                  width: progressWidth,
                  height: height,
                  decoration: BoxDecoration(
                    color: AppColors.processBar,
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                ),
                SizedBox(
                  width: maxWidth,
                  height: height,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildTextProcess(
                          "${(percentage! * 100).toInt()}%",
                          true,
                        ),
                        _buildTextProcess(
                          S
                              .of(context)
                              .home_budget_income(
                                Utils().formatCurrencyEN(budgetLimit!),
                              ),
                          false,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextProcess(String label, bool isPercentage) {
    return Stack(
      children: [
        Text(
          label,
          style: AppTextStyles.blackGreenS13Medium.copyWith(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 4
              ..color = isPercentage ? AppColors.processBar : AppColors.tWhite,
            fontStyle: isPercentage ? FontStyle.normal : FontStyle.italic,
          ),
        ),

        Text(
          label,
          style: AppTextStyles.blackGreenS13Medium.copyWith(
            color: isPercentage ? AppColors.tWhite : AppColors.processBar,
            fontStyle: isPercentage ? FontStyle.normal : FontStyle.italic,
          ),
        ),
      ],
    );
  }
}
