import 'package:finance_app/common/app_colors.dart';
import 'package:finance_app/models/enum/categories.dart';
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
      onTapDown: (_){
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_){
        setState(() {
          _isPressed = false;
        });
        widget.onPress;
      },
      onTapCancel: (){
        setState(() {
          _isPressed = false;
        });
      },
      child: _buildItemTransaction(),
    );
  }

  Widget _buildItemTransaction() {
    return SizedBox(
      height: 54.0,
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
          )
        ],
      ),
    );
  }
}
