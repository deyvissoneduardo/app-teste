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
    final nameEC = TextEditingController();
    final emailEC = TextEditingController();
    final phoneEC = TextEditingController();
    final docEC = TextEditingController();
    final passwordEC = TextEditingController();

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
                  controller: nameEC,
                  hintText: CustomStrings.fullnamehere,
                  path: 'assets/images/fullname.png',
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.name,
                  onFieldSubmitted: (value) {},
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
                  controller: emailEC,
                  hintText: CustomStrings.emailhint,
                  path: 'assets/images/email.png',
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.emailAddress,
                  onFieldSubmitted: (value) {},
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
                  controller: phoneEC,
                  hintText: CustomStrings.phone,
                  path: 'assets/images/useradd.png',
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    TelefoneInputFormatter(),
                  ],
                  onFieldSubmitted: (value) {},
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
                  controller: docEC,
                  hintText: 'CPF',
                  path: 'assets/images/useradd.png',
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.number,
                  onFieldSubmitted: (value) {},
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
                TextFormFieldWidget(
                  controller: passwordEC,
                  hintText: CustomStrings.passwordhint,
                  obscureText: true,
                  path: 'assets/images/password.png',
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (value) {},
                ),
                const SizedBox(height: 20),
                Text(
                  CustomStrings.confirmpassword,
                  style: TextStyle(
                    color: HoopayColor.darkColor,
                    fontSize: height / 50,
                  ),
                ),
                TextFormFieldWidget(
                  hintText: CustomStrings.retypepassword,
                  path: 'assets/images/password.png',
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.text,
                  onFieldSubmitted: (value) {},
                ),
                const SizedBox(height: 20),
                ElevatedButtonWidget(
                  title: CustomStrings.registeraccount,
                  isLoading: controller.isLoading,
                  onPressed: () {
                    if (nameEC.text.isEmpty) {
                      Messages.of(context).showInfo('Nome e obrigatorio');
                    }
                    if (emailEC.text.isEmpty) {
                      Messages.of(context).showInfo('E-mail e obrigatorio');
                    }
                    if (docEC.text.isEmpty) {
                      Messages.of(context).showInfo('CPF e obrigatorio');
                    }
                    if (passwordEC.text.isEmpty && passwordEC.text.length > 8) {
                      Messages.of(context).showInfo(
                        'Senha e obrigatorio, ou precisa ter 8 caracteres',
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
