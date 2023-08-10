import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:clean_bloc_architecture/core/error/error_handling.dart';
import 'package:clean_bloc_architecture/features/authentication/domain/use_cases/logout_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../domain/use_cases/login_usecase.dart';
import '../../domain/use_cases/signup_usecase.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final LoginUseCase loginUseCase;
  final SignUpUseCase signUpUseCase;
  final LogoutUseCase logoutUseCase;

  AuthenticationCubit({
    required this.loginUseCase,
    required this.signUpUseCase,
    required this.logoutUseCase,
  }) : super(const AuthenticationInitial());

  Future<void> signUpUser({
    required String userEmail,
    required String userName,
    required String userPassword,
  }) async {
    emit(const AuthenticationLoading());
    final Either<ResponseError, String> response =
        await signUpUseCase.authenticationRepository.signUpUser(
            userEmail: userEmail,
            userName: userName,
            userPassword: userPassword);
    await Future<void>.delayed(const Duration(milliseconds: 20));

    response.fold(
        (error) {
          log(error.errorStatus);
          return emit(
              AuthenticationError(
                error.errorStatus,
              ),
            );}, (successBody) {
          log(successBody);
      return emit(
        AuthenticationLoaded(successBody),
      );
    });
  }
}
