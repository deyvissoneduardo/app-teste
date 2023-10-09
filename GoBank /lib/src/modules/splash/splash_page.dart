import 'dart:async';

import 'package:flutter/material.dart';
import '/src/modules/utils/colornotifire.dart';
import '/src/modules/utils/media.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../onbonding.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
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
  void initState() {
    super.initState();
    getdarkmodepreviousstate();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Onbonding(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: notifire.getprimerycolor,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                color: Colors.transparent,
                height: height,
                width: width,
                child: Image.asset(
                  'images/splash.png',
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: height / 2.4,
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
    );
  }
}
