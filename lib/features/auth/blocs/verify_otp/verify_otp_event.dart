part of 'verify_otp_bloc.dart';

class VerifyOtpEvent extends Equatable {
  const VerifyOtpEvent({required this.email, required this.otp});
  final String email;
  final String otp;

  @override
  List<Object> get props => [email, otp];
}
