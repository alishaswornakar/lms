part of 'sign_up_bloc.dart';

sealed class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpLoaded extends SignUpState {
  final String msg;

  const SignUpLoaded({required this.msg});

  @override
  List<Object> get props => [msg];
}

final class SignUpFailure extends SignUpState {
  final String msg;

  const SignUpFailure({required this.msg});

  @override
  List<Object> get props => [msg];
}
