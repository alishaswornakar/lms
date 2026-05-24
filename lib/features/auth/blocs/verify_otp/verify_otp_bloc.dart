import 'package:flutter_bloc/flutter_bloc.dart';
part 'verify_otp_event.dart';
part 'verify_otp_state.dart';
class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  VerifyOtpBloc() : super(VerifyOtpInitial()) {
    on<VerifyOtpSubmitted>(_verifyOtp);
  }

  Future<void> _verifyOtp(
    VerifyOtpSubmitted event,
    Emitter<VerifyOtpState> emit,
  ) async {
    emit(VerifyOtpLoading());

    try {
      await Future.delayed(const Duration(seconds: 2));

      /// Example validation
      if (event.otp == "123456") {
        emit(VerifyOtpSuccess("OTP Verified Successfully"));
      } else {
        emit(VerifyOtpFailure("Invalid OTP"));
      }
    } catch (e) {
      emit(VerifyOtpFailure(e.toString()));
    }
  }

   Future<void> _resendOtp(
    ResendOtpRequested event,
    Emitter<VerifyOtpState> emit,
  ) async {
    emit(VerifyOtpLoading());

    try {
      await Future.delayed(const Duration(seconds: 2));

      emit(
        ResendOtpSuccess(
          "OTP resent to ${event.email}",
        ),
      );
    } catch (e) {
      emit(
        VerifyOtpFailure(
          e.toString(),
        ),
      );
    }
  }
  
}
