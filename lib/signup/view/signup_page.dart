import 'package:bloc_practice/signup/bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => SignUpBloc(), child: const SignUpView());
  }
}

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController lastnameController = TextEditingController();
    TextEditingController numberController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text("SignUp")),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: BlocConsumer<SignUpBloc, SignUpState>(
          listener: (context, state) {
            if (state is SignUpSuccess) {
              // ScaffoldMessenger.of(
              //   context,
              // ).showSnackBar(SnackBar(content: Text("Sign Up Successful.")));
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WelcomePage(
                    name: state.name,
                    lName: state.lastName,
                    number: state.number,
                  ),
                ),
              );
            } else if (state is SignUpFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Sign Up Failed")));
            }
          },
          builder: (context, state) {
            if (state is SignUpLoading || state is SignUpSuccess) {
              return const Center(child: CircularProgressIndicator());
            }
            return Column(
              children: [
                const SizedBox(height: 32),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Enter name..',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 32),
                TextField(
                  controller: lastnameController,
                  decoration: const InputDecoration(
                    labelText: 'Enter last name..',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 32),
                TextField(
                  controller: numberController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Enter Number..',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 32),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<SignUpBloc>().add(
                        SignUpButtonPressed(
                          name: nameController.text,
                          lastName: lastnameController.text,
                          number: numberController.text,
                        ),
                      );
                    },
                    child: Text("Sign Up"),
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

class WelcomePage extends StatelessWidget {
  final String name;
  final String lName;
  final String number;

  const WelcomePage({
    super.key,
    required this.name,
    required this.lName,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Welcome")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Name $name", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(
            "Last Name $lName",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            "Mobile Number $number",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
