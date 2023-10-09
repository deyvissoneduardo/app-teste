import 'package:flutter/material.dart';

class HoopayNagivator {
  HoopayNagivator._();

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static NavigatorState get to => navigatorKey.currentState!;
}
