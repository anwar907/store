part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.loginModels,
    this.status = GlobalStatusState.initial,
    this.message,
  });
  final LoginModels? loginModels;
  final GlobalStatusState status;
  final String? message;

  LoginState copyWith({
    LoginModels? loginModels,
    GlobalStatusState? status,
    String? message,
  }) {
    return LoginState(
      loginModels: loginModels ?? this.loginModels,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [loginModels, status, message];
}
