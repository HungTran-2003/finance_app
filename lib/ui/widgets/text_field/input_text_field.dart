import 'package:finance_app/common/app_colors.dart';
import 'package:finance_app/common/app_text_styles.dart';
import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final Color? hintColor;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final double? marginTitle;

  const InputTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.hintColor,
    required this.controller,
    this.validator,
    this.marginTitle = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          title,
          style: AppTextStyles.blackGreenS15Medium,
        ),

        TextFormField(
          controller: controller,
          style: AppTextStyles.blackGreenS16Medium,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.only(top: 13, bottom: 14, left: 20, right: 19),
            filled: true,
            fillColor: AppColors.secondary,
            hintText: hintText,
            hintStyle: AppTextStyles.blackGreenS16Medium.copyWith(
              color: hintColor ?? AppColors.hintText,
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(18)),

            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(18)),
              borderSide: BorderSide(color: Colors.transparent)
            ),
            disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(18)),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(18)),
              borderSide: BorderSide(color: AppColors.error, width: 1.0),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(color: AppColors.error, width: 1.0),
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
