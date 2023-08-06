import 'dart:async';
import 'dart:developer';

import 'package:chopper/chopper.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class InternetConnectionInterceptor extends RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {
    log("CALLED INTERNET ${request.url}");
    final connection = await Connectivity().checkConnectivity();
    if (connection == ConnectivityResult.none) {
      throw NoInternetConnectionException();
    }
    return request;
  }
}

class NoInternetConnectionException implements Exception {
  final String message =
      "No Internet connection available, please try again later.";

  @override
  String toString() {
    return message;
  }
}
