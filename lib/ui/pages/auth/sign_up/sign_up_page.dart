import 'dart:developer';

import 'package:finance_app/common/app_dimens.dart';
import 'package:finance_app/common/app_text_styles.dart';
import 'package:finance_app/generated/l10n.dart';
import 'package:finance_app/ui/pages/auth/sign_up/sign_up_cubit.dart';
import 'package:finance_app/ui/pages/auth/sign_up/sign_up_navigator.dart';
import 'package:finance_app/ui/pages/auth/sign_up/widgets/terms_widget.dart';
import 'package:finance_app/ui/pages/auth/widgets/auth_page.dart';
import 'package:finance_app/ui/widgets/app_buttons/app_button.dart';
import 'package:finance_app/ui/widgets/text_field/input_text_field.dart';
import 'package:finance_app/ui/widgets/text_field/password_text_field.dart';
import 'package:finance_app/utils/app_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return SignUpCubit(navigator: SignUpNavigator(context: context));
      },
      child: SignUpChildPage(),
    );
  }
}

class SignUpChildPage extends StatefulWidget {
  const SignUpChildPage({super.key});

  @override
  State<SignUpChildPage> createState() => _SignUpChildPageState();
}

class _SignUpChildPageState extends State<SignUpChildPage> {
  late SignUpCubit _cubit;

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void initState() {
    _cubit = BlocProvider.of<SignUpCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AuthBasePage(
      title: S.of(context).sign_up_title,
      child: _buildBodyPage(),
    );
  }

  Widget _buildBodyPage() {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Container(
        margin: const EdgeInsets.only(left: AppDimens.marginNormal, right: AppDimens.marginNormal, bottom: 50.0),
        child: Column(
          children: [
            _buildInputPage(),
            _buildFooterPage(),
          ],
        ),
      ),
    );
  }

  Widget _buildInputPage() {
    return Column(
      children: [
        const SizedBox(height: 16.0),
        InputTextField(
          title: S.of(context).sign_up_username,
          hintText: S.of(context).sign_up_username_hint,
          controller: usernameController,
          marginTitle: 16.0,
        ),
        const SizedBox(height: 16.0),
        InputTextField(
          title: S.of(context).sign_up_email,
          hintText: S.of(context).sign_up_email_hint,
          controller: emailController,
          marginTitle: 16.0,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            String? message = AppValidator.validateEmpty(value);
            message ??= AppValidator.validateEmail(value!);
            return message;
          },
        ),
        const SizedBox(height: 16.0),
        InputTextField(
          title: S.of(context).sign_up_phone,
          hintText: S.of(context).sign_up_phone,
          controller: phoneController,
          marginTitle: 16.0,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 16.0),
        InputTextField(
          title: S.of(context).sign_up_date_of_birth,
          hintText: S.of(context).sign_up_date_of_birth_hint,
          controller: dateOfBirthController,
          marginTitle: 16.0,
        ),
        const SizedBox(height: 16.0),
        AppPasswordTextField(
          title: S.of(context).sign_up_password,
          hintText: S.of(context).sign_up_password_hint,
          controller: passwordController,
          marginTitle: 16.0,
          validator: (value) {
            String? message = AppValidator.validateEmpty(value);
            message ??= AppValidator.validatePassword(value!);
            return message;
          }
        ),
        const SizedBox(height: 16.0),
        AppPasswordTextField(
          title: S.of(context).sign_up_password,
          hintText: S.of(context).sign_up_password_hint,
          controller: confirmPasswordController,
          marginTitle: 16.0,
          validator: (value) {
            String? message = AppValidator.validateEmpty(value);
            message ??= AppValidator.validatePassword(value!);
            message ??= AppValidator.validateConfirmPassword(value, passwordController.text);
            return message;
          }
        ),
      ],
    );
  }

  Widget _buildFooterPage() {
    return Column(
      children: [
        const SizedBox(height: 24.0),
        TermsWidget(
          onTermsClick: () {
            log("click terms");
          },
          onPrivacyClick: () {
            log("click privacy");
          },
        ),

        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 16, bottom: 16),
          child: AppButton(label: S.of(context).sign_up_button, onPressed: (){}),
        ),

        Text.rich(
          TextSpan(
            style: AppTextStyles.blackGreenS13,
            children: [
              const TextSpan(text: 'Already have an account? '),
              TextSpan(
                text: 'Sign in',
                style: AppTextStyles.blackGreenS13.copyWith(
                  color: Colors.blue,
                ),
                recognizer: TapGestureRecognizer()..onTap = (){
                  _cubit.navigator.pop();
                }
              )
            ]
          )
        )
      ],
    );
  }
}
