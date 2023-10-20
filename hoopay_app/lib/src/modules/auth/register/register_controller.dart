import 'package:get/get.dart';

import '../../../models/requests/user_register_model.dart';
import '../../../service/account/account_service.dart';

class RegisterController extends GetxController {
  final AccountService _accountService;
  RxBool isLoading = false.obs;
  RxString erroMessage = ''.obs;

  RegisterController({required AccountService accountService})
      : _accountService = accountService;

  Future<void> registerUser(UserRegisterModel userRegisterModel) async {
    try {
      isLoading.value = true;
      await _accountService.register(registerModel: userRegisterModel);
      isLoading.value = false;
    } on Exception {
      isLoading.value = false;
      erroMessage.value = 'Erro ao registrar - se.';
    }
  }
}
