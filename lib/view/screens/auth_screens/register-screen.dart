import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:tooth/controller/auth_controller/register_controller.dart';
import 'package:tooth/main_variables.dart';
import 'package:tooth/view/widgets/auth/signup_choose_position.dart';

import '../../widgets/auth/auth_tail.dart';
import '../../widgets/auth/custom_login_botton.dart';
import '../../widgets/auth/custom_login_logo.dart';
import '../../widgets/auth/custom_login_textfield.dart';
import '../doctor_screens/doctor-home-screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterControllerImp controller = Get.put(RegisterControllerImp());
  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    print(fem);
    double ffem = fem * 0.97;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(33 * fem, 20 * fem, 31 * fem, 57 * fem),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Form(
            key: controller.formKey,
            child: ListView(
              children: [
                CustomLoginLogo(),
                CustomLoginTextField(
                    hint: 'الإسم ثلاثي',
                    onValidate: (value) {
                      if (value!.length < 6)
                        return 'الاسم قصير للغاية';
                      else
                        return null;
                    },
                    suffixIcon: Image.asset(
                      'assets/images/personbottomsheet.png',
                      width: 31.9 * fem,
                      height: 21.69 * fem,
                    ),
                    controller: controller.nameController),
                CustomLoginTextField(
                  textDirection: TextDirection.ltr,
                  hint: 'رقم الهاتف',
                  onValidate: (value) {
                    if (!GetUtils.isPhoneNumber(value!))
                      return 'رقم هاتف غير صالح';
                    else
                      return null;
                  },
                  suffixIcon: Icon(
                    Icons.phone,
                  ),
                  controller: controller.phoneController,
                ),
                CustomLoginTextField(
                  textDirection: TextDirection.ltr,
                  hint: 'الرقم القومي',
                  onValidate: (value) {
                    if (value!.length!=14)
                      return 'رقم قومي غير صالح';
                    else
                      return null;
                  },
                  suffixIcon: Icon(
                    Icons.calendar_month,
                  ),
                  controller: controller.nationalIdController,
                ),
                GetBuilder<RegisterControllerImp>(builder: (controller) => Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1,color: Colors.grey),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: controller.selectedGovernorate,
                      hint: Text('اختر المحافظة'),
                      onChanged: (String? newValue) {
                        controller.selectedGovernorate = newValue!;
                        controller.update();
                      },
                      items: egyptianGovernorates.map((String governorate) {
                        return DropdownMenuItem<String>(
                          value: governorate,
                          child: Text(governorate),
                        );
                      }).toList(),
                    ),
                  ),
                ),).marginOnly(bottom: 10),
                CustomLoginTextField(
                    onValidate: (value) {
                      if (value!.isEmpty)
                        return 'برجاء ملء هذا الحقل';
                      else
                        return null;
                    },
                    hint: 'السن',
                    controller: controller.ageController),
                GetBuilder<RegisterControllerImp>(
                  builder: (controller) => SignUpChoosePosition(
                      userStatus: controller.userStatus,
                      patientOnTap: () {
                        controller.changePosition(UserStatus.patient);
                      },
                      doctorOnTap: () {
                        controller.changePosition(UserStatus.doctor);
                      }).marginSymmetric(horizontal: 50 * fem),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * .25,
                  child: GetBuilder<RegisterControllerImp>(
                    builder: (controller) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.changeCaseType(0);
                          },
                          child: Container(
                              alignment: AlignmentDirectional.center,
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      width: 1.5, color: Color(0xffA8B1CE)),
                                  color: controller.caseType == 0
                                      ? Color(0xffD9D9D9)
                                      : null),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/male_logo.png',
                                    width:
                                        MediaQuery.of(context).size.width * .1,
                                    height:
                                        MediaQuery.of(context).size.width * .1,
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    'ذكر',
                                    style: TextStyle(
                                        color: Color(0xff4BB2E3), fontSize: 15),
                                  )
                                ],
                              )),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        InkWell(
                          onTap: () {
                            controller.changeCaseType(1);
                          },
                          child: Container(
                              alignment: AlignmentDirectional.center,
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      width: 1.5, color: Color(0xffA8B1CE)),
                                  color: controller.caseType == 1
                                      ? Color(0xffD9D9D9)
                                      : null),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/female_logo.png',
                                    width:
                                        MediaQuery.of(context).size.width * .1,
                                    height:
                                        MediaQuery.of(context).size.width * .1,
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    'أنثى',
                                    style: TextStyle(
                                        color: Color(0xff4BB2E3), fontSize: 15),
                                  )
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                ).marginSymmetric(vertical: 13),

                // Center(child: SignUpChoosePosition(userStatus:controller.userStatus)),
                GetBuilder<RegisterControllerImp>(
                  builder: (controller) => Column(
                    children: [
                      if (controller.pageStatus != PageStatus.loading)
                        CustomLoginBotton(
                          text: 'التسجيل',
                          onPressed: () async {
                            await controller.register();
                          },
                        ),
                      if (controller.pageStatus == PageStatus.loading)
                        Center(
                          child: CircularProgressIndicator(color: Colors.blue),
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 80 * fem,
                ),
                AuthTextTail(
                  text: 'لديك حساب بالفعل ؟',
                  textButton: '  الدخول',
                  buttonOnPressed: () {
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
