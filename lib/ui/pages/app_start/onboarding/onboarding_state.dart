part of 'onboarding_cubit.dart';

class OnboardingState extends Equatable {
  final OnboardingSteps step;

  const OnboardingState({this.step = OnboardingSteps.step1});

  OnboardingState copyWith({OnboardingSteps? step}) {
    return OnboardingState(step: step ?? this.step);
  }

  @override
  List<Object?> get props => [step];
}
