import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';
import '../../../core/helpers/form_helper.dart';
import '../../../core/helpers/hoopay_color.dart';
import '../../../core/helpers/messages.dart';
import '../../../core/helpers/string.dart';
import '../../../core/widgets/elevated_button_widget.dart';
import '../../../core/widgets/text_form_field_widget.dart';
import '../../../models/requests/login_request_model.dart';
import '../../../routers/app_routes.dart';
import './login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final emailEC = TextEditingController();
    final passwordEC = TextEditingController();
    return Scaffold(
      backgroundColor: HoopayColor.primeryColor,
      body: Stack(
        children: [
          Container(
            height: height,
            width: width,
            color: Colors.transparent,
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              child: ListView(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      CustomStrings.login,
                      style: TextStyle(
                        color: HoopayColor.darkColor,
                        fontFamily: 'Gilroy Bold',
                        fontSize: height / 35,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: Image.asset(
                      'assets/images/logos.png',
                      height: height / 7,
                    ),
                  ),
                  Text(
                    CustomStrings.email,
                    style: TextStyle(
                      color: HoopayColor.darkColor,
                      fontSize: height / 50,
                    ),
                  ),
                  TextFormFieldWidget(
                    controller: emailEC,
                    hintText: CustomStrings.emailhint,
                    path: 'assets/images/email.png',
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.emailAddress,
                    onFieldSubmitted: (value) {},
                    onTapOutside: (value) => context.unfocus(),
                    validator: Validatorless.required('m'),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    CustomStrings.password,
                    style: TextStyle(
                      color: HoopayColor.darkColor,
                      fontSize: height / 50,
                    ),
                  ),
                  TextFormFieldWidget(
                    controller: passwordEC,
                    hintText: CustomStrings.passwordhint,
                    obscureText: true,
                    path: 'assets/images/password.png',
                    onTapOutside: (value) => context.unfocus(),
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (value) {},
                    validator: Validatorless.required('m'),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.centerRight,
                    height: height / 40,
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => Get.toNamed(AppRoutes.RECOVERPASSWORDPAGE),
                      splashColor: Colors.blue,
                      child: Text(
                        CustomStrings.forgotpassword,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: height / 60,
                          fontFamily: 'Gilroy Medium',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButtonWidget(
                    title: CustomStrings.login,
                    isLoading: controller.isLoading,
                    onPressed: () {
                      if (emailEC.text.isEmpty || passwordEC.text.isEmpty) {
                        Messages.of(context)
                            .showError('E-mail e senha são obrigatórios');
                      }
                      controller.login(
                        LoginRequestModel(
                          email: emailEC.text.trim(),
                          password: passwordEC.text.trim(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        CustomStrings.account,
                        style: TextStyle(
                          color: HoopayColor.greyColor.withOpacity(0.6),
                          fontSize: height / 50,
                        ),
                      ),
                      SizedBox(
                        width: width / 100,
                      ),
                      InkWell(
                        onTap: () => Navigator.of(context)
                            .pushNamed(AppRoutes.REGISTERPAGE),
                        child: Text(
                          CustomStrings.registerhere,
                          style: TextStyle(
                            color: HoopayColor.darkbackColor,
                            fontSize: height / 50,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
