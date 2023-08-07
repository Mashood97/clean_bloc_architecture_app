import 'dart:convert';

import 'package:clean_bloc_architecture/core/error/error_handling.dart';
import 'package:clean_bloc_architecture/utils/extensions/string_extensions.dart';

import '../../../../../utils/chopper_client/chopper_client.dart';
import 'auth_chopper_service.dart';

abstract class AuthenticationRemoteDataSourceRepository {
  Future<String> signUpUser({
    required String email,
    required String userName,
    required String password,
  });

  Future<String> loginUser({
    required String email,
    required String userName,
    required String password,
  });

  Future<bool> logoutUser();
}

class IAuthenticationRemoteDataSourceRepositoryImplementation
    extends AuthenticationRemoteDataSourceRepository {
  final authService =
      AuthenticationChopperService.create(ChopperClientInstance.client);

  @override
  Future<String> loginUser(
      {required String email,
      required String userName,
      required String password}) async {
    var loginObject = {
      "username": userName,
      "email": email,
      "password": password,
    };
    final response = await authService.loginUser(loginModel: loginObject);
    if (response.isSuccessful == true) {
      var decodedBodyInJson = response.bodyString.decodedString;
      String authToken = decodedBodyInJson["token"];

      return authToken;
    } else {
      throw ResponseError(errorStatus: response.error.toString());
    }
  }

  @override
  Future<bool> logoutUser() async {
    final response = await authService.logoutUser();
    if (response.isSuccessful == true) {
      return true;
    } else {
      throw ResponseError(errorStatus: response.error.toString());
    }
  }

  @override
  Future<String> signUpUser(
      {required String email,
      required String userName,
      required String password}) async {
    var signUpObject = {
      "username": userName,
      "email": email,
      "password": password,
    };
    final response = await authService.signUpUser(
      signUpModel: signUpObject,
    );
    if (response.isSuccessful == true) {
      var decodedBodyInJson = response.bodyString.decodedString;
      String authToken = decodedBodyInJson["token"];

      return authToken;
    } else {
      throw ResponseError(errorStatus: response.error.toString());
    }
  }
}
