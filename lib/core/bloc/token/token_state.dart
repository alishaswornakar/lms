part of 'token_cubit.dart';

sealed class TokenState extends Equatable {
  const TokenState();

  @override
  List<Object> get props => [];
}

final class TokenInitial extends TokenState {}

final class TokenLoading extends TokenState {}

final class TokenAuthenticated extends TokenState {}

final class TokenUnAuthenticated extends TokenState {}
