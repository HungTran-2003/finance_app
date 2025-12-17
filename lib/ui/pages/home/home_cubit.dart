import 'package:equatable/equatable.dart';
import 'package:finance_app/ui/pages/home/home_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';
class HomeCubit extends Cubit<HomeState> {
  final HomeNavigator navigator;

  HomeCubit({required this.navigator}) : super(const HomeState());

  void test(){
    emit(state.copyWith(testPro: 0.9));
  }
}