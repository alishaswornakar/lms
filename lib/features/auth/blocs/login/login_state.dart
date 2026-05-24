part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginLoaded extends LoginState {
  final String msg;

  const LoginLoaded({required this.msg});

  @override
  List<Object> get props => [msg];
}

final class LoginFailure extends LoginState {
  final String msg;

  const LoginFailure({required this.msg});

  @override
  List<Object> get props => [msg];
}
