import '../../../core/notifier/default_change_notifier.dart';
import '../../../models/requests/login_request_model.dart';
import '../../../service/account/account_service.dart';

class LoginController extends DefaultChangeNotifier {
  final AccountService _accountService;

  LoginController({required AccountService accountService})
      : _accountService = accountService;

  Future<void> login({required LoginRequestModel loginRequestModel}) async {
    try {
      showLoadingAndResetState();
      notifyListeners();
      await _accountService.login(loginRequestModel: loginRequestModel);
      success();
    } on Exception {
      hideLoading();
      notifyListeners();
      setError('Erro ao logar');
    }
  }
}
