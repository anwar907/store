import 'package:client/client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/modules/home/view/home_view.dart';
import 'package:store/modules/login/bloc/login_bloc.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.status == GlobalStatusState.success) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HomeView()),
              );
            } else {
              const ScaffoldMessenger(child: Text('Something wrong'));
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: usernameController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      hintText: 'Username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwordController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      hintText: 'Password',
                      alignLabelWithHint: true,
                      hintStyle: const TextStyle(
                        textBaseline: TextBaseline.ideographic,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<LoginBloc>().add(
                            LoginEvent(
                              password: passwordController.text,
                              username: usernameController.text,
                            ),
                          );
                    },
                    style: ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(
                        Size(
                          MediaQuery.of(context).size.width / 1.5,
                          45,
                        ),
                      ),
                    ),
                    child: const Text('LOGIN'),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
