import 'package:flutter/cupertino.dart';

import '../navigator/hoopay_nagivator.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider();

  // _logout() {}
  // User? get user => _firebaseAuth.currentUser;

  void loadListener() {
    // if (user != null) {
    // HoopayNagivator.to.pushNamedAndRemoveUntil('/home', (route) => false);
    // } else {
    HoopayNagivator.to.pushNamedAndRemoveUntil('/splash', (route) => false);
    // }
  }
}
