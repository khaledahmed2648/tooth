import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tooth/model/user_model.dart';
import 'package:tooth/view/screens/auth_screens/otp_screen.dart';

abstract class RegisterController extends GetxController {
  register();

  goToLogin();
}

enum PageStatus { initial, success, loading, error }

class RegisterControllerImp extends RegisterController {
  String selectedGovernorate = 'القاهرة';
  PageStatus pageStatus = PageStatus.initial;
  var formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController(text: '+2');
  TextEditingController nameController = TextEditingController();
  TextEditingController nationalIdController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  UserStatus userStatus = UserStatus.patient;

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

  int caseType = 0;
  changeCaseType(int caseT) {
    if (caseType != caseT) {
      caseType = caseT;
      update();
    }
  }

  @override
  goToLogin() {}
  static FirebaseAuth auth = FirebaseAuth.instance;

  @override
  register() async {
    update();
    print('register');
    if (formKey.currentState!.validate()) {
      pageStatus = PageStatus.loading;

      print(phoneController.text);
      await auth.verifyPhoneNumber(
        phoneNumber: phoneController.text,
        verificationCompleted: (PhoneAuthCredential credential) async {
          print('completed');

          await auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException error) {
          Get.snackbar(
              'تنبية', 'من فضلك تحقق من الاتصال بالانترنت ومن رقم الهاتف');
          pageStatus = PageStatus.error;
        },
        codeSent: (String verificationId, int? forceResendingToken) {
          Get.to(OtpScreen(
            register: true,
            userStatus: userStatus,
            verificationId: verificationId,
            userModel: UserModel(
                age: ageController.text,
                name: nameController.text,
                phone: phoneController.text,
                governorate: selectedGovernorate,
                nationalId: nationalIdController.text,
                gender: caseType == 0 ? 'male' : 'female'),
          ));
          pageStatus = PageStatus.initial;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      pageStatus = PageStatus.initial;
    }
  }
}

enum UserStatus { doctor, patient }
