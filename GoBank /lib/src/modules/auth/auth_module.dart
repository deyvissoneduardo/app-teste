import 'package:provider/provider.dart';

import '../../core/modules/hoopay_modules.dart';
import 'login/login_controller.dart';
import 'login/login_page.dart';
import 'register/register_controller.dart';
import 'register/register_page.dart';

class AuthModule extends HoopayModules {
  AuthModule()
      : super(
          bindings: [
            ChangeNotifierProvider(
              create: (context) => LoginController(
                accountService: context.read(),
              ),
              builder: (context, child) => const LoginPage(),
            ),
            ChangeNotifierProvider(
              create: (context) => RegisterController(
                accountService: context.read(),
              ),
              builder: (context, child) => const RegisterPage(),
            ),
          ],
          routers: {
            '/login': (context) => const LoginPage(),
            '/register': (context) => const RegisterPage(),
          },
        );
}
