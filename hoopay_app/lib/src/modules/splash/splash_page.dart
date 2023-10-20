import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.transparent,
            height: height,
            width: width,
            child: Image.asset(
              'assets/images/splash.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Obx(() {
              return AnimatedOpacity(
                duration: const Duration(milliseconds: 2000),
                curve: Curves.easeIn,
                opacity: controller.animationOpacityLogo.value,
                onEnd: () => controller.initApp(),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 2000),
                  width: controller.logoAnimetionWidth,
                  height: controller.logoAnimetionHeight,
                  curve: Curves.linearToEaseOut,
                  child: Image.asset(
                    'assets/images/logos.png',
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
