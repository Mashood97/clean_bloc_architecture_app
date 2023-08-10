import 'package:clean_bloc_architecture/core/platform/network_info.dart';
import 'package:clean_bloc_architecture/features/authentication/data/remote/data_sources/auth_remote_data_source_repository.dart';
import 'package:clean_bloc_architecture/features/authentication/data/repositories/auth_repository_implementation.dart';
import 'package:clean_bloc_architecture/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:clean_bloc_architecture/features/authentication/domain/use_cases/login_usecase.dart';
import 'package:clean_bloc_architecture/features/authentication/domain/use_cases/logout_usecase.dart';
import 'package:clean_bloc_architecture/features/authentication/domain/use_cases/signup_usecase.dart';
import 'package:clean_bloc_architecture/features/authentication/presentation/manager/authentication_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';

var getItInstance = GetIt.I;

void initializeDependencies() {
  ///features
  /// #bloc
  getItInstance.registerFactory<AuthenticationCubit>(
    () => AuthenticationCubit(
      loginUseCase: getItInstance(),
      signUpUseCase: getItInstance(),
      logoutUseCase: getItInstance(),
    ),
  );

  /// use cases
  getItInstance.registerLazySingleton(
    () => LoginUseCase(
      authenticationRepository: getItInstance(),
    ),
  );
  getItInstance.registerLazySingleton(
    () => SignUpUseCase(
      authenticationRepository: getItInstance(),
    ),
  );
  getItInstance.registerLazySingleton(
    () => LogoutUseCase(
      authenticationRepository: getItInstance(),
    ),
  );

  ///repositories
  getItInstance.registerLazySingleton<AuthenticationRepository>(
    () => IAuthenticationRepositoryImplementation(
      networkInfo: getItInstance(),
      authenticationRemoteDataSourceRepository: getItInstance(),
    ),
  );

  /// Data sources
  getItInstance.registerLazySingleton<AuthenticationRemoteDataSourceRepository>(
    () => IAuthenticationRemoteDataSourceRepositoryImplementation(),
  );

  ///core
  getItInstance.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      networkConnectionCheck: getItInstance(),
    ),
  );

  ///external

  getItInstance.registerLazySingleton(() => Connectivity());
}
