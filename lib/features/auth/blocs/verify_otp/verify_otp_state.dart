part of 'verify_otp_bloc.dart';

abstract class VerifyOtpState {}

class VerifyOtpInitial extends VerifyOtpState {}

class VerifyOtpLoading extends VerifyOtpState {}

class VerifyOtpSuccess extends VerifyOtpState {
  final String message;

  VerifyOtpSuccess(this.message);
}

class VerifyOtpFailure extends VerifyOtpState {
  final String error;

  VerifyOtpFailure(this.error);
}


class ResendOtpSuccess extends VerifyOtpState {
  final String message;

  ResendOtpSuccess(this.message);
}

class ResendOtpFailure extends VerifyOtpState {
  final String error;

  ResendOtpFailure(this.error);
}