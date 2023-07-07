import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tooth/core/myservices.dart';
import 'package:tooth/model/user_model.dart';
import 'package:tooth/view/screens/patient_screens/patient_filling_symptoms_screen.dart';
import 'package:tooth/view/screens/patient_screens/patient_second_details_screen.dart';

import '../../view/screens/patient_screens/patient_extractions_screen.dart';

class PatientFirstDetailsController extends GetxController {
  var formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController(
      text: MyServices.sharedPreferences.getString('phone'));
  TextEditingController nameController = TextEditingController(
      text: MyServices.sharedPreferences.getString('name'));
  TextEditingController ageController = TextEditingController(
      text: MyServices.sharedPreferences.getString('age'));
  int caseType = 0;
  String selectedGovernorate = '${MyServices.sharedPreferences.getString('governorate')}';


  changeCaseType(int caseT) {
    if (caseType != caseT) {
      caseType = caseT;
      update();
    }
  }

  goToNextPage(String caseType) {
    if (formKey.currentState!.validate()) {
      Get.to(PatientSecondDetailsScreen(
          caseType: caseType,
          userModel: UserModel(
            age: ageController.text,
            gender: this.caseType == 0 ? 'male' : 'female',
            governorate: selectedGovernorate,
            name: nameController.text,
            phone: phoneController.text,
          )));
    }
  }
}
