import 'package:flutter/material.dart';
import 'topcard.dart';
import '../topupphone/topphone.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/colornotifire.dart';
import '../../../utils/media.dart';
import '../../../utils/string.dart';

class Topup extends StatefulWidget {
  const Topup({Key? key}) : super(key: key);

  @override
  State<Topup> createState() => _TopupState();
}

class _TopupState extends State<Topup> {
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
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width / 20),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: notifire.getdarkscolor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset('images/top.png'),
                    SizedBox(
                      height: height / 30,
                    ),
                    Text(
                      CustomStrings.top1,
                      style: TextStyle(
                        color: notifire.getdarkscolor,
                        fontSize: height / 40,
                        fontFamily: 'Gilroy Bold',
                      ),
                    ),
                    SizedBox(
                      height: height / 200,
                    ),
                    Text(
                      CustomStrings.top2,
                      style: TextStyle(
                        color: notifire.getdarkscolor,
                        fontSize: height / 40,
                        fontFamily: 'Gilroy Bold',
                      ),
                    ),
                    SizedBox(
                      height: height / 30,
                    ),
                    Text(
                      CustomStrings.top3,
                      style: TextStyle(
                        color: notifire.getdarkgreycolor,
                        fontSize: height / 60,
                        fontFamily: 'Gilroy Medium',
                      ),
                    ),
                    SizedBox(
                      height: height / 200,
                    ),
                    Text(
                      CustomStrings.top4,
                      style: TextStyle(
                        color: notifire.getdarkgreycolor,
                        fontSize: height / 60,
                        fontFamily: 'Gilroy Medium',
                      ),
                    ),
                    SizedBox(
                      height: height / 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TopCard(),
                          ),
                        );
                      },
                      child: scannerbutton(
                        notifire.getbluecolor,
                        CustomStrings.topcredit,
                        Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: height / 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TopPhone(),
                          ),
                        );
                      },
                      child: scannerbutton(
                        Colors.white,
                        CustomStrings.topphone,
                        notifire.getbluecolor,
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

  Widget scannerbutton(clr, txt, clr2) {
    return Container(
      height: height / 18,
      width: width / 2,
      decoration: BoxDecoration(
        color: clr,
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
        border: Border.all(color: notifire.getbluecolor),
      ),
      child: Center(
        child: Text(
          txt,
          style: TextStyle(
            color: clr2,
            fontSize: height / 55,
            fontFamily: 'Gilroy Bold',
          ),
        ),
      ),
    );
  }
}
