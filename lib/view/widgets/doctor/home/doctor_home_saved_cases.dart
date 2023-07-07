import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tooth/view/screens/patient_screens/patient_case_details_screen.dart';

import '../costom_patient_model.dart';

class DoctorHomeSavedCases extends StatelessWidget {
  const DoctorHomeSavedCases({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
              alignment: Alignment.topRight,
              child: Text(
                'الحالات المحفوظة',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ).marginSymmetric(vertical: 15)
          ).marginOnly(right: 15),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Center(
              child: InkWell(
                onTap: (){
                },
                child: DoctorPatientModel(
                    patientCase: 'خلع',
                    recordDate: ' 2023/02/01',
                    governorate: ' البحيرة'),
              ),
            ),
            itemCount: 12,
          ),
        ],
      ),
    );
  }
}
