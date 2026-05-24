import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/core/models/login.dart';
import 'package:lms/core/networks/dio_client.dart';



import 'package:lms/features/auth/repositories/auth_repository.dart';


part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository = AuthRepository();
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>(_onLoginEvent);
  }

  Future<void> _onLoginEvent(
    LoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

   final data = await _authRepository.login(login:event.login);
    data.fold(
      (l) => emit(LoginFailure(msg: l)),
      (r) => emit(LoginLoaded(msg: r)),
    );
  }
}
