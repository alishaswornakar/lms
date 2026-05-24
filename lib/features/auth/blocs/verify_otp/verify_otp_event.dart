

import 'package:equatable/equatable.dart';
import 'package:lms/features/auth/models/verify_otp.dart';

class OtpEvent extends Equatable {
  const OtpEvent({required this.otpRequestModel});
  final VerifyOtpRequestModel otpRequestModel;

  @override
  List<Object> get props => [otpRequestModel];

  String get email => otpRequestModel.email;

  String get otp => otpRequestModel.otp;
}


