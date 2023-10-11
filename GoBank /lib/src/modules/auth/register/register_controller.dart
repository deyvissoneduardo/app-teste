import '../../../core/notifier/default_change_notifier.dart';
import '../../../models/requests/user_register_model.dart';
import '../../../service/account/account_service.dart';

class RegisterController extends DefaultChangeNotifier {
  final AccountService _accountService;

  RegisterController({required AccountService accountService})
      : _accountService = accountService;

  Future<void> registerUser({
    required UserRegisterModel userRegisterModel,
  }) async {
    showLoadingAndResetState();
    notifyListeners();
    try {
      await _accountService.register(registerModel: userRegisterModel);
      success();
    } on Exception {
      hideLoading();
      notifyListeners();
      setError('Erro a cadastra-se');
    }
  }
}
