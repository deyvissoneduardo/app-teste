import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/requests/login_request_model.dart';
import '../../../models/requests/user_register_model.dart';
import '../../../service/account/account_service.dart';

class RegisterController extends GetxController {
  final AccountService _accountService;
  RxBool isLoading = false.obs;
  RxBool viewPassword = false.obs;
  RxBool viewConfirmPassword = false.obs;
  RxString erroMessage = ''.obs;
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final phoneEC = TextEditingController();
  final docEC = TextEditingController();
  final passwordEC = TextEditingController();

  RegisterController({required AccountService accountService})
      : _accountService = accountService;

  Future<void> registerUser() async {
    try {
      isLoading.value = true;
      await _accountService.register(
        registerModel: UserRegisterModel(
          email: emailEC.text.trim(),
          password: passwordEC.text.trim(),
          name: nameEC.text.trim(),
          document: docEC.text.trim(),
          phoneNumber: phoneEC.text.trim(),
        ),
      );
      await _accountService.login(
        loginRequestModel: LoginRequestModel(
          email: emailEC.text.trim(),
          password: passwordEC.text.trim(),
        ),
      );
      isLoading.value = false;
    } on Exception {
      isLoading.value = false;
      erroMessage.value = 'Erro ao registrar - se.';
    }
  }

  void _clearFields() {
    nameEC.clear();
    emailEC.clear();
    docEC.clear();
    passwordEC.clear();
  }

  @override
  void onClose() {
    nameEC.dispose();
    emailEC.dispose();
    phoneEC.dispose();
    docEC.dispose();
    passwordEC.dispose();
    _clearFields();
    super.onClose();
  }
}
