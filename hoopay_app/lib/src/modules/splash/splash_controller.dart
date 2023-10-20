import 'package:get/get.dart';

import '../../routers/app_routes.dart';

class SplashController extends GetxController {
  SplashController();
  void initApp() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.toNamed(AppRoutes.LOGINPAGE);
  }
}
