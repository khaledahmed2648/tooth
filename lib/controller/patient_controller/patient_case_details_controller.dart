import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tooth/view/screens/patient_screens/patient_filling_symptoms_screen.dart';

import '../../view/screens/patient_screens/patient_extractions_screen.dart';

class PatientCaseDetailsController extends GetxController{
  PageController pageController=PageController(initialPage: 0);
  int currentPage=0;

  @override
  next() {
    currentPage++;
    pageController.animateToPage(currentPage, duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    update();
  }

  @override
  onPageChanged(int index) {
    currentPage=index;
    update();
  }
  @override
  void onInit(){
    pageController=PageController();
    super.onInit();

  }
}