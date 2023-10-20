import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/helpers/hoopay_color.dart';
import '../../../core/helpers/messages.dart';
import '../../../core/helpers/string.dart';
import '../../../core/widgets/elevated_button_widget.dart';
import '../../../core/widgets/text_form_field_widget.dart';
import 'register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    void register() {
      if (controller.nameEC.text.isEmpty) {
        return Messages.of(context).showError('Nome e obrigatório');
      }
      if (controller.emailEC.text.isEmpty) {
        return Messages.of(context).showError('E-mail e obrigatório');
      }
      if (controller.docEC.text.isEmpty) {
        return Messages.of(context).showError('CPF e obrigatório');
      }
      if (controller.passwordEC.text.isEmpty &&
          controller.passwordEC.text.length > 8) {
        return Messages.of(context).showError(
          'Senha e obrigatório, ou precisa ter 8 caracteres',
        );
      }
      controller.registerUser();
    }

    return Scaffold(
      backgroundColor: HoopayColor.primeryColor,
      appBar: AppBar(
        backgroundColor: HoopayColor.primeryColor,
        elevation: 0,
        title: Text(
          CustomStrings.register,
          style: TextStyle(
            color: HoopayColor.primerydarkColor,
            fontFamily: 'Gilroy Bold',
            fontSize: height / 35,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
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
            child: ListView(
              children: [
                const SizedBox(height: 20),
                Text(
                  CustomStrings.fullname,
                  style: TextStyle(
                    color: HoopayColor.darkColor,
                    fontSize: height / 50,
                  ),
                ),
                TextFormFieldWidget(
                  controller: controller.nameEC,
                  hintText: CustomStrings.fullnamehere,
                  path: 'assets/images/fullname.png',
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.name,
                ),
                const SizedBox(height: 20),
                Text(
                  CustomStrings.email,
                  style: TextStyle(
                    color: HoopayColor.darkColor,
                    fontSize: height / 50,
                  ),
                ),
                TextFormFieldWidget(
                  controller: controller.emailEC,
                  hintText: CustomStrings.emailhint,
                  path: 'assets/images/email.png',
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                Text(
                  CustomStrings.phone,
                  style: TextStyle(
                    color: HoopayColor.darkColor,
                    fontSize: height / 50,
                  ),
                ),
                TextFormFieldWidget(
                  controller: controller.phoneEC,
                  hintText: CustomStrings.phone,
                  path: 'assets/images/useradd.png',
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    TelefoneInputFormatter(),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'CPF',
                  style: TextStyle(
                    color: HoopayColor.darkColor,
                    fontSize: height / 50,
                  ),
                ),
                TextFormFieldWidget(
                  controller: controller.docEC,
                  hintText: 'CPF',
                  path: 'assets/images/useradd.png',
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CpfInputFormatter(),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  CustomStrings.password,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: height / 50,
                  ),
                ),
                Obx(
                  () => TextFormFieldWidget(
                    controller: controller.passwordEC,
                    hintText: CustomStrings.passwordhint,
                    obscureText: controller.viewPassword.value,
                    path: 'assets/images/password.png',
                    textInputAction: TextInputAction.next,
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.viewPassword.value =
                            !controller.viewPassword.value;
                      },
                      icon: Icon(
                        controller.viewPassword.isFalse
                            ? Icons.remove_red_eye_outlined
                            : Icons.remove_red_eye,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  CustomStrings.confirmpassword,
                  style: TextStyle(
                    color: HoopayColor.darkColor,
                    fontSize: height / 50,
                  ),
                ),
                Obx(
                  () => TextFormFieldWidget(
                    hintText: CustomStrings.retypepassword,
                    path: 'assets/images/password.png',
                    obscureText: controller.viewConfirmPassword.value,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.text,
                    onFieldSubmitted: (value) => register(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.viewConfirmPassword.value =
                            !controller.viewConfirmPassword.value;
                      },
                      icon: Icon(
                        controller.viewConfirmPassword.isFalse
                            ? Icons.remove_red_eye_outlined
                            : Icons.remove_red_eye,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButtonWidget(
                  title: CustomStrings.registeraccount,
                  isLoading: controller.isLoading,
                  onPressed: () => register(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
