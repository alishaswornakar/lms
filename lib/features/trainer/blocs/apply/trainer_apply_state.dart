part of 'trainer_apply_bloc.dart';

sealed class TrainerApplyState extends Equatable {
  const TrainerApplyState();

  @override
  List<Object> get props => [];
}

final class TrainerApplyInitial extends TrainerApplyState {}

final class TrainerApplyLoading extends TrainerApplyState {}

final class TrainerApplyLoaded extends TrainerApplyState {}

///TODO:: Implement msg here
final class TrainerApplyFailure extends TrainerApplyState {
  final String msg;

  const TrainerApplyFailure({required this.msg});

  @override
  List<Object> get props => [msg];
}
