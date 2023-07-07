import 'dart:io';

import 'package:get/get.dart';
import 'package:tooth/view/screens/patient_screens/patient_first_details_screen.dart';

class PatientFillingSymptomsController extends GetxController {
  String painWithEating = 'painWithEating';
  String brokenTooth = 'brokenTooth';
  String abscess = 'abscess';
  String longPain = 'longPain';
  String painWithIce = 'painWithIce';
  String bloodWithWashing = 'bloodWithWashing';
  String painWithHotAndIce = 'painWithHotAndIce';
  Map<String, bool> symptoms = {
    "painWithEating": false,
    "brokenTooth": false,
    "abscess": false,
    "longPain": false,
    "painWithIce": false,
    "painWithHotAndIce": false,
    "bloodWithWashing": false,
  };

  changeCheckBoxState(String checkBoxName) {
    if (symptoms[checkBoxName] == false)
      symptoms[checkBoxName] = true;
    else
      symptoms[checkBoxName] = false;

    update();
  }

  String getCaseType() {
    if (symptoms['painWithEating'] == true ||
        symptoms['brokenTooth'] == true ||
        symptoms['abscess'] == true ||
        symptoms['longPain'] == true ||
        symptoms['painWithHotAndIce'] == true)
      return 'nerveFilling';
    else
      return 'ordinaryFilling';
  }

  goToTheSecondPage() {
    Get.to(PatientFirstDetailsScreen(caseType: getCaseType()));
  }
}
