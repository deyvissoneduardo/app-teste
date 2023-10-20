import 'package:get/get.dart';

import '../../routers/app_routes.dart';

class SplashController extends GetxController {
  final _scale = 10.0.obs;
  final animationOpacityLogo = 0.0.obs;

  double get logoAnimetionWidth => 100 * _scale.value;
  double get logoAnimetionHeight => 120 * _scale.value;
  SplashController();
  void initApp() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAllNamed(AppRoutes.LOGINPAGE);
  }

  @override
  void onInit() {
    Future.delayed(Duration.zero, () {
      animationOpacityLogo.value = 1.0;
      _scale.value = 1;
    });
    super.onInit();
  }
}
