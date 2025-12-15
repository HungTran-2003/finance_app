import 'package:finance_app/common/app_navigator.dart';
import 'package:finance_app/routers/app_router.dart';

class SignUpNavigator extends AppNavigator {
  SignUpNavigator({required super.context});

  Future<void> openHomePage() async{
    await pushReplacementName(AppRouter.home);
  }
}