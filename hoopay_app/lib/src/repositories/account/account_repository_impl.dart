import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/exception /repository_exception.dart';
import '../../core/rest_client/rest_client.dart';
import '../../models/reponses/login_response_model.dart';
import '../../models/requests/login_request_model.dart';
import '../../models/requests/recovery_password_request_model.dart';
import '../../models/requests/user_register_model.dart';
import 'account_repository.dart';

class AccountRepositoryImpl implements AccountRepository {
  final RestClient _restClient;

  AccountRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<void> register({UserRegisterModel? registerModel}) async {
    try {
      await _restClient.unauth().post(
            '/accounts',
            data: registerModel!.toMap(),
          );
    } on DioException catch (e, s) {
      log('Error ao registrar usuario', error: e, stackTrace: s);
      throw RepositoryException(
        code: e.response!.statusCode,
        message: e.message,
      );
    }
  }

  @override
  Future<LoginResponseModel> login({
    LoginRequestModel? loginRequestModel,
  }) async {
    try {
      final result = await _restClient.unauth().post(
            '/sessions',
            data: loginRequestModel!.toMap(),
          );
      return LoginResponseModel.fromMap(result.data);
    } on DioException catch (e, s) {
      log('Error ao logar usuario', error: e, stackTrace: s);
      throw RepositoryException(
        code: e.response?.statusCode,
        message: e.message,
      );
    }
  }

  @override
  Future<void> newPassword({
    RecoveryPasswordRequestModel? recoveryPasswordRequestModel,
  }) async {
    try {
      await _restClient.unauth().patch(
            'accounts/password/recovery',
            data: recoveryPasswordRequestModel!.toMap(),
          );
    } on DioException catch (e, s) {
      log('Error ao validar token', error: e, stackTrace: s);
      throw RepositoryException(
        code: e.response!.statusCode,
        message: e.message,
      );
    }
  }

  @override
  Future<String> recoverPassord({String? email}) async {
    try {
      final result = await _restClient.unauth().put(
        'accounts/password/recovery',
        data: {
          'email': email,
        },
      );
      return result.data;
    } on DioException catch (e, s) {
      log('Error ao enviar token', error: e, stackTrace: s);
      throw RepositoryException(
        code: e.response!.statusCode,
        message: e.message,
      );
    }
  }
}
