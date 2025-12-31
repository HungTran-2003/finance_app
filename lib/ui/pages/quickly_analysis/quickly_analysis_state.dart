part of 'quickly_analysis_cubit.dart';

class QuicklyAnalysisState extends Equatable {
  final LoadStatus? loadStatus;

  final List<TransactionEntity> transactions;
  final List<SavingGoalEntity> savingGoals;

  final int? currentGoalIndex;
  final double? targetProgress;

  const QuicklyAnalysisState({
    this.loadStatus,
    this.transactions = const [],
    this.savingGoals = const [],
    this.currentGoalIndex = 0,
    this.targetProgress = 0,
  });

  @override
  List<Object?> get props => [loadStatus, transactions, savingGoals, currentGoalIndex,targetProgress];

  QuicklyAnalysisState copyWith({
    LoadStatus? loadStatus,
    List<TransactionEntity>? transactions,
    List<SavingGoalEntity>? savingGoals,
    int? currentGoalIndex,
    double? targetProgress,
  }) {
    return QuicklyAnalysisState(
      loadStatus: loadStatus ?? this.loadStatus,
      transactions: transactions ?? this.transactions,
      savingGoals: savingGoals ?? this.savingGoals,
      currentGoalIndex: currentGoalIndex ?? this.currentGoalIndex,
      targetProgress: targetProgress ?? this.targetProgress,
    );
  }
}
