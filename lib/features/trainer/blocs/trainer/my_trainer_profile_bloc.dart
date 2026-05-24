import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/features/trainer/model/trainer.dart';
import 'package:lms/features/trainer/repositories/trainer_repositories.dart';

part 'my_trainer_profile_event.dart';
part 'my_trainer_profile_state.dart';

class MyTrainerProfileBloc
    extends Bloc<MyTrainerProfileEvent, MyTrainerProfileState> {
  final TrainerRepository _repo = TrainerRepository();
  MyTrainerProfileBloc() : super(MyTrainerProfileInitial()) {
    on<MyTrainerProfileEvent>((event, emit) async {
      emit(MyTrainerProfileLoading());
      final result = await _repo.getMyProfile();

      result.fold(
        (l) => emit(MyTrainerProfileFailure(msg: l)),
        (r) => emit(MyTrainerProfileLoaded(trainer: r)),
      );
    });
  }
}
