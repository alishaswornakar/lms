// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'trainer_apply_bloc.dart';

class TrainerApplyEvent extends Equatable {
  const TrainerApplyEvent(this.form);
  final TraienrApplyForm form;

  @override
  List<Object> get props => [form];
}
