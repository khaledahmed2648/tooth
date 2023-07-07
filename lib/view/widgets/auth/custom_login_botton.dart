import 'package:flutter/material.dart';

import '../../../utils.dart';

class CustomLoginBotton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  const CustomLoginBotton({Key? key, required this.onPressed, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return  Container(
        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2*fem, 5*fem),
        width: 364*fem,
        height: 62*fem,
        child:MaterialButton(
          color:  Color(0xff4bb2e3),
          onPressed: onPressed,
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30*fem),
          ),
          child: Text(
            text,
            style: SafeGoogleFont (

              'KohinoorArabic-Semibold',
              fontSize: 24*ffem,
              fontWeight: FontWeight.bold,
              height: 1.2575*ffem/fem,
              color: Color(0xffffffff),

            ),
            textAlign: TextAlign.center,
          ),
        )
    );



    //
    //   Stack(
    //     children: [
    //       Positioned(
    //         // rectangle10pBm (5:63)
    //         left: 0*fem,
    //         top: 0*fem,
    //         child:
    //       ),
    //       Positioned(
    //         // yTy (5:64)
    //         left: 146*fem,
    //         top: 20*fem,
    //         child: Align(
    //           child: SizedBox(
    //             width: 72*fem,
    //             height: 31*fem,
    //             child:
    //           ),
    //         ),
    //       ),
    //       Positioned(
    //         // v1q (5:65)
    //         left: 0*fem,
    //         top: 67*fem,
    //         child: Align(
    //           child: SizedBox(
    //             width: 133*fem,
    //             height: 23*fem,
    //             child: Text(
    //               'نسيت كلمة السر؟',
    //               style: SafeGoogleFont (
    //                 'KohinoorArabic-Semibold',
    //                 fontSize: 18*ffem,
    //                 fontWeight: FontWeight.w400,
    //                 height: 1.2575*ffem/fem,
    //                 color: Color(0xff4bb2e3),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
