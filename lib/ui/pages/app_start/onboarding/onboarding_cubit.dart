import 'package:equatable/equatable.dart';
import 'package:finance_app/database/app_share_preference.dart';
import 'package:finance_app/models/enum/onboarding_steps.dart';
import 'package:finance_app/ui/pages/app_start/onboarding/onboarding_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final OnboardingNavigator navigator;

  OnboardingCubit({required this.navigator}) : super(const OnboardingState());

  void jumpNextStep() async {
    final currentStep = state.step;
    final nextStep = currentStep.nextStep;
    if (nextStep == null) {
      await AppSharePreferences.setFirstRun(value: false);
      await navigator.openSignIn();
    }
    emit(state.copyWith(step: nextStep));
  }
}
