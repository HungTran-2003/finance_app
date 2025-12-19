import 'package:finance_app/common/app_colors.dart';
import 'package:finance_app/common/app_text_styles.dart';
import 'package:finance_app/generated/l10n.dart';
import 'package:finance_app/models/enum/categories.dart';
import 'package:finance_app/ui/widgets/divider/app_divider.dart';
import 'package:finance_app/utils/app_date_utils.dart';
import 'package:finance_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemTransaction extends StatefulWidget {
  final Categories category;
  final DateTime date;
  final String title;
  final double amount;
  final bool isIncome;
  final Color? colorPress;
  final Color? colorNormal;
  final VoidCallback? onPress;

  const ItemTransaction({
    super.key,
    required this.category,
    required this.date,
    required this.title,
    required this.amount,
    required this.isIncome,
    this.colorPress = AppColors.oceanBlue,
    this.colorNormal = AppColors.btLightBlue,
    this.onPress,
  });

  @override
  State<ItemTransaction> createState() => _ItemTransactionState();
}

class _ItemTransactionState extends State<ItemTransaction> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
        widget.onPress;
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: _buildItemTransaction(),
    );
  }

  Widget _buildItemTransaction() {
    return Container(
      height: 54.0,
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 57.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22.0),
              color: _isPressed ? widget.colorPress : widget.colorNormal,
            ),
            child: Center(
              child: SvgPicture.asset(
                widget.category.iconPath,
                width: 28,
                height: 24,
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                fit: BoxFit.cover,
              ),
            ),
          ),

          _buildTitle(),

          AppDividers(color: AppColors.primary).vertical,

          SizedBox(
            width: 70,
            child: Center(
              child: Text(
                widget.title,
                style: AppTextStyles.blackGreenS13Regular,
                maxLines: 1, overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          AppDividers(color: AppColors.primary).vertical,

          SizedBox(
            width: 70.0,
            child: Text(
              widget.isIncome
                  ? S
                        .of(context)
                        .home_budget_income(
                          Utils().formatCurrencyEN(widget.amount),
                        )
                  : S
                        .of(context)
                        .home_budget_expense(
                          Utils().formatCurrencyEN(widget.amount),
                        ),
              style: widget.isIncome
                  ? AppTextStyles.blackGreenS15Medium
                  : AppTextStyles.blackGreenS15Medium.copyWith(color: AppColors.tBlue),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return SizedBox(
      width: 90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.category.name, style: AppTextStyles.blackGreenS15Medium, maxLines: 1, overflow: TextOverflow.ellipsis,),
          Text(
            AppDateUtils.toDateString(widget.date),
            style: AppTextStyles.s12SemiBold.copyWith(color: AppColors.tBlue),
          ),
        ],
      ),
    );
  }
}
