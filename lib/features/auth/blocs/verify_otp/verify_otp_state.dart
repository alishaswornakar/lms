part of 'verify_otp_bloc.dart';

sealed class VerifyOtpState {
  const VerifyOtpState();

  @override
  List<Object> get props => [];
}

class VerifyOtpInitial extends VerifyOtpState {}

class VerifyOtpLoading extends VerifyOtpState {}

class VerifyOtpSuccess extends VerifyOtpState {
  final String message;

  VerifyOtpSuccess(this.message);
}

class VerifyOtpFailure extends VerifyOtpState {
 final String msg;

   VerifyOtpFailure({required this.msg});
  @override
  List<Object> get props => [msg];
}

class ResendOtpSuccess extends VerifyOtpState {
  final String message;

  ResendOtpSuccess(this.message);
}

class ResendOtpFailure extends VerifyOtpState {
  final String error;

  ResendOtpFailure(this.error);
}