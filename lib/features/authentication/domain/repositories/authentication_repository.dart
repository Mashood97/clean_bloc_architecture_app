import 'package:clean_bloc_architecture/core/error/error_handling.dart';
import 'package:dartz/dartz.dart';

abstract class AuthenticationRepository {
  Future<Either<ResponseError, String>> loginUser({
    required String userEmail,
    required String userName,
    required String userPassword,
  });

  Future<Either<ResponseError, String>> signUpUser({
    required String userEmail,
    required String userName,
    required String userPassword,
  });

  Future<Either<ResponseError,bool>> logoutUser();
}
