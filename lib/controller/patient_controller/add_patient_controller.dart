import 'package:get/get.dart';
import 'package:tooth/view/screens/patient_screens/patient_filling_symptoms_screen.dart';
import 'package:tooth/view/screens/patient_screens/patient_first_details_screen.dart';

import '../../view/screens/patient_screens/patient_extractions_screen.dart';

class AddPatientController extends GetxController {
  int caseType = 0;
  changeCaseType(int caseT) {
    if (caseType != caseT) {
      caseType = caseT;
      update();
    }
  }

  goToNextPage() {
    if (caseType == 0) {
      Get.to(PatientExtractionScreen());
    } else if (caseType == 1) {
      Get.to(PatientFillingSymptomsScreen());
    } else {
      Get.to(PatientFirstDetailsScreen(
        caseType: caseType == 2 ? 'removal' : 'orthodontic',
      ));
    }
  }
}
