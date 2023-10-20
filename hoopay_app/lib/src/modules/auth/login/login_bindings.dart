import 'package:get/get.dart';
import '../../../repositories/account/account_repository.dart';
import '../../../repositories/account/account_repository_impl.dart';
import '../../../service/account/account_service.dart';
import '../../../service/account/account_service_impl.dart';
import './login_controller.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountRepository>(
      () => AccountRepositoryImpl(restClient: Get.find()),
    );
    Get.lazyPut<AccountService>(
      () => AccountServiceImpl(
        accountRepository: Get.find(),
      ),
    );
    Get.put(
      LoginController(
        accountService: Get.find(),
      ),
    );
  }
}
