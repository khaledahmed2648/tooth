import 'package:get/get.dart';

class PatientExtractionsController extends GetxController{
  int caseType=0;
  changeCaseType(int caseT){
    if(caseType!=caseT){
      caseType=caseT;
      update();
    }
  }

}