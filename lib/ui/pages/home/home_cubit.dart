import 'package:equatable/equatable.dart';
import 'package:finance_app/models/entities/transaction.dart';
import 'package:finance_app/models/enum/load_status.dart';
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
    emit(state.copyWith(page: page));
  }

  void fetchInitDate() async{
    emit(state.copyWith(loadStatus: LoadStatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 10));
      emit(state.copyWith(transactions: TransactionEntity.mockData, loadStatus: LoadStatus.success));
      print("fetch success");
    } catch (e) {
      emit(state.copyWith(loadStatus: LoadStatus.failure));
    }
  }
}