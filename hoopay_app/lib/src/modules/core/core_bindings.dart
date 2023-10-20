import 'package:get/get.dart';

import '../../core/rest_client/rest_client.dart';
import '../auth/login/login_bindings.dart';
import '../auth/recover_password/recover_password_bindings.dart';
import '../auth/register/register_bindings.dart';
import '../home/home_bindings.dart';
import '../splash/splash_bindings.dart';

class CoreBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RestClient(),
      fenix: true,
    );
    SplashBindings().dependencies();
    LoginBindings().dependencies();
    RegisterBindings().dependencies();
    RecoverPasswordBindings().dependencies();
    HomeBindings().dependencies();
  }
}
