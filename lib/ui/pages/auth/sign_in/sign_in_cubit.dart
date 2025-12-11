import 'package:equatable/equatable.dart';
import 'package:finance_app/models/enum/load_status.dart';
import 'package:finance_app/ui/pages/auth/sign_in/sign_in_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInNavigator navigator;

  SignInCubit({required this.navigator}) : super(const SignInState());

}