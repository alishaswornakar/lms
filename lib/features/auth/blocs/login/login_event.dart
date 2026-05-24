
part of 'login_bloc.dart';

class LoginEvent extends Equatable {
  const LoginEvent(this.login);
  final  LoginFormModel login;

  @override
  List<Object> get props => [login];
}
