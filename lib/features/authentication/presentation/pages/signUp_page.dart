import 'dart:developer';

import 'package:clean_bloc_architecture/utils/constant/snackbar.dart';
import 'package:clean_bloc_architecture/utils/di/di_container.dart';
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

  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  late AuthenticationCubit authenticationCubit;

  void resetForm() {
    _signUpFormKey.currentState?.reset();
    email.clear();
    password.clear();
    userName.clear();
  }

  @override
  void initState() {
    super.initState();
    authenticationCubit = getItInstance.get<AuthenticationCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp"),
      ),
      body: BlocProvider(
        create: (_) => authenticationCubit,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
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
                  obscureText: true,
                  decoration: const InputDecoration(labelText: "Password"),
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocConsumer<AuthenticationCubit, AuthenticationState>(
                  listener: (ctx, state) {
                    if (state is AuthenticationError) {
                      AppSnackBar().showErrorSnackBar(
                          context: ctx, error: state.errorMsg);
                    }
                  },
                  builder: (ctx, state) {
                    if (state is AuthenticationLoading) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }
                    return ElevatedButton(
                      onPressed: () async {
                        await authenticationCubit.signUpUser(
                            userEmail: email.text,
                            userName: userName.text,
                            userPassword: password.text);
                        resetForm();
                      },
                      child: const Text("SignUp"),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    log("Auth dispose");
    email.dispose();
    userName.dispose();
    password.dispose();
    super.dispose();
  }
}
