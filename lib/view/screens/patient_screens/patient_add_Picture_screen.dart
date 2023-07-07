import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:tooth/controller/patient_controller/patient_extractions_controller.dart';
import 'package:tooth/view/screens/patient_screens/patient_filling_symptoms_screen.dart';
import 'package:tooth/view/widgets/auth/custom_login_botton.dart';

import '../../../controller/patient_controller/patient_add_picture_controller.dart';

class PatientAddPictureScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(PatientAddPictureController());
    final double mainWidth = 430;
    final double fem = MediaQuery.of(context).size.width / mainWidth;
    final double ffem = fem * .97;
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        resizeToAvoidBottomInset: true,
        body: GetBuilder<PatientAddPictureController>(
          builder: (controller) => Column(
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
              if (controller.PickedImages.isEmpty)
                SizedBox(
                  height: 35,
                  child: Text(
                    'قم بتصوير أسنانك بوضوح',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ).marginOnly(bottom: 50),
              if (controller.PickedImages.isEmpty)
                InkWell(
                  onTap: () {
                    controller.getImage();
                  },
                  child: Image.asset(
                    'assets/images/add_image.png',
                    width: MediaQuery.of(context).size.width * .7,
                    height: MediaQuery.of(context).size.width * .7,
                  ).marginOnly(bottom: 15),
                ),
              if (controller.PickedImages.isNotEmpty)
                SizedBox(
                  height: MediaQuery.of(context).size.width * .5,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Image.file(
                          controller.PickedImages[index],
                          width: MediaQuery.of(context).size.width * .5,
                          height: MediaQuery.of(context).size.width * .5,
                        ),
                        itemCount: controller.PickedImages.length,
                      ),
                      InkWell(
                        onTap: (){
                          controller.getImage();
                        },
                        child: Image.asset(
                          'assets/images/add_image.png',
                          width: MediaQuery.of(context).size.width * .3,
                          height: MediaQuery.of(context).size.width * .5,
                        ),
                      )
                    ],
                  ).marginSymmetric(vertical: 10),
                ),
              CustomLoginBotton(onPressed: () {
                Get.to(PatientFillingSymptomsScreen());
              }, text: 'تشخيص')
                  .marginOnly(bottom: 10),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'لم يتم التحديد بعد',
                    style: TextStyle(
                        color: Color(0xff4BB2E3),
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ))
            ],
          ).marginSymmetric(horizontal: 15),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
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
