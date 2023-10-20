import 'package:get/get_navigation/src/routes/get_route.dart';

import '../modules/auth/login/login_bindings.dart';
import '../modules/auth/login/login_page.dart';
import '../modules/auth/recover_password/recover_password_bindings.dart';
import '../modules/auth/recover_password/recover_password_page.dart';
import '../modules/auth/register/register_bindings.dart';
import '../modules/auth/register/register_page.dart';
import '../modules/home/home_bindings.dart';
import '../modules/home/home_page.dart';
import '../modules/splash/splash_bindings.dart';
import '../modules/splash/splash_page.dart';

class AppRoutes {
  static const SPLASHPAGE = '/';
  static const HOMEPAGE = '/home_page';
  static const LOGINPAGE = '/login_page';
  static const REGISTERPAGE = '/register';
  static const RECOVERPASSWORDPAGE = '/recover_password';

  static List<GetPage> get pages => [
        GetPage(
          name: SPLASHPAGE,
          page: () => const SplashPage(),
          bindings: [SplashBindings()],
        ),
        GetPage(
          name: HOMEPAGE,
          page: () => const HomePage(),
          bindings: [HomeBindings()],
        ),
        GetPage(
          name: LOGINPAGE,
          page: () => const LoginPage(),
          bindings: [LoginBindings()],
        ),
        GetPage(
          name: REGISTERPAGE,
          page: () => const RegisterPage(),
          binding: RegisterBindings(),
        ),
        GetPage(
          name: RECOVERPASSWORDPAGE,
          page: () => const RecoverPasswordPage(),
          binding: RecoverPasswordBindings(),
        ),
      ];
}
