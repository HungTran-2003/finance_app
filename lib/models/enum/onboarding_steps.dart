import 'package:finance_app/common/app_images.dart';
import 'package:finance_app/generated/l10n.dart';

enum OnboardingSteps {
  step1,
  step2;

  static OnboardingSteps? stepFromIndex(int index) {
    switch (index) {
      case 0:
        return OnboardingSteps.step1;
      case 1:
        return OnboardingSteps.step2;
      default:
        return null;
    }
  }
}

extension OnboardingStepExt on OnboardingSteps {
  int get index {
    switch (this) {
      case OnboardingSteps.step1:
        return 0;
      case OnboardingSteps.step2:
        return 1;
    }
  }

  OnboardingSteps? get nextStep {
    switch (this) {
      case OnboardingSteps.step1:
        return OnboardingSteps.step2;
      case OnboardingSteps.step2:
        return null;
    }
  }

  String get title {
    switch (this) {
      case OnboardingSteps.step1:
        return S.current.onboarding_title_01;
      case OnboardingSteps.step2:
        return S.current.onboarding_title_02;
    }
  }

  String get asset {
    switch (this) {
      case OnboardingSteps.step1:
        return AppImages.onboard1;
      case OnboardingSteps.step2:
        return AppImages.onboard2;
    }
  }
}
