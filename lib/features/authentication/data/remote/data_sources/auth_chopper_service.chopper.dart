// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_chopper_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$AuthenticationChopperService extends AuthenticationChopperService {
  _$AuthenticationChopperService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = AuthenticationChopperService;

  @override
  Future<Response<Map<dynamic, dynamic>>> signUpUser(
      {required Map<String, dynamic> signUpModel}) {
    final Uri $url = Uri.parse('/register');
    final $body = signUpModel;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Map<dynamic, dynamic>, Map<dynamic, dynamic>>($request);
  }

  @override
  Future<Response<Map<dynamic, dynamic>>> loginUser(
      {required Map<String, dynamic> loginModel}) {
    final Uri $url = Uri.parse('/login');
    final $body = loginModel;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Map<dynamic, dynamic>, Map<dynamic, dynamic>>($request);
  }

  @override
  Future<Response<Map<dynamic, dynamic>>> logoutUser() {
    final Uri $url = Uri.parse('/logout');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<Map<dynamic, dynamic>, Map<dynamic, dynamic>>($request);
  }
}
