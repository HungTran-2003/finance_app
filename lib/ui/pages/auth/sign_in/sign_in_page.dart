import 'package:finance_app/common/app_dimens.dart';
import 'package:finance_app/generated/l10n.dart';
import 'package:finance_app/ui/pages/auth/sign_in/sign_in_cubit.dart';
import 'package:finance_app/ui/pages/auth/sign_in/sign_in_navigator.dart';
import 'package:finance_app/ui/pages/auth/widgets/auth_page.dart';
import 'package:finance_app/ui/widgets/app_buttons/app_text_button.dart';
import 'package:finance_app/ui/widgets/text_field/input_text_field.dart';
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
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: AppDimens.cornerRadius),
          InputTextField(
            title: S.of(context).sign_in_email,
            hintText: S.of(context).sign_in_email_hint,
            controller: emailController,
          ),
          const SizedBox(height: 23.0),
          InputTextField(
            title: S.of(context).sign_in_password,
            hintText: S.of(context).sign_in_password_hint,
            controller: passwordController,
          ),
        ],
      ),
    );
  }
}
