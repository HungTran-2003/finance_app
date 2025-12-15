import 'dart:developer';

import 'package:finance_app/common/app_colors.dart';
import 'package:finance_app/common/app_dimens.dart';
import 'package:finance_app/common/app_svgs.dart';
import 'package:finance_app/common/app_text_styles.dart';
import 'package:finance_app/generated/l10n.dart';
import 'package:finance_app/ui/pages/auth/sign_in/sign_in_cubit.dart';
import 'package:finance_app/ui/pages/auth/sign_in/sign_in_navigator.dart';
import 'package:finance_app/ui/pages/auth/widgets/auth_page.dart';
import 'package:finance_app/ui/widgets/app_buttons/app_button.dart';
import 'package:finance_app/ui/widgets/app_buttons/app_icon_button.dart';
import 'package:finance_app/ui/widgets/app_buttons/app_text_button.dart';
import 'package:finance_app/ui/widgets/text_field/input_text_field.dart';
import 'package:finance_app/ui/widgets/text_field/password_text_field.dart';
import 'package:finance_app/ui/widgets/text_span/app_text_span.dart';
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
  late SignInCubit _cubit;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _cubit = BlocProvider.of<SignInCubit>(context);
    super.initState();
  }

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
              const SizedBox(height: 20.0),
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
              const SizedBox(height: 40.0),
              _buildButtonsPage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonsPage() {
    return Container(
      margin: const EdgeInsets.only(left: AppDimens.marginLarge, right: AppDimens.marginLarge, bottom: 60.0),
      child: Column(
        children: [
          AppButton(
            label: S.of(context).sign_in_button,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                log("Sign In");
              }
            },
          ),
          const SizedBox(height: 4.0),
          AppTextButton(
            label: S.of(context).sign_in_forgot_password,
            onPressed: () {},
            textStyle: AppTextStyles.blackGreenS14Medium,
          ),
          const SizedBox(height: 4.0),
          AppButton(
            label: S.of(context).sign_in_button_register,
            onPressed: () {
              _cubit.navigator.openSignUpPage();
            },
            color: AppColors.secondary,
          ),
          const SizedBox(height: 23.0),

          AppTextSpan(
            rawText: S.of(context).sign_in_login_fingerprint,
            styles: [
              AppTextStyles.blackGreenS14SemiBold.copyWith(color: Colors.blue),
            ],
            texts: [S.of(context).sign_in_text_fingerprint],
            defaultStyle: AppTextStyles.blackGreenS14SemiBold,
            onPress: [
              () {
                log("click fingerprint");
              },
            ],
          ),
          const SizedBox(height: 28.0),

          Text(
            S.of(context).sign_in_text_other_login,
            style: AppTextStyles.blackGreenS13,
          ),

          const SizedBox(height: 19.0),
          _buildLogoLoginOther(),
        ],
      ),
    );
  }

  Widget _buildLogoLoginOther() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 18,
      children: [
        AppIconButton(
          asset: AppSVGs.logoFacebook,
          size: 45.0,
          onPressed: () {
            log("click facebook");
          },
        ),

        AppIconButton(
          asset: AppSVGs.logoGoogle,
          size: 45.0,
          onPressed: () {
            log("click google");
          },
        ),
      ],
    );
  }
}
