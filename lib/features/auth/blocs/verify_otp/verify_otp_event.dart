part of 'verify_otp_bloc.dart';

 class VerifyOtpEvent {}

class VerifyOtpSubmitted extends VerifyOtpEvent {
  final String email;
  final String otp;

  VerifyOtpSubmitted({
    required this.email,
    required this.otp,
  });
}
  class ResendOtpRequested extends VerifyOtpEvent {
  final String email;

  ResendOtpRequested({
    required this.email,
  });
}

  List<Object> get props => [];

