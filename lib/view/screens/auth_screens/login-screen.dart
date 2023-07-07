import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:tooth/controller/auth_controller/login_controller.dart';
import 'package:tooth/view/screens/auth_screens/register-screen.dart';
import 'package:tooth/view/screens/doctor_screens/doctor-home-screen.dart';
import 'package:tooth/view/widgets/auth/auth_tail.dart';
import 'package:tooth/view/widgets/auth/custom_login_botton.dart';
import 'package:tooth/view/widgets/auth/custom_login_logo.dart';
import '../../../../utils.dart';
import '../../../controller/auth_controller/register_controller.dart';
import '../../widgets/auth/custom_login_textfield.dart';
import '../../widgets/auth/signup_choose_position.dart';

class LoginScreen extends StatelessWidget {
  LoginControllerImp controller = Get.put(LoginControllerImp());

  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    print(fem);
    double ffem = fem * 0.97;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          child: Container(
            padding:
                EdgeInsets.fromLTRB(33 * fem, 20 * fem, 31 * fem, 57 * fem),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Form(
              key: controller.formKey,
              child: ListView(
                children: [
                  CustomLoginLogo(),
                  Text(
                    'رقم الهاتف',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 22,
                        fontWeight: FontWeight.w700),
                  ).marginOnly(bottom: 10),
                  CustomLoginTextField(
                    onValidate: (value) {
                      if (!GetUtils.isPhoneNumber(value!))
                        return 'رقم هاتف غير صالح';
                      else
                        return null;
                    },
                    textDirection: TextDirection.ltr,
                    hint: 'رقم الهاتف',
                    suffixIcon: Icon(
                      Icons.phone,
                    ),
                    controller: controller.phoneController,
                  ),
                  GetBuilder<LoginControllerImp>(
                    builder: (controller) => SignUpChoosePosition(
                        userStatus: controller.userStatus,
                        patientOnTap: () {
                          controller.changePosition(UserStatus.patient);
                        },
                        doctorOnTap: () {
                          controller.changePosition(UserStatus.doctor);
                        }).marginSymmetric(horizontal: 50 * fem),
                  ),
                  GetBuilder<LoginControllerImp>(
                    builder: (controller) => Column(
                      children: [
                        if (controller.pageStatus != PageStatus.loading)
                          CustomLoginBotton(
                            text: 'تسجيل الدخول',
                            onPressed: () async {
                              await controller.login();
                            },
                          ),
                        if (controller.pageStatus == PageStatus.loading)
                          Center(
                            child:
                                CircularProgressIndicator(color: Colors.blue),
                          ),
                      ],
                    ),
                  ),
                  AuthTextTail(
                    text: 'ليس لديك حساب ؟',
                    textButton: ' التسجيل',
                    buttonOnPressed: () {
                      Get.to(() => RegisterScreen());
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
