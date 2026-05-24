
part of 'sign_up_bloc.dart';

class SignUpEvent extends Equatable {
  const SignUpEvent(this.signUp);
  final SignUpFormModel signUp;

  @override
  List<Object> get props => [signUp];
}
