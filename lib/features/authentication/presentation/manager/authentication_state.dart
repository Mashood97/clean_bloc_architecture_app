part of 'authentication_cubit.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
}

class AuthenticationInitial extends AuthenticationState {
  const AuthenticationInitial();

  @override
  List<Object> get props => [];
}

class AuthenticationLoading extends AuthenticationState {
  const AuthenticationLoading();

  @override
  List<Object?> get props => [];
}

class AuthenticationLoaded extends AuthenticationState {
  final String authToken;

  const AuthenticationLoaded({required this.authToken});

  @override
  List<Object?> get props => [authToken];
}

class AuthenticationError extends AuthenticationState {
  final String errorMsg;

  const AuthenticationError({required this.errorMsg});

  @override
  List<Object?> get props => [errorMsg];
}
