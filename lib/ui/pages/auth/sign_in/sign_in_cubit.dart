import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:finance_app/models/enum/load_status.dart';
import 'package:finance_app/repositories/auth_repository.dart';
import 'package:finance_app/ui/pages/auth/sign_in/sign_in_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInNavigator navigator;
  final AuthRepository authRepository;

  SignInCubit({required this.navigator, required this.authRepository})
    : super(const SignInState());

  void signIn(String email, String password) async {
    emit(state.copyWith(signInStatus: LoadStatus.loading));
    try {
      final result = await authRepository.signIn(
        email: email,
        password: password,
      );
      if (result) {
        emit(state.copyWith(signInStatus: LoadStatus.success));
      }
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(signInStatus: LoadStatus.failure));
    }
  }

  void resetState() {
    emit(state.copyWith(signInStatus: LoadStatus.initial));
  }
}
