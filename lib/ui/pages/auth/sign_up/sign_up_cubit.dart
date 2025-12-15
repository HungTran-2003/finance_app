import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:finance_app/models/enum/load_status.dart';
import 'package:finance_app/repositories/auth_repository.dart';
import 'package:finance_app/ui/pages/auth/sign_up/sign_up_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState>{
  final SignUpNavigator navigator;
  final AuthRepository authRepository;

  SignUpCubit({required this.navigator, required this.authRepository}) : super(const SignUpState());

  void signUp({
    required String email,
    required String password,
  }) async{
    emit(state.copyWith(status: LoadStatus.loading));
    try{
      await authRepository.signUp(email: email, password: password);
      emit(state.copyWith(status: LoadStatus.success, email: email, password: password));
    } catch(e){
      log(e.toString());
      emit(state.copyWith(status: LoadStatus.failure));
    }
  }

  void resetState(){
    emit(state.copyWith(status: LoadStatus.initial));
  }
}
