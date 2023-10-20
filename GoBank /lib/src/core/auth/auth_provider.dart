import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../navigator/hoopay_nagivator.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider();

  Future<void> loadListener() async {
    final sp = await SharedPreferences.getInstance();
    final token = sp.getString('token');
    if (token != null) {
      HoopayNagivator.to.pushNamedAndRemoveUntil('/home', (route) => false);
    }
    HoopayNagivator.to.pushNamedAndRemoveUntil('/splash', (route) => false);
  }
}
