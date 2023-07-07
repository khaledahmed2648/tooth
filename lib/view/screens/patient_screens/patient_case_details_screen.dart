import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tooth/controller/patient_controller/patient_case_details_controller.dart';
import 'package:tooth/controller/patient_controller/patient_first_details_controller.dart';
import 'package:tooth/model/case_model.dart';
import 'package:tooth/view/screens/patient_screens/patient_second_details_screen.dart';

class PatientCaseDetailsScreen extends StatelessWidget {
  final CaseModel caseModel;
  const PatientCaseDetailsScreen({Key? key,required this.caseModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PatientCaseDetailsController controller=Get.put(
      PatientCaseDetailsController(),
    );
    return SafeArea(
        child: Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            SizedBox(
              height: 150,
              width: double.infinity,
              child: Stack(
                children: [
                  PageView.builder(
                    onPageChanged: (index){
                      controller.onPageChanged(index);
                    },
                    itemBuilder: (context, index) => Image.network(
                      caseModel.caseImage0!,
                    ),
                    itemCount: 2,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GetBuilder<PatientCaseDetailsController>(
                        builder: (controller) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                              2,
                              (index) => AnimatedContainer(
                                    duration: Duration(milliseconds: 900),
                                    margin: EdgeInsets.only(right: 7),
                                    height: 8,
                                    width: controller.currentPage == index
                                        ? 27
                                        : 16,
                                    decoration: BoxDecoration(
                                      color: controller.currentPage == index
                                          ? Colors.blue
                                          : const Color(0xffDDDDDD),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ))
                        ],
                      );
                    }),
                  ).marginOnly(bottom: 7),
                ],
              ),
            ),
            Text(
              'الاسم ثلاثي',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 23),
            ),
            Text(
              'عبس مخمج حسيت الزيات',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 23),
            ).marginOnly(bottom: 15),
            Text(
              'نوع الحالة',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 23),
            ),
            Text(
              'حشو عادي',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 23),
            ).marginOnly(bottom: 15),
            Text(
              'السن',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 23),
            ),
            Text(
              '25',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 23),
            ).marginOnly(bottom: 15),
            Text(
              'الجنس',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 23),
            ),
            Text(
              'ذكر',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 23),
            ).marginOnly(bottom: 15),
            Text(
              'المحافظة',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 23),
            ),
            Text(
              'الجيزة',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 23),
            ).marginOnly(bottom: 15),
            Text(
              'رقم الهاتف',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 23),
            ),
            Text(
              '01126458455',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 23),
            ).marginOnly(bottom: 15),

          ],
        ),
      ),
    ));
  }
}
