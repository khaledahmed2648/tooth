import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:tooth/controller/auth_controller/Otp_screen_controller.dart';
import 'package:tooth/controller/auth_controller/register_controller.dart';
import 'package:tooth/model/user_model.dart';
import 'package:tooth/view/widgets/auth/custom_login_botton.dart';

import '../../../utils.dart';

class OtpScreen extends StatelessWidget {
  final UserModel userModel;
  final bool register;
  final UserStatus userStatus;
  final String verificationId;

  const OtpScreen(
      {super.key,
      required this.register,
      required this.verificationId,
      required this.userModel,
      required this.userStatus});

  @override
  Widget build(BuildContext context) {
    OtpScreenController controller = Get.put(OtpScreenController());
    double mainWidth = 430;
    double fem = MediaQuery.of(context).size.width / mainWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 150 * fem,
            ),
            Lottie.asset('assets/animations/otp_lock.json',
                width: 187 * fem,
                height: 187 * fem,
                fit: BoxFit.cover,
                reverse: false,
                repeat: true),
            SizedBox(
              height: 47 * fem,
            ),
            OTPTextField(
              length: 6,
              keyboardType: TextInputType.number,
              spaceBetween: 13 * fem,
              fieldWidth: 50 * fem,
              otpFieldStyle: OtpFieldStyle(backgroundColor: Color(0xFFDEDEDE)),
              onChanged: (pin) {},
              margin: EdgeInsets.symmetric(horizontal: 10 * fem),
              width: MediaQuery.of(context).size.width,
              fieldStyle: FieldStyle.box,
              style: TextStyle(fontSize: 17),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              onCompleted: (pin) async {
                print(String.fromCharCodes(pin.runes.toList().reversed));
                if (register == true) {
                  controller.registerUser(
                      userModel: userModel,
                      userStatus: userStatus,
                      smsCode:
                          String.fromCharCodes(pin.runes.toList().reversed),
                      verificationId: verificationId);
                } else {
                  controller.loginUser(
                      userModel: userModel,
                      userStatus: userStatus,
                      smsCode:
                          String.fromCharCodes(pin.runes.toList().reversed),
                      verificationId: verificationId);
                }
              },
            ),
            SizedBox(
              height: 40 * fem,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     TextButton(
            //         onPressed: () {},
            //         child: Text(
            //           'إعادة ارسال',
            //           style: SafeGoogleFont(
            //             'KohinoorArabic-Semibold',
            //             fontSize: 18 * ffem,
            //             fontWeight: FontWeight.bold,
            //             height: 1.2575 * ffem / fem,
            //             color: Color(0xff4BB2E3),
            //           ),
            //         )),
            //     Text(
            //       'لم تتلق الرمز؟',
            //       style: SafeGoogleFont(
            //         'KohinoorArabic-Semibold',
            //         fontSize: 18 * ffem,
            //         fontWeight: FontWeight.bold,
            //         height: 1.2575 * ffem / fem,
            //         color: Color(0xff232323),
            //       ),
            //     )
            //   ],
            // ),
            SizedBox(
              height: 40 * fem,
            ),
          ],
        ),
      ),
    );
  }
}
