import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import '../../../core/helpers/messages.dart';
import '../../../core/notifier/default_listener_notifier.dart';
import '../../../core/widgets/text_form_field_widget.dart';
import '../../../models/requests/login_request_model.dart';
import '/src/modules/profile/forgotpassword.dart';
import '/src/modules/utils/button.dart';
import '/src/modules/utils/media.dart';
import '/src/modules/utils/string.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/src/modules/utils/colornotifire.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  late ColorNotifire notifire;
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? previusstate = prefs.getBool('setIsDark');
    if (previusstate == null) {
      notifire.setIsDark = false;
    } else {
      notifire.setIsDark = previusstate;
    }
  }

  @override
  void initState() {
    DefaultListenerNotifier(changeNotifier: context.read<LoginController>())
        .listener(
      context: context,
      everCallback: (notifier, listenerInstance) {
        if (notifier is LoginController && notifier.hasError) {
          Messages.of(context).showInfo(notifier.error!);
        }
      },
      successCallback: (notifier, listenerInstance) {},
    );
    super.initState();
  }

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);

    return Scaffold(
      backgroundColor: notifire.getprimerycolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: height,
                  width: width,
                  color: Colors.transparent,
                  child: Image.asset(
                    'images/background.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: height / 20,
                    ),
                    SizedBox(
                      height: height / 20,
                    ),
                    // Center(
                    //   child: Text(
                    //     CustomStrings.login,
                    //     style: TextStyle(
                    //       color: notifire.getdarkscolor,
                    //       fontFamily: 'Gilroy Bold',
                    //       fontSize: height / 35,
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: height / 12.2,
                    ),
                    Stack(
                      children: [
                        Center(
                          child: Container(
                            height: height / 1.2,
                            width: width / 1.1,
                            decoration: BoxDecoration(
                              color: notifire.gettabwhitecolor,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(40),
                                topLeft: Radius.circular(40),
                              ),
                            ),
                            child: Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: height / 15,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: width / 18,
                                      ),
                                      Text(
                                        CustomStrings.email,
                                        style: TextStyle(
                                          color: notifire.getdarkscolor,
                                          fontSize: height / 50,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height / 70,
                                  ),
                                  TextFormFieldWidget(
                                    controller: _emailEC,
                                    notifire: notifire,
                                    hintText: CustomStrings.emailhint,
                                    path: 'images/email.png',
                                    textInputAction: TextInputAction.next,
                                    textInputType: TextInputType.emailAddress,
                                    onFieldSubmitted: (value) {},
                                    validator: Validatorless.multiple([
                                      Validatorless.required(
                                        'campo obrigatorio',
                                      ),
                                      Validatorless.email('e-mail invalido'),
                                    ]),
                                  ),
                                  SizedBox(
                                    height: height / 35,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: width / 18,
                                      ),
                                      Text(
                                        CustomStrings.password,
                                        style: TextStyle(
                                          color: notifire.getdarkscolor,
                                          fontSize: height / 50,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height / 70,
                                  ),
                                  TextFormFieldWidget(
                                    controller: _passwordEC,
                                    notifire: notifire,
                                    hintText: CustomStrings.passwordhint,
                                    obscureText: true,
                                    path: 'images/password.png',
                                    textInputAction: TextInputAction.done,
                                    onFieldSubmitted: (value) {},
                                    validator: Validatorless.multiple([
                                      Validatorless.required(
                                        'campo obrigatorio',
                                      ),
                                      Validatorless.min(
                                        8,
                                        'minimo de 8 caracters',
                                      ),
                                    ]),
                                  ),
                                  SizedBox(
                                    height: height / 35,
                                  ),
                                  Row(
                                    children: [
                                      const Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const ForgotPassword(),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          height: height / 40,
                                          color: Colors.transparent,
                                          child: Text(
                                            CustomStrings.forgotpassword,
                                            style: TextStyle(
                                              color: notifire.getdarkscolor,
                                              fontSize: height / 60,
                                              fontFamily: 'Gilroy Medium',
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width / 18,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height / 20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      final isValid =
                                          formKey.currentState?.validate();
                                      if (isValid == true) {
                                        context.read<LoginController>().login(
                                              loginRequestModel:
                                                  LoginRequestModel(
                                                email: _emailEC.text.trim(),
                                                password:
                                                    _passwordEC.text.trim(),
                                              ),
                                            );
                                      }
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => const Verify(),
                                      //   ),
                                      // );
                                    },
                                    child: Custombutton.button(
                                      notifire.getbluecolor,
                                      CustomStrings.login,
                                      width / 2,
                                    ),
                                  ),
                                  // SizedBox(
                                  // height: height / 50,
                                  // ),
                                  // Padding(
                                  //   padding: EdgeInsets.symmetric(
                                  //     horizontal: width / 18,
                                  //   ),
                                  //   child: Row(
                                  //     mainAxisAlignment:
                                  //         MainAxisAlignment.spaceAround,
                                  //     children: [
                                  //       Container(
                                  //         height: height / 700,
                                  //         width: width / 3,
                                  //         color: Colors.grey,
                                  //       ),
                                  //       Text(
                                  //         'or',
                                  //         style: TextStyle(
                                  //           color: notifire.getdarkgreycolor,
                                  //           fontSize: height / 50,
                                  //         ),
                                  //       ),
                                  //       Container(
                                  //         height: height / 700,
                                  //         width: width / 3,
                                  //         color: Colors.grey,
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  // SizedBox(
                                  //   height: height / 20,
                                  // ),
                                  // Row(
                                  //   children: [
                                  //     const Spacer(),
                                  //     Container(
                                  //       height: height / 10,
                                  //       width: width / 5.1,
                                  //       decoration: BoxDecoration(
                                  //         color: notifire.getprimerycolor,
                                  //         borderRadius: BorderRadius.circular(19),
                                  //         boxShadow: [
                                  //           BoxShadow(
                                  //             color: const Color(0xff6C56F9)
                                  //                 .withOpacity(0.11),
                                  //             blurRadius: 10.0,
                                  //           ),
                                  //         ],
                                  //       ),
                                  //       child: Center(
                                  //         child: Image.asset(
                                  //           'images/facebook.png',
                                  //           height: height / 20,
                                  //         ),
                                  //       ),
                                  //     ),
                                  //     SizedBox(
                                  //       width: width / 12,
                                  //     ),
                                  //     Container(
                                  //       height: height / 10,
                                  //       width: width / 5.1,
                                  //       decoration: BoxDecoration(
                                  //         color: notifire.getprimerycolor,
                                  //         borderRadius: BorderRadius.circular(19),
                                  //         boxShadow: [
                                  //           BoxShadow(
                                  //             color: const Color(0xff6C56F9)
                                  //                 .withOpacity(0.11),
                                  //             blurRadius: 10.0,
                                  //           ),
                                  //         ],
                                  //       ),
                                  //       child: Center(
                                  //         child: Image.asset(
                                  //           'images/google.png',
                                  //           height: height / 20,
                                  //         ),
                                  //       ),
                                  //     ),
                                  //     const Spacer(),
                                  //   ],
                                  // ),
                                  SizedBox(
                                    height: height / 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        CustomStrings.account,
                                        style: TextStyle(
                                          color: notifire.getdarkgreycolor
                                              .withOpacity(0.6),
                                          fontSize: height / 50,
                                        ),
                                      ),
                                      SizedBox(
                                        width: width / 100,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          print('object');
                                          Navigator.of(context)
                                              .pushNamed('/register');
                                        },
                                        child: Text(
                                          CustomStrings.registerhere,
                                          style: TextStyle(
                                            color: notifire.getdarkscolor,
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
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: height / 10,
                    ),
                    Center(
                      child: Image.asset(
                        'images/logos.png',
                        height: height / 7,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
