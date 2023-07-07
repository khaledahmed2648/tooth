import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';
import 'package:tooth/controller/doctor_controller/doctor_home_controller.dart';


class DoctorHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
   Get.put(DoctorHomeController());
    return SafeArea(
      child: GetBuilder<DoctorHomeController>(
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
                    'assets/images/person-add-bottomsheet.png',
                    width: 40.9 * fem,
                    height: 30.69 * fem,
                    color:controller.currentPage==1? Colors.blue:null,

                  ),
                  label: 'addPerson'),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/markbottomsheet.png',
                    width: 40.9 * fem,
                    height: 30.69 * fem,
                    color:controller.currentPage==2? Colors.blue:null,

                  ),
                  label: 'mark'),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/personbottomsheet.png',
                    width: 40.9 * fem,
                    height: 30.69 * fem,
                    color:controller.currentPage==3? Colors.blue:null,

                  ),
                  label: 'person'),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Color(0xffffb800),
            child: Image.asset(
              'assets/images/searchIcon.png',
              width: 35.58 * fem,
              height: 45.83 * fem,
            ),
          ),
          body: controller.buildScreens[controller.currentPage],
        ),
      )
    );
  }
}
