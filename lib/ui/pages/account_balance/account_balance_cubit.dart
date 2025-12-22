
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:finance_app/models/entities/transaction.dart';
import 'package:finance_app/models/enum/load_status.dart';
import 'package:finance_app/ui/pages/account_balance/account_balance_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'account_balance_state.dart';

class AccountBalanceCubit extends Cubit<AccountBalanceState> {
  final AccountBalanceNavigator navigator;

  AccountBalanceCubit({required this.navigator}) : super(const AccountBalanceState());

  void fetchDate({int? page = 1}) async {
    emit(state.copyWith(loadStatus: LoadStatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 2));
      final transactions = TransactionEntity.mockData;
      emit(state.copyWith(loadStatus: LoadStatus.success, transactions: transactions));
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(loadStatus: LoadStatus.failure));
    }
  }
}