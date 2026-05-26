part of 'verify_otp_bloc.dart';

sealed class VerifyOtpState extends Equatable {
  const VerifyOtpState();

  @override
  List<Object> get props => [];
}

final class VerifyOtpInitial extends VerifyOtpState {}

final class VerifyOtpLoading extends VerifyOtpState {}

final class VerifyOtpLoaded extends VerifyOtpState {}

final class VerifyOtpFailure extends VerifyOtpState {
  final String msg;

  const VerifyOtpFailure({required this.msg});

  @override
  List<Object> get props => [msg];
}
