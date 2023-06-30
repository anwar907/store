part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({this.loginModels, this.status = GlobalStatusState.initial});
  final LoginModels? loginModels;
  final GlobalStatusState status;

  LoginState copyWith({LoginModels? loginModels, GlobalStatusState? status}) {
    return LoginState(
      loginModels: loginModels ?? this.loginModels,
      status: status ?? this.status,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        loginModels,
        status,
      ];
}
