import 'package:equatable/equatable.dart';
import 'package:finance_app/models/entities/saving_goal.dart';
import 'package:finance_app/models/entities/transaction.dart';
import 'package:finance_app/models/enum/load_status.dart';
import 'package:finance_app/ui/pages/quickly_analysis/quickly_analysis_navigator.dart';
import 'package:finance_app/ui/pages/quickly_analysis/quickly_analysis_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'quickly_analysis_state.dart';

class QuicklyAnalysisCubit extends Cubit<QuicklyAnalysisState> {
  final QuicklyAnalysisNavigator navigator;

  QuicklyAnalysisCubit({required this.navigator})
    : super(const QuicklyAnalysisState());

  void initData() async {
    emit(state.copyWith(loadStatus: LoadStatus.loading));
    try {
      Future.delayed(const Duration(seconds: 1));
      final transactions = TransactionEntity.mockData;
      final savingGoals = SavingGoalEntity.mockData;

      final currentGoalIndex = _getInitGoalIndex(savingGoals);
      emit(
        state.copyWith(
          loadStatus: LoadStatus.success,
          transactions: transactions,
          savingGoals: savingGoals,
          currentGoalIndex: currentGoalIndex,
        ),
      );
    } catch (e) {
      print(e);
      emit(state.copyWith(loadStatus: LoadStatus.failure));
    }
  }

  int _getInitGoalIndex(List<SavingGoalEntity> savingGoals) {
    if (savingGoals.isEmpty) return -1;
    return savingGoals.where((e) => e.follow == true).single.id ?? 0;
  }
}
