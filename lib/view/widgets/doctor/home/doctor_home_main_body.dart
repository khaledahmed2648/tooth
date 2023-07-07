import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tooth/controller/auth_controller/register_controller.dart';
import 'package:tooth/controller/doctor_controller/doctor_home_controller.dart';
import 'package:tooth/view/screens/patient_screens/patient_case_details_screen.dart';
import 'package:tooth/view/widgets/doctor/costom_patient_model.dart';

class DoctorHomeMainBody extends StatelessWidget {
  const DoctorHomeMainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
              child: Text(
            'الحالات المتاحة',
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ).marginSymmetric(vertical: 15)
          ).marginOnly(right: 15),
          GetBuilder<DoctorHomeController>(builder: (controller) {
            if (controller.pageStatus != PageStatus.loading) {
              if (controller.pageStatus == PageStatus.success) {
                if (controller.caseModels.isNotEmpty) {
                  print(controller.caseModels[0].constructionTime);
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Center(
                      child: InkWell(
                        onTap: () {
                          Get.to(PatientCaseDetailsScreen(caseModel:controller.caseModels[index]));
                        },
                        child: DoctorPatientModel(
                            patientCase: controller.getCaseType(
                                controller.caseModels[index].caseType),
                            recordDate:
                            ' ${controller.caseModels[index].constructionTime}',
                            governorate:
                            '  ${controller.caseModels[index].caseGovernorate}'),
                      ),
                    ),
                    itemCount: controller.caseModels.length,
                  );
                } else {
                  return Center(
                      child: Text(
                        'لم يحدث اضافة حالات بعد',
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ));
                }
              } else {
                if (controller.pageStatus == PageStatus.initial) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Text(
                    'ربما هناك مشكلة بالانترنت برجاء التأكد من البيانات او الوايفاي',
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  );
                }
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          })
        ],
      ),
    );
  }
}
