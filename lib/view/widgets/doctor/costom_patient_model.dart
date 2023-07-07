import 'package:flutter/material.dart';

import '../../../utils.dart';

class DoctorPatientModel extends StatelessWidget {
  final String patientCase;
  final String recordDate;
  final String governorate;

  const DoctorPatientModel(
      {Key? key,
      required this.patientCase,
      required this.recordDate,
      required this.governorate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      // autogroupfcwxm2b (14MEV6bAixZLePemFKfCWX)
      margin: EdgeInsets.fromLTRB(6.17 * fem, 0 * fem, 0 * fem, 0 * fem),
      width: 376 * fem,
      height: 185.54 * fem,
      child: Stack(
        children: [
          Positioned(
            // rectangle189Yw (26:316)
            left: 0 * fem,
            top: 0 * fem,
            child: Align(
              child: SizedBox(
                width: 376 * fem,
                height: 152 * fem,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14 * fem),
                    border: Border.all(color: Color(0xffa8b1ce)),
                    color: Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x0f000000),
                        offset: Offset(0 * fem, 4 * fem),
                        blurRadius: 13 * fem,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            // NDq (26:334)
            left: 70 * fem,
            top: 26 * fem,
            child: Align(
              child: SizedBox(
                width: 150 * fem,
                height: 26 * fem,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'الحالة ',
                      style: SafeGoogleFont(
                        'KohinoorArabic-Semibold',
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2575 * ffem / fem,
                        color: Color(0xff232323),
                      ),
                    ),
                    Text(
                      patientCase,
                      style: SafeGoogleFont(
                        'KohinoorArabic-Semibold',
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2575 * ffem / fem,
                        color: Color(0xff4bb2e3),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            // NDq (26:334)
            left: 80 * fem,
            top: 66 * fem,
            child: Align(
              child: SizedBox(
                width: 141 * fem,
                height: 26 * fem,
                child: RichText(
                  text: TextSpan(
                    style: SafeGoogleFont(
                      'KohinoorArabic-Semibold',
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.171875 * ffem / fem,
                      color: Color(0xff4bb2e3),
                    ),
                    children: [
                      TextSpan(
                        text: 'المحافظة: ',
                        style: SafeGoogleFont(
                          'KohinoorArabic-Semibold',
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2575 * ffem / fem,
                          color: Color(0xff232323),
                        ),
                      ),
                      TextSpan(
                        text: governorate,
                        style: SafeGoogleFont(
                          'KohinoorArabic-Semibold',
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2575 * ffem / fem,
                          color: Color(0xff4bb2e3),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            // 67D (26:335)
            left: 74 * fem,
            top: 108 * fem,
            child: Align(
              child: SizedBox(
                width: 151 * fem,
                height: 21 * fem,
                child: RichText(
                  text: TextSpan(
                    style: SafeGoogleFont(
                      'KohinoorArabic-Semibold',
                      fontSize: 16 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2575 * ffem / fem,
                      color: Color(0xff4bb2e3),
                    ),
                    children: [
                      TextSpan(
                        text: 'تاريخ النشر: ',
                        style: SafeGoogleFont(
                          'KohinoorArabic-Semibold',
                          fontSize: 16 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2575 * ffem / fem,
                          color: Color(0xff232323),
                        ),
                      ),
                      TextSpan(
                        text: recordDate,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            // saveFy5 (26:336)
            left: 15.7083129883 * fem,
            top: 108.0833282471 * fem,
            child: Align(
              child: SizedBox(
                width: 21.58 * fem,
                height: 30.83 * fem,
                child: Image.asset(
                  'assets/images/save-i4K.png',
                  width: 21.58 * fem,
                  height: 30.83 * fem,
                ),
              ),
            ),
          ),
          Positioned(
            // locationuAT (26:338)
            left: 242.1666259766 * fem,
            top: 73.1015472412 * fem,
            child: Align(
              child: SizedBox(
                width: 16.67 * fem,
                height: 20.82 * fem,
                child: Image.asset(
                  'assets/images/location.png',
                  width: 16.67 * fem,
                  height: 20.82 * fem,
                ),
              ),
            ),
          ),
          Positioned(
            // calenderFdd (26:340)
            left: 240.2109375 * fem,
            top: 111.1875 * fem,
            child: Align(
              child: SizedBox(
                width: 20.45 * fem,
                height: 19.41 * fem,
                child: Image.asset(
                  'assets/images/calender.png',
                  width: 20.45 * fem,
                  height: 19.41 * fem,
                ),
              ),
            ),
          ),
          Positioned(
            left: 241.515625 * fem,
            top: 29.390625 * fem,
            child: Align(
              child: SizedBox(
                width: 17.97 * fem,
                height: 24.22 * fem,
                child: Image.asset(
                  'assets/images/dental-report.png',
                  width: 17.97 * fem,
                  height: 24.22 * fem,
                ),
              ),
            ),
          ),
          Positioned(
            // dentaldentalveneersdentistdent (14:202)
            left: 279.3090820312 * fem,
            top: 46.0884628296 * fem,
            child: Align(
              child: SizedBox(
                width: 69.38 * fem,
                height: 66.87 * fem,
                child: Image.asset(
                  'assets/images/dentaldental-veneersdentistdentistrymedicalicon-1.png',
                  width: 69.38 * fem,
                  height: 66.87 * fem,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
