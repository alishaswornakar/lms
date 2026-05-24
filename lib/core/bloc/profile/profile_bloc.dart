import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/core/data/repositories/profile_repositories.dart';
import 'package:lms/core/models/profile.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository _repo = ProfileRepository();
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      emit(ProfileLoading());
      final result = await _repo.getProfile();
      result.fold(
        (l) => emit(ProfileFailure(msg: l)),
        (r) => emit(ProfileLoaded(profile: r)),
      );
    });
  }
}
