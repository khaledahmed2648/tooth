import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tooth/controller/patient_controller/patient_extractions_controller.dart';
import 'package:tooth/view/screens/patient_screens/patient_add_Picture_screen.dart';
import 'package:tooth/view/screens/patient_screens/patient_first_details_screen.dart';

class PatientExtractionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PatientExtractionsController controller =
        Get.put(PatientExtractionsController());
    final double mainWidth = 430;
    final double fem = MediaQuery.of(context).size.width / mainWidth;
    final double ffem = fem * .97;
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        resizeToAvoidBottomInset: true,
        body: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.topStart,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios),
                color: Color(0xff4BB2E3),
              ),
            ),
            SizedBox(
              height: 35,
              child: Text(
                'اختر نوع التركيبة',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ).marginOnly(bottom: 20),
            GetBuilder<PatientExtractionsController>(
              builder: (controller) => Expanded(
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .86,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  children: [
                    InkWell(
                      onTap: () {
                        controller.changeCaseType(0);
                      },
                      child: Container(
                          alignment: AlignmentDirectional.center,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  width: 1.5, color: Color(0xffA8B1CE)),
                              color: controller.caseType == 0
                                  ? Color(0xffD9D9D9)
                                  : null),
                          child: Text(
                            'تركيبات ثابتة',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff4BB2E3), fontSize: 30),
                          )),
                    ),
                    InkWell(
                        onTap: () {
                          controller.changeCaseType(1);
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                width: 1.5,
                                color: Color(0xffA8B1CE),
                              ),
                              color: controller.caseType == 1
                                  ? Color(0xffD9D9D9)
                                  : null),
                          child: Align(
                            child: Text(
                              'تركيبات متحركة',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xff4BB2E3), fontSize: 30),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            )
          ],
        ).marginSymmetric(horizontal: 15),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(PatientFirstDetailsScreen(
              caseType: controller.caseType == 0
                  ? 'fixedCombinations'
                  : 'movedCombinations',
            ));
          },
          backgroundColor: Colors.blue,
          child: Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
