part of 'my_trainer_profile_bloc.dart';

sealed class MyTrainerProfileState extends Equatable {
  const MyTrainerProfileState();

  @override
  List<Object> get props => [];
}

final class MyTrainerProfileInitial extends MyTrainerProfileState {}

final class MyTrainerProfileLoading extends MyTrainerProfileState {}

final class MyTrainerProfileLoaded extends MyTrainerProfileState {
  final TrainerProfile trainer;

  const MyTrainerProfileLoaded({required this.trainer});
  @override
  List<Object> get props => [trainer];
}

final class MyTrainerProfileFailure extends MyTrainerProfileState {
  final String msg;

  const MyTrainerProfileFailure({required this.msg});

  @override
  List<Object> get props => [msg];
}
