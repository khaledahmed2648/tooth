import 'package:flutter/material.dart';
import 'package:tooth/controller/auth_controller/register_controller.dart';

import '../../../utils.dart';

// Color(0x7fffb800):Color(0xffffb800)
class SignUpChoosePosition extends StatefulWidget {
  void Function () patientOnTap;
  void Function () doctorOnTap;
  UserStatus userStatus;

  SignUpChoosePosition({
    Key? key,
    required this.userStatus,
    required this.patientOnTap,
    required this.doctorOnTap
  }) : super(key: key);

  @override
  State<SignUpChoosePosition> createState() => _SignUpChoosePositionState();
}

class _SignUpChoosePositionState extends State<SignUpChoosePosition> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    print(fem);
    double ffem = fem * 0.97;
    return Container(
     margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(70 * fem),
          border: Border.all(color: Color(0x7fffb800), width: 1)),
      height: 67 * fem,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: widget.patientOnTap,
            child: Container(
              width: 110 * fem,
              height: 50 * fem,
                padding: EdgeInsets.fromLTRB(
                    7.17 * fem, 7.17 * fem, 7.17 * fem, 7.17 * fem),
              decoration: BoxDecoration(
                  color: widget.userStatus == UserStatus.doctor
                      ? Color(0xffffb800)
                      : Color(0x7fffb800),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(60 * fem),
                      bottomRight: Radius.circular(60 * fem))),
              child: Text(
                'مريض',
                textAlign: TextAlign.center,
                style: SafeGoogleFont(
                  'KohinoorArabic-Semibold',
                  fontSize: 25 * ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.2575 * ffem / fem,
                  color: Color(0xffffffff),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 7 * fem,
          ),
          InkWell(
            onTap: widget.doctorOnTap,
            child: Container(
              padding: EdgeInsets.fromLTRB(
                  7.17 * fem, 7.17 * fem, 7.17 * fem, 7.17 * fem),
              width: 110 * fem,
              height: 50 * fem,
              decoration: BoxDecoration(
                  color: widget.userStatus == UserStatus.doctor
                      ? Color(0x7fffb800)
                      : Color(0xffffb800),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60 * fem),
                       bottomLeft: Radius.circular(60 * fem))),
              child: Text(
                'طبيب',
                textAlign: TextAlign.center,
                style: SafeGoogleFont(
                  'KohinoorArabic-Semibold',
                  fontSize: 25 * ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.2575 * ffem / fem,
                  color: Color(0xffffffff),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
