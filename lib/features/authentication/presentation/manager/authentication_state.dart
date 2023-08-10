part of 'authentication_cubit.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object?> get props => [];
}

class AuthenticationInitial extends AuthenticationState {
  const AuthenticationInitial();

}

class AuthenticationLoading extends AuthenticationState {
  const AuthenticationLoading();

}

class AuthenticationLoaded extends AuthenticationState {
  final String authToken;

  const AuthenticationLoaded(this.authToken);

  @override
  List<Object?> get props => [authToken];
}

class AuthenticationError extends AuthenticationState {
  final String errorMsg;

  const AuthenticationError(this.errorMsg);

  @override
  List<Object?> get props => [errorMsg];
}
