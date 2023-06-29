import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_repository/home_repository.dart';
import 'package:login_repository/login_repository.dart';
import 'package:store/modules/login/bloc/login_bloc.dart';
import 'package:store/modules/login/view/login_view.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required HomeRepository homeRepository,
    required LoginRepository loginRepository,
  })  : _homeRepository = homeRepository,
        _loginRepository = loginRepository;

  final HomeRepository _homeRepository;
  final LoginRepository _loginRepository;
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _loginRepository),
        RepositoryProvider.value(value: _homeRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(loginRepository: _loginRepository),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Store',
          home: LoginView(),
        ),
      ),
    );
  }
}
