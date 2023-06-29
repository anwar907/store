import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:client/client.dart';
import 'package:equatable/equatable.dart';
import 'package:login_repository/login_repository.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required LoginRepository loginRepository})
      : _loginRepository = loginRepository,
        super(const LoginState()) {
    on<LoginEventStarted>(mapEventToState);
  }

  final LoginRepository _loginRepository;

  Future<void> mapEventToState(
    LoginEventStarted event,
    Emitter<LoginState> emit,
  ) async {
    try {
      final value = await _loginRepository.login(
        password: event.password,
        username: event.username,
      );

      log('cek data${value.token}');

      emit(
        state.copyWith(
          loginModels: value,
          status: GlobalStatusState.success,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: GlobalStatusState.failed));
    }
  }
}
