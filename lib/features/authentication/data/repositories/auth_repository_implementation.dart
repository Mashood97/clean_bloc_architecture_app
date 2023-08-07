import 'package:clean_bloc_architecture/core/error/error_handling.dart';
import 'package:clean_bloc_architecture/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/platform/network_info.dart';
import '../remote/data_sources/auth_remote_data_source_repository.dart';

class IAuthenticationRepositoryImplementation extends AuthenticationRepository {
  final NetworkInfo networkInfo;
  final AuthenticationRemoteDataSourceRepository
      authenticationRemoteDataSourceRepository;

  IAuthenticationRepositoryImplementation({
    required this.networkInfo,
    required this.authenticationRemoteDataSourceRepository,
  });

  @override
  Future<Either<ResponseError, String>> loginUser(
      {required String userEmail,
      required String userName,
      required String userPassword}) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await authenticationRemoteDataSourceRepository.loginUser(
          email: userEmail,
          userName: userName,
          password: userPassword,
        );

        return Right(response);
      } on ResponseError catch (e) {
        return Left(e);
      }
    } else {
      return Left(ResponseError(
          errorStatus:
              "There is no or poor internet connection, Please try again later."));
    }
  }

  @override
  Future<Either<ResponseError, bool>> logoutUser() async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await authenticationRemoteDataSourceRepository.logoutUser();
        return Right(response);
      } on ResponseError catch (e) {
        return Left(e);
      }
    } else {
      return Left(ResponseError(
          errorStatus:
              "There is no or poor internet connection, Please try again later."));
    }
  }

  @override
  Future<Either<ResponseError, String>> signUpUser(
      {required String userEmail,
      required String userName,
      required String userPassword}) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await authenticationRemoteDataSourceRepository.signUpUser(
          email: userEmail,
          userName: userName,
          password: userPassword,
        );

        return Right(response);
      } on ResponseError catch (e) {
        return Left(e);
      }
    } else {
      return Left(ResponseError(
          errorStatus:
              "There is no or poor internet connection, Please try again later."));
    }
  }
}
