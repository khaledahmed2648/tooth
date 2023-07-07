import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tooth/controller/auth_controller/register_controller.dart';
import 'package:tooth/model/case_model.dart';
import 'package:tooth/view/screens/patient_screens/add_patient_screen.dart';
import 'package:tooth/view/widgets/doctor/home/doctor_home_main_body.dart';
import 'package:tooth/view/widgets/doctor/home/doctor_home_profile_body.dart';
import 'package:tooth/view/widgets/doctor/home/doctor_home_saved_cases.dart';


class DoctorHomeController extends GetxController{
  DoctorHomeController(){
    getAllCases();
  }
  PageStatus pageStatus = PageStatus.initial;
  List<CaseModel> caseModels = [];
  Future getAllCases() async {
    caseModels = [];

    pageStatus = PageStatus.loading;
    update();
    await FirebaseFirestore.instance.
        collection('cases')
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
  int currentPage=0;
  List<Widget> buildScreens = [
    DoctorHomeMainBody(),
    Container(),
    DoctorHomeSavedCases(),
    DoctorHomeProfile()
  ];
  changePage(int i) {
    if(i==1){
      Get.to(AddPatientScreen());
    }
    else{
      currentPage = i;
      update();
    }
  }
}