part of 'trainer_apply_bloc.dart';

sealed class TrainerApplyState extends Equatable {
  const TrainerApplyState();

  @override
  List<Object> get props => [];
}

final class TrainerApplyInitial extends TrainerApplyState {}

final class TrainerApplyLoading extends TrainerApplyState {}

final class TrainerApplyLoaded extends TrainerApplyState {
  const TrainerApplyLoaded();
}


final class TrainerApplyFailure extends TrainerApplyState {
  final String msg;

  const TrainerApplyFailure(this.msg);

  @override
  List<Object> get props => [msg];
}
