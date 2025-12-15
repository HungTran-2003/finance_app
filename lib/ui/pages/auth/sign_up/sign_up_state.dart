part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  final LoadStatus status;
  final String? email;
  final String? password;

  const SignUpState({
    this.status = LoadStatus.initial,
    this.email,
    this.password,
  });
  @override
  List<Object?> get props => [status, email, password];

  SignUpState copyWith({
    LoadStatus? status,
    String? email,
    String? password,
  }) {
    return SignUpState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
