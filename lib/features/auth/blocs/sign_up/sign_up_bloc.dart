import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/features/auth/models/sign_up.dart';
import 'package:lms/core/networks/dio_client.dart';
import 'package:lms/features/auth/repositories/auth_repository.dart';       


part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository _authRepository = AuthRepository(  );
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpEvent>(_onSignUpEvent);
  }

  Future<void> _onSignUpEvent(
    SignUpEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(SignUpLoading());

    final data = await _authRepository.signup(signup: event.signUp);
    data.fold(
      (l) => emit(SignUpFailure(msg: l)),
      (r) => emit(SignUpLoaded(msg: r)),
    );
  }
}
