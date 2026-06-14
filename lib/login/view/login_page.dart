import 'package:bloc_practice/login/bloc/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => LoginBloc(), child: const LoginView());
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: BlocConsumer<LoginBloc,LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Login successful...")),
              );
            } else if (state is LoginFailure) {
              print('state: ${state}');
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Welcome Back', style: TextStyle(fontSize: 28)),
                const SizedBox(height: 32),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: passController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password  ',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                if (state is LoginLoading)
                  const CircularProgressIndicator.adaptive()
                else
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<LoginBloc>().add(
                          LoginButtonPressed(
                            email: emailController.text,
                            password: passController.text,
                          ),
                        );
                      },
                      child: const Text("Login"),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
