import 'package:get/get.dart';

import '../../../models/requests/login_request_model.dart';
import '../../../routers/app_routes.dart';
import '../../../service/account/account_service.dart';

class LoginController extends GetxController {
  final AccountService _accountService;

  RxBool isLoading = false.obs;
  RxString erroMessage = ''.obs;

  LoginController({required AccountService accountService})
      : _accountService = accountService;

  Future<void> login(LoginRequestModel loginRequestModel) async {
    try {
      isLoading.value = true;
      await _accountService.login(loginRequestModel: loginRequestModel);
      isLoading.value = false;
      Get.offAllNamed(AppRoutes.HOMEPAGE);
    } on Exception {
      isLoading.value = false;
      erroMessage.value = 'Error ao realizar login.';
    }
  }
}
