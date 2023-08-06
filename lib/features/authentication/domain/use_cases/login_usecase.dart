import 'package:clean_bloc_architecture/core/error/error_handling.dart';
import 'package:clean_bloc_architecture/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../repositories/authentication_repository.dart';

class LoginUseCase extends UseCase<String, RequestParams> {
  final AuthenticationRepository authenticationRepository;

  LoginUseCase({
    required this.authenticationRepository,
  });

  @override
  Future<Either<ResponseError, String>> call(RequestParams params) async {
    return await authenticationRepository.loginUser(
      userEmail: params.email,
      userName: params.userName,
      userPassword: params.password,
    );
  }
}

class RequestParams extends Equatable {
  final String userName;
  final String email;

  final String password;

  const RequestParams({
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
