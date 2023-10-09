import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import '../../../core/widgets/text_form_field_widget.dart';
import '../../utils/button.dart';
import '../../utils/colornotifire.dart';
import '../../utils/media.dart';
import '../../utils/string.dart';
import '../../login/verify.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late ColorNotifire notifire;

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
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    final _nameEC = TextEditingController();
    final _emailEC = TextEditingController();
    final _passwordEC = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    @override
    void dispose() {
      _nameEC.dispose();
      _emailEC.dispose();
      _passwordEC.dispose();
      super.dispose();
    }

    return Scaffold(
      backgroundColor: notifire.getprimerycolor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          CustomStrings.register,
          style: TextStyle(
            color: notifire.getdarkscolor,
            fontFamily: 'Gilroy Bold',
            fontSize: height / 35,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
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
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: height / 12,
                      ),
                      Stack(
                        children: [
                          Center(
                            child: Container(
                              height: height / 1,
                              width: width / 1.1,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                              ),
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
                                        CustomStrings.fullname,
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
                                    controller: _nameEC,
                                    notifire: notifire,
                                    hintText: CustomStrings.fullnamehere,
                                    path: 'images/fullname.png',
                                    textInputAction: TextInputAction.next,
                                    textInputType: TextInputType.name,
                                    onFieldSubmitted: (value) {},
                                    validator: Validatorless.required(
                                      'campo obrigatorio',
                                    ),
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
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      bottom: 15,
                                    ),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        CustomStrings.phone,
                                        style: TextStyle(
                                          color: notifire.getdarkscolor,
                                          fontSize: height / 50,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TextFormFieldWidget(
                                    controller: _passwordEC,
                                    notifire: notifire,
                                    hintText: CustomStrings.phone,
                                    path: 'images/useradd.png',
                                    obscureText: true,
                                    textInputAction: TextInputAction.next,
                                    textInputType: TextInputType.text,
                                    onFieldSubmitted: (value) {},
                                    validator: Validatorless.multiple([
                                      Validatorless.required(
                                        'campo obrigatorio',
                                      ),
                                      Validatorless.min(
                                        8,
                                        'minimo de 8 caracteres',
                                      ),
                                    ]),
                                  ),
                                  const SizedBox(
                                    height: 15,
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
                                    hintText: CustomStrings.createpassword,
                                    path: 'images/password.png',
                                    obscureText: true,
                                    textInputAction: TextInputAction.next,
                                    textInputType: TextInputType.text,
                                    onFieldSubmitted: (value) {},
                                    validator: Validatorless.multiple([
                                      Validatorless.required(
                                        'campo obrigatorio',
                                      ),
                                      Validatorless.min(
                                        8,
                                        'minimo de 8 caracteres',
                                      ),
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
                                        CustomStrings.confirmpassword,
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
                                    hintText: CustomStrings.retypepassword,
                                    path: 'images/password.png',
                                    obscureText: true,
                                    textInputAction: TextInputAction.next,
                                    textInputType: TextInputType.text,
                                    onFieldSubmitted: (value) {},
                                    validator: Validatorless.multiple([
                                      Validatorless.required(
                                        'campo obrigatorio',
                                      ),
                                      Validatorless.compare(
                                        _passwordEC,
                                        'senha e confirmar senha não e igual',
                                      ),
                                    ]),
                                  ),
                                  SizedBox(
                                    height: height / 35,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      final state =
                                          _formKey.currentState?.validate();
                                      if (state == true) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const Verify(),
                                          ),
                                        );
                                      } else {
                                        debugPrint('invalido');
                                      }
                                    },
                                    child: Custombutton.button(
                                      notifire.getbluecolor,
                                      CustomStrings.registeraccount,
                                      width / 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   height: height / 40,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Text(
                      //       CustomStrings.accounts,
                      //       style: TextStyle(
                      //         color: notifire.getdarkgreycolor.withOpacity(0.6),
                      //         fontSize: height / 50,
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: width / 100,
                      //     ),
                      //     Text(
                      //       CustomStrings.loginhear,
                      //       style: TextStyle(
                      //         color: notifire.getdarkscolor,
                      //         fontSize: height / 50,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: height / 90,
                    ),
                    Center(
                      child: Image.asset(
                        'images/logos.png',
                        height: height / 8,
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

//   Widget textfieldss(textclr, hintclr, borderclr, img, hinttext, img2) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: width / 18),
//       child: Container(
//         color: Colors.transparent,
//         height: height / 15,
//         child: TextField(
//           autofocus: false,
//           style: TextStyle(
//             fontSize: height / 50,
//             color: textclr,
//           ),
//           decoration: InputDecoration(
//             hintText: hinttext,
//             suffixIcon: Padding(
//               padding: EdgeInsets.symmetric(
//                 vertical: height / 50,
//                 horizontal: height / 70,
//               ),
//               child: Image.asset(
//                 img2,
//                 height: height / 50,
//               ),
//             ),
//             prefixIcon: Padding(
//               padding: EdgeInsets.symmetric(
//                 vertical: height / 100,
//                 horizontal: height / 70,
//               ),
//               child: Image.asset(
//                 img,
//                 height: height / 30,
//               ),
//             ),
//             hintStyle: TextStyle(color: hintclr, fontSize: height / 60),
//             focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: borderclr),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: Colors.grey.withOpacity(0.4),
//               ),
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
