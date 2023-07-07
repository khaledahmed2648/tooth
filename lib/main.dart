import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tooth/core/medleware.dart';
import 'package:tooth/core/myservices.dart';
import 'package:tooth/core/strings/route.dart';
import 'package:tooth/utils.dart';
import 'package:tooth/view/screens/auth_screens/register-screen.dart';
import 'package:tooth/view/screens/patient_screens/add_patient_screen.dart';
import 'package:tooth/view/screens/doctor_screens/doctor-home-screen.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tooth/view/screens/auth_screens/login-screen.dart';
import 'package:tooth/view/screens/patient_screens/patient_home_screen.dart';
void main()async {
WidgetsFlutterBinding.ensureInitialized();
await initializeService();
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
	return GetMaterialApp(

		debugShowCheckedModeBanner: false,
		scrollBehavior: MyCustomScrollBehavior(),
		// home: Scaffold(
		// 	// body: SingleChildScrollView(
		// 	// 	child: LoginScreen(),
		// 	// ),
		//
		// 	body: OtpScreen(verificationId: ''),
		// ),
		textDirection: TextDirection.rtl,
		initialRoute: AppRoutes.loginScreen,
		getPages: [
			GetPage(name: AppRoutes.addPatientScreen, page: ()=>AddPatientScreen()),
			GetPage(name: AppRoutes.loginScreen, page: ()=>LoginScreen(),middlewares: [MainMiddleWare()]),
			GetPage(name: AppRoutes.doctorHomeScreen, page: ()=>DoctorHomeScreen()),
			GetPage(name: AppRoutes.patientHomeScreen, page: ()=>PatientHomeScreen()),
			GetPage(name: AppRoutes.registerScreen, page: ()=>RegisterScreen()),
		],
	);
	}
}
