import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tooth/controller/auth_controller/register_controller.dart';
import 'package:tooth/core/strings/route.dart';
import 'package:tooth/model/user_model.dart';
import 'package:tooth/view/screens/doctor_screens/doctor-home-screen.dart';

import '../../view/screens/auth_screens/otp_screen.dart';
import '../../view/screens/patient_screens/patient_home_screen.dart';

abstract class LoginController extends GetxController {
  login();
  goToRegister();
}

class LoginControllerImp extends LoginController {
  UserStatus userStatus = UserStatus.patient;
  var formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController(text: '+2');

  changePosition(UserStatus userStatus) {
    print(this.userStatus.toString());
    if (!(this.userStatus == userStatus)) {
      print(this.userStatus.toString());

      if (this.userStatus == UserStatus.patient) {
        this.userStatus = UserStatus.doctor;
      } else {
        this.userStatus = UserStatus.patient;
      }
    }
    update();
  }

  @override
  goToRegister() {
    Get.toNamed(AppRoutes.registerScreen);
  }

  PageStatus pageStatus = PageStatus.initial;
  static FirebaseAuth auth = FirebaseAuth.instance;

  @override
  login() async {
    print('login');
    if (formKey.currentState!.validate()) {
      pageStatus = PageStatus.loading;
      update();
      print(phoneController.text);
      await auth.verifyPhoneNumber(
        phoneNumber: phoneController.text,
        verificationCompleted: (PhoneAuthCredential credential) async {
          print('didn\'t git it');
        },
        verificationFailed: (FirebaseAuthException error) {
          pageStatus = PageStatus.initial;
          Get.snackbar(
              'تنبية', 'من فضلك تحقق من الاتصال بالانترنت ومن رقم الهاتف');
        },
        codeSent: (String verificationId, int? forceResendingToken) {
          pageStatus = PageStatus.initial;
          Get.to(OtpScreen(
            register: false,
            verificationId: verificationId,
            userModel: UserModel(phone: phoneController.text),
            userStatus: userStatus,
          ));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      pageStatus = PageStatus.initial;
      update();
    }
  }
}
