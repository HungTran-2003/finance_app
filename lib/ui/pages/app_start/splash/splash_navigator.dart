import 'package:finance_app/common/app_navigator.dart';
import 'package:finance_app/routers/app_router.dart';

class SplashNavigator extends AppNavigator {
  SplashNavigator({required super.context});

  Future<void> openOnboardPage() async {
    await pushReplacementName(AppRouter.onboarding);
  }
}
