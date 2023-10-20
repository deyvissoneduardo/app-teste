import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/modules/core/core_bindings.dart';
import 'src/routers/app_routes.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.SPLASHPAGE,
      initialBinding: CoreBindings(),
      getPages: AppRoutes.pages,
    ),
  );
}
