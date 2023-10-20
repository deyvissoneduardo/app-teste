import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/helpers/form_helper.dart';
import '../../../core/helpers/hoopay_color.dart';
import '../../../core/helpers/string.dart';
import '../../../core/widgets/elevated_button_widget.dart';
import '../../../core/widgets/text_form_field_widget.dart';
import './recover_password_controller.dart';

class RecoverPasswordPage extends GetView<RecoverPasswordController> {
  const RecoverPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: HoopayColor.primeryColor,
      appBar: AppBar(
        backgroundColor: HoopayColor.primeryColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          CustomStrings.forgotpasswords,
          style: TextStyle(
            color: HoopayColor.primerydarkColor,
            fontFamily: 'Gilroy Bold',
            fontSize: height / 35,
          ),
        ),
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
          ListView(
            padding: const EdgeInsets.all(20.0),
            children: [
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/forgotp.png',
                height: height / 7,
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Text(
                  CustomStrings.resetyourpassword,
                  style: TextStyle(
                    color: HoopayColor.darkColor,
                    fontSize: height / 40,
                    fontFamily: 'Gilroy Bold',
                  ),
                ),
              ),
              SizedBox(
                height: height / 100,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  CustomStrings.linkemail,
                  style: TextStyle(
                    color: HoopayColor.greyColor,
                    fontSize: height / 60,
                    fontFamily: 'Gilroy Bold',
                  ),
                ),
              ),
              SizedBox(
                height: height / 40,
              ),
              Text(
                CustomStrings.email,
                style: TextStyle(
                  color: HoopayColor.darkColor,
                  fontSize: height / 50,
                  fontFamily: 'Gilroy Bold',
                ),
              ),
              const SizedBox(height: 10),
              TextFormFieldWidget(
                // controller: controller.emailEC,
                hintText: CustomStrings.emailhint,
                path: 'assets/images/email.png',
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.emailAddress,
                onFieldSubmitted: (value) {},
                onTapOutside: (value) => context.unfocus(),
              ),
              const SizedBox(height: 40),
              ElevatedButtonWidget(
                title: CustomStrings.sendemail,
                isLoading: controller.isLoading,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
