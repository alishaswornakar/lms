import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lms/features/auth/repositories/auth_repository.dart';

part 'verify_otp_event.dart';
part 'verify_otp_state.dart';

class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  final AuthRepository _repo = AuthRepository();
  VerifyOtpBloc() : super(VerifyOtpInitial()) {
    on<VerifyOtpEvent>((event, emit) async {
      emit(VerifyOtpLoading());
      final result = await _repo.verifyOtp(email: event.email, otp: event.otp);

      result.fold(
        (l) => emit(VerifyOtpFailure(msg: l)),
        (r) => emit(VerifyOtpLoaded()),
      );
    });
  }
}
