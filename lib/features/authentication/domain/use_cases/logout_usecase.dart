import 'package:clean_bloc_architecture/core/error/error_handling.dart';
import 'package:clean_bloc_architecture/core/usecases/usecase.dart';
import 'package:clean_bloc_architecture/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';

class LogoutUseCase extends UseCase<bool, NoParams> {
  final AuthenticationRepository authenticationRepository;

  LogoutUseCase({required this.authenticationRepository});

  @override
  Future<Either<ResponseError, bool>> call(NoParams params) async {
    return await authenticationRepository.logoutUser();
  }
}
