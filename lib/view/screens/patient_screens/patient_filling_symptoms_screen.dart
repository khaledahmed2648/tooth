import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tooth/controller/patient_controller/patient_filling_symptoms_controller.dart';
import 'package:tooth/view/screens/patient_screens/patient_extractions_screen.dart';
import 'package:tooth/view/screens/patient_screens/patient_first_details_screen.dart';

import '../../../controller/patient_controller/add_patient_controller.dart';

class PatientFillingSymptomsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PatientFillingSymptomsController controller =
        Get.put(PatientFillingSymptomsController());
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        resizeToAvoidBottomInset: true,
        body: GetBuilder<PatientFillingSymptomsController>(
          builder: (controller) => SingleChildScrollView(
            child: Column(
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
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1.5, color: Color(0xffA8B1CE)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/filling.png',
                        width: MediaQuery.of(context).size.width * .2,
                        height: MediaQuery.of(context).size.width * .2,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'حشو',
                        style:
                            TextStyle(color: Color(0xff4BB2E3), fontSize: 23),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                        value: controller.symptoms[controller.painWithEating],
                        onChanged: (v) {
                          controller
                              .changeCheckBoxState(controller.painWithEating);
                        },
                        activeColor: Colors.white,
                        checkColor: Colors.blue,
                      ),
                    ),
                    Text(
                      'وجع مع الأكل',
                      style: TextStyle(color: Colors.black, fontSize: 19),
                    )
                  ],
                ),
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                        value: controller.symptoms[controller.brokenTooth],
                        onChanged: (v) {
                          controller
                              .changeCheckBoxState(controller.brokenTooth);
                        },
                        activeColor: Colors.white,
                        checkColor: Colors.blue,
                      ),
                    ),
                    Text(
                      'السنة مكسورة',
                      style: TextStyle(color: Colors.black, fontSize: 19),
                    )
                  ],
                ),
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                        value: controller.symptoms[controller.abscess],
                        onChanged: (v) {
                          controller.changeCheckBoxState(controller.abscess);
                        },
                        activeColor: Colors.white,
                        checkColor: Colors.blue,
                      ),
                    ),
                    Text(
                      'يوجد خُراج',
                      style: TextStyle(color: Colors.black, fontSize: 19),
                    )
                  ],
                ),
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                        value: controller.symptoms[controller.longPain],
                        onChanged: (v) {
                          controller.changeCheckBoxState(controller.longPain);
                        },
                        activeColor: Colors.white,
                        checkColor: Colors.blue,
                      ),
                    ),
                    Text(
                      'وجع مش بينيم طول الليل',
                      style: TextStyle(color: Colors.black, fontSize: 19),
                    )
                  ],
                ),
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                        value: controller.symptoms[controller.painWithIce],
                        onChanged: (v) {
                          controller
                              .changeCheckBoxState(controller.painWithIce);
                        },
                        activeColor: Colors.white,
                        checkColor: Colors.blue,
                      ),
                    ),
                    Text(
                      'وجع مع الساقع فقط و بيروح بمسكن',
                      style: TextStyle(color: Colors.black, fontSize: 19),
                    )
                  ],
                ),
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                        value:
                            controller.symptoms[controller.painWithHotAndIce],
                        onChanged: (v) {
                          controller.changeCheckBoxState(
                              controller.painWithHotAndIce);
                        },
                        activeColor: Colors.white,
                        checkColor: Colors.blue,
                      ),
                    ),
                    Text(
                      'وجع مع الساقع والسخن وبيروح\n من غير مسكن',
                      style: TextStyle(color: Colors.black, fontSize: 19),
                    )
                  ],
                ),
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                        value: controller.symptoms[controller.bloodWithWashing],
                        onChanged: (v) {
                          controller
                              .changeCheckBoxState(controller.bloodWithWashing);
                        },
                        activeColor: Colors.white,
                        checkColor: Colors.blue,
                      ),
                    ),
                    Text(
                      'فيه دم مع غسيل الأسنان',
                      style: TextStyle(color: Colors.black, fontSize: 19),
                    )
                  ],
                ),
              ],
            ).marginSymmetric(horizontal: 15),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.goToTheSecondPage();
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
