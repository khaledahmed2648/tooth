import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:tooth/controller/auth_controller/register_controller.dart';
import 'package:tooth/core/myservices.dart';
import 'package:tooth/model/user_model.dart';
import 'package:tooth/view/screens/doctor_screens/doctor-home-screen.dart';

import '../../view/screens/patient_screens/patient_home_screen.dart';

class OtpScreenController extends GetxController {
  TextEditingController phoneController = TextEditingController();

  registerUser(
      {required UserModel userModel,
      required UserStatus userStatus,
      required String smsCode,
      required String verificationId}) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    await RegisterControllerImp.auth
        .signInWithCredential(credential)
        .then((value) {
      if (userStatus == UserStatus.doctor) {
        FirebaseFirestore.instance
            .collection('doctors')
            .doc(userModel.phone)
            .get()
            .then((value) {
          if (value.exists) {
            Get.snackbar(
                'تنبيه', 'هذا المستخدم موجود بالفعل برجاء تسجيل الدخول');
          } else {
            FirebaseFirestore.instance
                .collection('doctors')
                .doc(userModel.phone)
                .set({
              'name': userModel.name,
              'phone': userModel.phone,
              'age': userModel.age,
              'gender': userModel.gender,
              'nationalId': userModel.nationalId,
              'governorate': userModel.governorate
            }).then((value) {
              MyServices.sharedPreferences.setString('phone', userModel.phone!);
              MyServices.sharedPreferences.setString('age', userModel.age!);
              MyServices.sharedPreferences
                  .setString('gender', userModel.gender!);
              MyServices.sharedPreferences
                  .setString('governorate', userModel.governorate!);
              MyServices.sharedPreferences
                  .setString('nationalId', userModel.nationalId!);
              MyServices.sharedPreferences.setBool('loginAsDoctor', true);
              Get.offAll(DoctorHomeScreen());
            });
          }
        });
      } else {
        FirebaseFirestore.instance
            .collection('patients')
            .doc(userModel.phone)
            .get()
            .then((value) {
          if (value.exists) {
            Get.snackbar(
                'تنبيه', 'هذا المستخدم موجود بالفعل برجاء تسجيل الدخول');
          } else {
            FirebaseFirestore.instance
                .collection('patients')
                .doc(userModel.phone)
                .set({
              'name': userModel.name,
              'phone': userModel.phone,
              'age': userModel.age,
              'gender': userModel.gender,
              'governorate': userModel.governorate,
              'nationalId': userModel.nationalId
            }).then((value) {
              MyServices.sharedPreferences.setString(
                'name',
                userModel.name!,
              );
              MyServices.sharedPreferences.setString('phone', userModel.phone!);
              MyServices.sharedPreferences.setString('age', userModel.age!);
              MyServices.sharedPreferences
                  .setString('gender', userModel.gender!);
              MyServices.sharedPreferences
                  .setString('governorate', userModel.governorate!);
              MyServices.sharedPreferences
                  .setString('nationalId', userModel.nationalId!);
              MyServices.sharedPreferences.setBool('loginAsPatient', true);
              Get.offAll(PatientHomeScreen());
            });
          }
        });
      }
    }).catchError((error) {
      print(error);
      Get.snackbar('تنبية', 'هذا الكود غير صحيح');
    });
  }

  loginUser(
      {required UserModel userModel,
      required UserStatus userStatus,
      required String smsCode,
      required String verificationId}) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    await RegisterControllerImp.auth
        .signInWithCredential(credential)
        .then((value) {
      if (userStatus == UserStatus.doctor) {
        FirebaseFirestore.instance
            .collection('doctors')
            .doc(userModel.phone)
            .get()
            .then((value) {
          if (!value.exists) {
            Get.snackbar('تنبيه', 'هذا المستخدم غير موجود برجاء انشاء حساب');
          } else {
            MyServices.sharedPreferences.setString(
              'name',
              value.data()!['name'],
            );
            MyServices.sharedPreferences
                .setString('phone', value.data()!['phone']);
            MyServices.sharedPreferences.setString('age', value.data()!['age']);
            MyServices.sharedPreferences
                .setString('gender', value.data()!['gender']);
            MyServices.sharedPreferences
                .setString('governorate', value.data()!['governorate']);
            MyServices.sharedPreferences
                .setString('nationalId', userModel.nationalId!);
            MyServices.sharedPreferences.setBool('loginAsDoctor', true);
            Get.offAll(DoctorHomeScreen());
          }
        });
      } else {
        FirebaseFirestore.instance
            .collection('patients')
            .doc(userModel.phone)
            .get()
            .then((value) {
          if (!value.exists) {
            Get.snackbar('تنبيه', 'هذا المستخدم غير موجود برجاء انشاء حساب');
          } else {
            MyServices.sharedPreferences.setString(
              'name',
              value.data()!['name'],
            );
            MyServices.sharedPreferences
                .setString('phone', value.data()!['phone']);
            MyServices.sharedPreferences.setString('age', value.data()!['age']);
            MyServices.sharedPreferences
                .setString('gender', value.data()!['gender']);
            MyServices.sharedPreferences
                .setString('governorate', value.data()!['governorate']);
            MyServices.sharedPreferences
                .setString('nationalId', userModel.nationalId!);
            MyServices.sharedPreferences.setBool('loginAsPatient', true);
            Get.offAll(PatientHomeScreen());
          }
        });
      }
    }).catchError((error) {
      print(error);
      Get.snackbar('تنبية', 'هذا الكود غير صحيح');
    });
  }


}
