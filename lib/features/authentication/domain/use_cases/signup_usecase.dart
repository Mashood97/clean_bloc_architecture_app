import 'package:clean_bloc_architecture/core/error/error_handling.dart';
import 'package:clean_bloc_architecture/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../repositories/authentication_repository.dart';

class SignUpUseCase extends UseCase<String, SignupRequestParams> {
  final AuthenticationRepository authenticationRepository;

  SignUpUseCase({
    required this.authenticationRepository,
  });

  @override
  Future<Either<ResponseError, String>> call(SignupRequestParams params) async {
    return await authenticationRepository.signUpUser(
      userEmail: params.email,
      userName: params.userName,
      userPassword: params.password,
    );
  }
}

class SignupRequestParams extends Equatable {
  final String userName;
  final String email;

  final String password;

  const SignupRequestParams({
    required this.userName,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
        userName,
        email,
        password,
      ];
}
