import 'package:finance_app/common/app_navigator.dart';
import 'package:finance_app/routers/app_router.dart';

class HomeNavigator extends AppNavigator {
  HomeNavigator({required super.context});

  Future<void> openAccountBalancePage() async{
    await pushName(AppRouter.accountBalance);

  }
}