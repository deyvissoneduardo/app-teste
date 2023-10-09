import 'package:dio/browser.dart';
import 'package:dio/dio.dart';

import 'intercpetor/auth_intercpetor.dart';

class RestClient extends DioForBrowser {
  late AuthInterceptor _authInterceptor;
  RestClient()
      : super(
          BaseOptions(
            baseUrl: 'api.dev.hoopay.com.br',
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 60),
          ),
        ) {
    interceptors.add(
      LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
    _authInterceptor = AuthInterceptor();
  }

  RestClient auth() {
    if (!interceptors.contains(_authInterceptor)) {
      interceptors.add(_authInterceptor);
    }
    return this..interceptors;
  }

  RestClient unauth() => this..interceptors.remove(_authInterceptor);
}
