import 'dart:developer';

import 'package:finance_app/common/app_colors.dart';
import 'package:finance_app/common/app_dimens.dart';
import 'package:finance_app/common/app_text_styles.dart';
import 'package:finance_app/models/enum/onboarding_steps.dart';
import 'package:finance_app/ui/pages/app_start/onboarding/onboarding_cubit.dart';
import 'package:finance_app/ui/pages/app_start/onboarding/onboarding_navigator.dart';
import 'package:finance_app/ui/pages/app_start/onboarding/widgets/onboarding_indicator.dart';
import 'package:finance_app/ui/pages/app_start/onboarding/widgets/onboarding_subpage.dart';
import 'package:finance_app/ui/widgets/app_buttons/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return OnboardingCubit(
          navigator: OnboardingNavigator(context: context),
        );
      },
      child: const OnboardingChildPage(),
    );
  }
}

class OnboardingChildPage extends StatefulWidget {
  const OnboardingChildPage({super.key});

  @override
  State<OnboardingChildPage> createState() => _OnboardingChildPageState();
}

class _OnboardingChildPageState extends State<OnboardingChildPage> {
  late OnboardingCubit _cubit;
  final PageController _pageController = PageController();

  @override
  void initState() {
    _cubit = BlocProvider.of<OnboardingCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: height * 2 / 3,
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppDimens.cornerRadius),
                  topRight: Radius.circular(AppDimens.cornerRadius),
                ),
              ),
            ),
          ),

          SafeArea(
            child: Container(
              margin: const EdgeInsets.only(top: 50.0, left: 45.0, right: 45.0),
              child: Center(child: _buildBodyPageView()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBodyPageView() {
    return BlocListener<OnboardingCubit, OnboardingState>(
      listenWhen: (previous, current) => previous.step != current.step,
      listener: (context, state) {
        _pageController.animateToPage(
          state.step.index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
        log("step: ${state.step.index}");
      },
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: OnboardingSteps.values.length,
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return OnboardingSubpage(step: OnboardingSteps.values[index]);
              },
            ),
          ),
          _buildFooterPage(),
        ],
      ),
    );
  }

  Widget _buildFooterPage() {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return Column(
          children: [
            OnboardingIndicator(
              totalDots: OnboardingSteps.values.length,
              currentIndex: state.step.index,
              dotSize: 13.0,
              spacing: 16.0,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppTextButton(
                  label: "Next",
                  onPressed: () {
                    _cubit.jumpNextStep();
                  },
                  textStyle: AppTextStyles.blackGreenS30SemiBold,
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
