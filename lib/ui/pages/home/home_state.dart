part of 'home_cubit.dart';

class HomeState extends Equatable {
  final String? name;
  final double? testPro;
  final int? page;
  final List<TransactionEntity> transactions;
  final LoadStatus loadStatus;

  const HomeState({
    this.name,
    this.testPro = 0.1,
    this.page = 0,
    this.transactions = const [],
    this.loadStatus = LoadStatus.initial,
  });

  HomeState copyWith({
    String? name,
    double? testPro,
    int? page,
    List<TransactionEntity>? transactions,
    LoadStatus? loadStatus,
  }) {
    return HomeState(
      name: name ?? this.name,
      testPro: testPro ?? this.testPro,
      page: page ?? this.page,
      transactions: transactions ?? this.transactions,
      loadStatus: loadStatus ?? this.loadStatus,
    );
  }

  @override
  List<Object?> get props => [name, testPro, page, transactions, loadStatus];
}
