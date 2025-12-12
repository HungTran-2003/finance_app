import 'package:finance_app/common/app_colors.dart';
import 'package:finance_app/common/app_text_styles.dart';
import 'package:flutter/material.dart';


class AppPasswordTextField extends StatefulWidget {
  final String title;
  final String hintText;
  final Color? hintColor;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final double? marginTitle;

  const AppPasswordTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.hintColor,
    required this.controller,
    this.validator,
    this.marginTitle = 0,
  });

  @override
  State<AppPasswordTextField> createState() => _AppPasswordTextFieldState();
}

class _AppPasswordTextFieldState extends State<AppPasswordTextField> {
  bool _isObscured = true;
  void _toggleObscured() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          widget.title,
          style: AppTextStyles.blackGreenS15Medium,
        ),

        TextFormField(
          controller: widget.controller,
          style: AppTextStyles.blackGreenS16Medium,
          textAlignVertical: TextAlignVertical.center,
          obscureText: _isObscured,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.only(top: 13, bottom: 14, left: 20, right: 19),
            filled: true,
            fillColor: AppColors.secondary,
            hintText: widget.hintText,
            hintStyle: AppTextStyles.blackGreenS16Medium.copyWith(
              color: widget.hintColor ?? AppColors.hintText,
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
            suffixIcon: IconButton(
              onPressed: _toggleObscured,
              icon: Icon(
                _isObscured ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          validator: widget.validator,
        ),
      ],
    );
  }
}
