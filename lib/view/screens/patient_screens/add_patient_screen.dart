import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tooth/view/screens/patient_screens/patient_extractions_screen.dart';

import '../../../controller/patient_controller/add_patient_controller.dart';

class AddPatientScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   AddPatientController controller= Get.put(AddPatientController());
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
                'اختر التصنيف المناسب لحالتك',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ).marginOnly(bottom: 20),
            GetBuilder<AddPatientController>(builder: (controller) => Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .86,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10
                ),
                children: [
                  InkWell(
                    onTap:(){
                      controller.changeCaseType(0);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 1.5, color: Color(0xffA8B1CE)
                          ),
                        color: controller.caseType==0?Color(0xffD9D9D9):null
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/fixtures.png',
                            width: MediaQuery.of(context).size.width * .2,
                            height: MediaQuery.of(context).size.width * .2,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text('تركيبات',style: TextStyle(color: Color(0xff4BB2E3),fontSize: 23),)
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                      onTap:(){
                        controller.changeCaseType(1);
                      },
                      child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 1.5, color: Color(0xffA8B1CE),
                        ),
                        color: controller.caseType==1?Color(0xffD9D9D9):null
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
                        Text('حشو',style: TextStyle(color: Color(0xff4BB2E3),fontSize: 23),)
                      ],
                    ),
                  )),
                InkWell(
                    onTap:(){
                      controller.changeCaseType(2);
                    },
                    child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 1.5, color: Color(0xffA8B1CE)),
                        color: controller.caseType==2?Color(0xffD9D9D9):null),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/extraction.png',
                          width: MediaQuery.of(context).size.width * .2,
                          height: MediaQuery.of(context).size.width * .2,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text('خلع',style: TextStyle(color: Color(0xff4BB2E3),fontSize: 23),)
                      ],
                    ),
                  )),
                  InkWell(
                      onTap:(){
                        controller.changeCaseType(3);
                      },
                      child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 1.5, color: Color(0xffA8B1CE)),
                        color: controller.caseType==3?Color(0xffD9D9D9):null
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/orthodontics.png',
                          width: MediaQuery.of(context).size.width * .2,
                          height: MediaQuery.of(context).size.width * .2,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text('تقويم',style: TextStyle(color: Color(0xff4BB2E3),fontSize: 23),)
                      ],
                    ),
                  )),
                ],
              ),
            ),)
          ],
        ).marginSymmetric(horizontal: 15),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
           controller.goToNextPage();
         },
          backgroundColor: Colors.blue,
          child: Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,),
        ),
      ),
    );
  }
}
