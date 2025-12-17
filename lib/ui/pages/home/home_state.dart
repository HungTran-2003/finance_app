part of 'home_cubit.dart';

class HomeState extends Equatable {
  final String? name;
  final double? testPro;

  const HomeState({this.name, this.testPro = 0.1});

  HomeState copyWith({
    String? name,
    double? testPro,
  }) {
    return HomeState(
      name: name ?? this.name,
      testPro: testPro ?? this.testPro,
    );

  }

  @override
  List<Object?> get props => [name, testPro];

}