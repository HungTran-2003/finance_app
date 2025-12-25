import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:finance_app/models/entities/transaction.dart';
import 'package:finance_app/models/enum/load_status.dart';
import 'package:finance_app/models/enum/time.dart';
import 'package:finance_app/ui/pages/home/home_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';
class HomeCubit extends Cubit<HomeState> {
  final HomeNavigator navigator;

  HomeCubit({required this.navigator}) : super(const HomeState());

  void test(){
    emit(state.copyWith(testPro: 0.9));
  }

  void changePage(int page){
    if(page == state.page) return;
    emit(state.copyWith(page: page));
    getTransactionsWithTime(index: page);
  }

  void getTransactionsWithTime({int? index = 0}) async{
    emit(state.copyWith(loadStatus: LoadStatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 2));
      if(index != state.page) return;
      List<TransactionEntity> result = [];
      if(TimeFrame.fromIndex(index!) == TimeFrame.daily){
        result = TransactionEntity.mockData;
      }
      emit(state.copyWith(transactions: result, loadStatus: LoadStatus.success));
    } catch (e) {
      if (isClosed) return;
      log(e.toString());
      emit(state.copyWith(loadStatus: LoadStatus.failure));
    }
  }
}