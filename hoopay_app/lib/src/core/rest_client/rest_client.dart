import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import 'intercpetor/auth_intercpetor.dart';

final class RestClient extends DioForNative {
  final AuthInterceptor? authInterceptor;
  RestClient({this.authInterceptor})
      : super(
          BaseOptions(
            baseUrl: 'https://api.dev.hoopay.com.br',
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 60),
          ),
        ) {
    interceptors.addAll([
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
      AuthInterceptor(),
    ]);
  }

  RestClient auth() {
    if (!interceptors.contains(authInterceptor)) {
      interceptors.add(authInterceptor!);
    }
    return this..interceptors;
  }

  RestClient unauth() => this..interceptors.remove(authInterceptor);
}
