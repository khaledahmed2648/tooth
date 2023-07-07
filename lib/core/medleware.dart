import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tooth/core/myservices.dart';
import 'package:tooth/core/strings/route.dart';

class MainMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (MyServices.sharedPreferences.getBool('loginAsDoctor') == true) {
      return const RouteSettings(name: AppRoutes.doctorHomeScreen);
    } else if (MyServices.sharedPreferences.getBool('loginAsPatient') == true) {
      return const RouteSettings(name: AppRoutes.patientHomeScreen);
    } else {
      return null;
    }
  }
}
