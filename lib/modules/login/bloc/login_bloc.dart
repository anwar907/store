import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:client/client.dart';
import 'package:equatable/equatable.dart';
import 'package:login_repository/login_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required LoginRepository loginRepository})
      : _loginRepository = loginRepository,
        super(const LoginState()) {
    on<LoginEvent>(mapEventToState);
  }

  final LoginRepository _loginRepository;

  Future<void> mapEventToState(
    LoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    try {
      final value = await _loginRepository.login(
        password: event.password,
        username: event.username,
      );

      emit(
        LoginState(loginModels: value, status: GlobalStatusState.success),
      );
    } catch (e) {
      emit(state.copyWith(status: GlobalStatusState.failed));
    }
  }

  @override
  void onEvent(LoginEvent event) {
    super.onEvent(event);
    log(event.toString());
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    log(error.toString());
  }

  @override
  void onTransition(Transition<LoginEvent, LoginState> transition) {
    super.onTransition(transition);
    log(transition.toString());
  }

  @override
  void onChange(Change<LoginState> change) {
    super.onChange(change);
    log(change.toString());
    log(change.currentState.toString());
    log(change.nextState.toString());
  }
}
