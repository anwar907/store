part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginEventStarted extends LoginEvent {
  LoginEventStarted({this.username, this.password});
  final String? username;
  final String? password;
}
