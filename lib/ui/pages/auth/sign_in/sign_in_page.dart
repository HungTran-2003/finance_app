import 'dart:developer';

import 'package:finance_app/common/app_colors.dart';
import 'package:finance_app/common/app_dimens.dart';
import 'package:finance_app/common/app_text_styles.dart';
import 'package:finance_app/generated/l10n.dart';
import 'package:finance_app/ui/pages/auth/sign_in/sign_in_cubit.dart';
import 'package:finance_app/ui/pages/auth/sign_in/sign_in_navigator.dart';
import 'package:finance_app/ui/pages/auth/widgets/auth_page.dart';
import 'package:finance_app/ui/widgets/app_buttons/app_button.dart';
import 'package:finance_app/ui/widgets/app_buttons/app_text_button.dart';
import 'package:finance_app/ui/widgets/text_field/input_text_field.dart';
import 'package:finance_app/ui/widgets/text_field/password_text_field.dart';
import 'package:finance_app/utils/app_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return SignInCubit(navigator: SignInNavigator(context: context));
      },
      child: SignInChildPage(),
    );
  }
}

class SignInChildPage extends StatefulWidget {
  const SignInChildPage({super.key});

  @override
  State<SignInChildPage> createState() => _SignInChildPageState();
}

class _SignInChildPageState extends State<SignInChildPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AuthBasePage(
      title: S.of(context).title_sign_in,
      child: _buildBodyPage(),
    );
  }

  Widget _buildBodyPage() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppDimens.marginNormal),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: AppDimens.cornerRadius),
              InputTextField(
                title: S.of(context).sign_in_email,
                hintText: S.of(context).sign_in_email_hint,
                controller: emailController,
                validator: (value) {
                  String? message = AppValidator.validateEmpty(value);
                  message ??= AppValidator.validateEmail(value!);
                  return message;
                },
              ),
              const SizedBox(height: 23.0),
              AppPasswordTextField(
                title: S.of(context).sign_in_password,
                hintText: S.of(context).sign_in_password_hint,
                controller: passwordController,
                validator: (value) {
                  String? message = AppValidator.validateEmpty(value);
                  message ??= AppValidator.validatePassword(value!);
                  return message;
                },
              ),
              const SizedBox(height: 60.0,),
              _buildButtonsPage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonsPage(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppDimens.marginLarge),
      child: Column(
        children: [
          AppButton(label: S.of(context).sign_in_button, onPressed: (){
            if(_formKey.currentState!.validate()){
              log("Sign In");
            }
          },),
          const SizedBox(height: 4.0,),
          AppTextButton(label: S.of(context).sign_in_forgot_password, onPressed: (){}, textStyle: AppTextStyles.blackGreenS14Medium,),
          const SizedBox(height: 4.0,),
          AppButton(label: S.of(context).sign_in_button_register, onPressed: (){}, color: AppColors.secondary,)
        ],
      ),
    );
  }
}
