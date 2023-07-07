import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tooth/controller/auth_controller/register_controller.dart';
import 'package:tooth/core/myservices.dart';
import 'package:tooth/model/case_model.dart';
import 'package:tooth/view/widgets/doctor/home/doctor_home_saved_cases.dart';
import 'package:tooth/view/widgets/patient/patient_added_cases.dart';

import '../../view/widgets/patient/home_patient_profile.dart';

class HomePatientController extends GetxController {
  HomePatientController() {
    getAddedCases();
  }
  HomePatientController get =Get.
  PageStatus pageStatus = PageStatus.initial;
  int currentPage = 0;
  List<Widget> buildScreens = [
    PatientAddedCases(),
    PatientHomeProfile(),
  ];
  changePage(int i) {
    currentPage = i;
    update();
  }

  List<CaseModel> caseModels = [];
  Future getAddedCases() async {
    caseModels = [];

    pageStatus = PageStatus.loading;
    update();
    await FirebaseFirestore.instance
        .collection('patients')
        .doc('${MyServices.sharedPreferences.getString('phone')}')
        .collection('addedCases')
        .get()
        .then((caseValue) {
      caseValue.docs.forEach((element) {
        caseModels.add(CaseModel.fromJson(element.data()));
      });
      pageStatus = PageStatus.success;
    });

    update();
  }

  String getCaseType(String caseType) {
    if (caseType == 'nerveFilling') {
      return 'حشو عصب';
    } else if (caseType == 'ordinaryFilling') {
      return 'حشو عادي';
    } else if (caseType == 'fixedCombinations') {
      print('تركيبات ثابتة');
      return 'تركيبات ثابتة';
    } else if (caseType == 'movedCombinations') {
      return 'تركيبات متحركة';
    } else if (caseType == 'removal') {
      return 'خلع';
    } else {
      return 'تقويم';
    }
  }
}
