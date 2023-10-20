import 'package:get/get.dart';
import './recover_password_controller.dart';

class RecoverPasswordBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(RecoverPasswordController());
    }
}