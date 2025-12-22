import 'package:equatable/equatable.dart';
import 'package:finance_app/ui/pages/account_balance/account_balance_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'account_balance_state.dart';

class AccountBalanceCubit extends Cubit<AccountBalanceState> {
  final AccountBalanceNavigator navigator;

  AccountBalanceCubit({required this.navigator}) : super(const AccountBalanceState());

}