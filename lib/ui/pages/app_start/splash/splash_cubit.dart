import 'package:finance_app/database/app_share_preference.dart';
import 'package:finance_app/models/enum/load_status.dart';
import 'package:finance_app/ui/pages/app_start/splash/splash_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final SplashNavigator navigator;

  SplashCubit({required this.navigator}) : super(const SplashState());

  Future<void> fetchInitData() async {
    final isFirstRun = await AppSharePreferences.isFirstRun();
    if (isFirstRun) {
      await navigator.openOnboardPage();
    } else {
      await navigator.openSignIn();
    }
  }
}
