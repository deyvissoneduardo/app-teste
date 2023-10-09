import '../../models/requests/login_request_model.dart';
import '../../models/requests/recovery_password_request_model.dart';
import '../../models/requests/user_register_model.dart';

abstract class AccountService {
  Future<void> register({UserRegisterModel registerModel});

  Future<String> login({LoginRequestModel loginRequestModel});

  Future<String> recoverPassord({String email});

  Future<void> newPassword({
    RecoveryPasswordRequestModel recoveryPasswordRequestModel,
  });
}
