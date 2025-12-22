part of 'account_balance_cubit.dart';

class AccountBalanceState extends Equatable {
  final LoadStatus? loadStatus;
  final List<TransactionEntity> transactions;
  final int? page;

  const AccountBalanceState({
    this.transactions = const [],
    this.page = 1,
    this.loadStatus = LoadStatus.initial,
  });

  @override
  List<Object?> get props => [transactions, page, loadStatus];

  AccountBalanceState copyWith({
    List<TransactionEntity>? transactions,
    int? page,
    LoadStatus? loadStatus,
  }) {
    return AccountBalanceState(
      transactions: transactions ?? this.transactions,
      page: page ?? this.page,
      loadStatus: loadStatus ?? this.loadStatus,
    );
  }
}
