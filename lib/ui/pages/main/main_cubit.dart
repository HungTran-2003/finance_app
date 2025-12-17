import 'package:equatable/equatable.dart';
import 'package:finance_app/ui/pages/main/main_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState>{
  final MainNavigator navigator;
  MainCubit({required this.navigator}) : super(const MainState());

  void switchTap(int index) {
    emit(state.copyWith(selectedIndex: index));
  }
}