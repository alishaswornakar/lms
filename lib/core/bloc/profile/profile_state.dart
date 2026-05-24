part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final Profile profile;

  const ProfileLoaded({required this.profile});

  @override
  List<Object> get props => [profile];
}

final class ProfileFailure extends ProfileState {
  final String msg;

  const ProfileFailure({required this.msg});

  @override
  List<Object> get props => [msg];
}
