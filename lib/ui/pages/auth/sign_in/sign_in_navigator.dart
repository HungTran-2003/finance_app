import 'package:finance_app/common/app_navigator.dart';
import 'package:finance_app/routers/app_router.dart';

class SignInNavigator extends AppNavigator{
  SignInNavigator({required super.context});

  Future<void> openSignUpPage() async{
    await pushName(AppRouter.signUp);
  }
}