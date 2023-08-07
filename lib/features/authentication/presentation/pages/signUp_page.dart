import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/authentication_cubit.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp"),
      ),
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: userName,
                decoration: const InputDecoration(labelText: "Username"),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: email,
                decoration: const InputDecoration(labelText: "Email"),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: password,
                decoration: const InputDecoration(labelText: "Password}"),
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<AuthenticationCubit, AuthenticationState>(
                builder: (context, state) {
                  if (state == const AuthenticationInitial()) {
                    return ElevatedButton(
                        onPressed: () async {}, child: Text("SignUp"));
                  }
                  else if (state == const AuthenticationLoading()) {
                    return const Center(child: CircularProgressIndicator.adaptive(),)

                  }
                  return ElevatedButton(onPressed: () async{}, child: Text("SignUp"));
                },
              ),
            ],
          )),
    );
  }
}
