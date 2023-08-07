import 'package:chopper/chopper.dart';
import 'package:clean_bloc_architecture/utils/constant/api_routes.dart';

part "auth_chopper_service.chopper.dart";

@ChopperApi()
abstract class AuthenticationChopperService extends ChopperService {
  static AuthenticationChopperService create([ChopperClient? client]) =>
      _$AuthenticationChopperService(client);

  @Post(path: ApiRoutes.register)
  Future<Response<Map>> signUpUser(
      {@Body() required Map<String, dynamic> signUpModel});

  @Post(path: ApiRoutes.login)
  Future<Response<Map>> loginUser(
      {@Body() required Map<String, dynamic> loginModel});

  @Post(path: ApiRoutes.logout)
  Future<Response<Map>> logoutUser();
}
