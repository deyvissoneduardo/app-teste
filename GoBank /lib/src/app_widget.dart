import 'package:flutter/material.dart';
import 'modules/auth/auth_module.dart';
import 'modules/splash/splash_page.dart';
import 'core/navigator/hoopay_nagivator.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hoopay',
      navigatorKey: HoopayNagivator.navigatorKey,
      routes: {
        ...AuthModule().routers,
      },
      home: const SplashPage(),
    );
  }
}
