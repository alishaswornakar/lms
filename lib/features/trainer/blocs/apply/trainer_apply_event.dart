part of 'trainer_apply_bloc.dart';

sealed class TrainerApplyEvent extends Equatable {
  const TrainerApplyEvent();

  @override
  List<Object> get props => [];
}

class TrainerApplySubmitted extends TrainerApplyEvent {
  final TrainerApplyForm  form;

  const TrainerApplySubmitted(this.form);

  @override
  List<Object> get props => [form];
}