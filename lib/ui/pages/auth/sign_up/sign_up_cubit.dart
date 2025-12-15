import 'package:equatable/equatable.dart';
import 'package:finance_app/ui/pages/auth/sign_up/sign_up_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState>{
  final SignUpNavigator navigator;
  SignUpCubit({required this.navigator}) : super(const SignUpState());


}
