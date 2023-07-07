import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';
import 'package:tooth/controller/doctor_controller/doctor_home_controller.dart';
import 'package:tooth/controller/patient_controller/home_patient_controller.dart';
import 'package:tooth/view/screens/patient_screens/add_patient_screen.dart';


class PatientHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    Get.put(HomePatientController());
    return SafeArea(
        child: GetBuilder<HomePatientController>(
          builder: (controller) => Scaffold(

            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            resizeToAvoidBottomInset: true,
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index){
                controller.changePage(index);

              },
              backgroundColor: Colors.white,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.currentPage,
              selectedItemColor: Colors.blue,
              selectedIconTheme: IconThemeData(color: Colors.blue),
              items: [
                BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/images/homebottomsheet.png',
                      width: 40.9 * fem,
                      height: 30.69 * fem,
                      color:controller.currentPage==0? Colors.blue:null,
                    ),
                    label: 'home'),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/images/personbottomsheet.png',
                      width: 40.9 * fem,
                      height: 30.69 * fem,
                      color:controller.currentPage==1? Colors.blue:null,

                    ),
                    label: 'person'),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Get.to(AddPatientScreen());
              },
              backgroundColor: Color(0xffffb800),
              child: Image.asset(
                'assets/images/person-add-bottomsheet.png',
                width: 28.58 * fem,
                height: 28.83 * fem,
                color: Colors.white,
              ),
            ),
            body: controller.buildScreens[controller.currentPage],
          ),
        )
    );
  }
}