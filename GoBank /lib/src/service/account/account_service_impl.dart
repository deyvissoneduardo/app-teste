import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/exception /service_exception.dart';
import '../../models/requests/login_request_model.dart';
import '../../models/requests/recovery_password_request_model.dart';
import '../../models/requests/user_register_model.dart';
import '../../repositories/account/account_repository.dart';
import 'account_service.dart';

class AccountServiceImpl implements AccountService {
  final AccountRepository _accountRepository;

  AccountServiceImpl({required AccountRepository accountRepository})
      : _accountRepository = accountRepository;

  @override
  Future<String> login({LoginRequestModel? loginRequestModel}) async {
    final sp = await SharedPreferences.getInstance();
    try {
      final result =
          await _accountRepository.login(loginRequestModel: loginRequestModel!);
      sp.setString('token', result.token!);
      return result.token!;
    } on ServiceException catch (e, s) {
      log('Error ao salvar token', error: e, stackTrace: s);
      throw ServiceException(e.message);
    }
  }

  @override
  Future<void> register({UserRegisterModel? registerModel}) =>
      _accountRepository.register(registerModel: registerModel!);

  @override
  Future<void> newPassword({
    RecoveryPasswordRequestModel? recoveryPasswordRequestModel,
  }) =>
      _accountRepository.newPassword(
        recoveryPasswordRequestModel: recoveryPasswordRequestModel!,
      );

  @override
  Future<String> recoverPassord({String? email}) =>
      _accountRepository.recoverPassord(email: email!);
}
