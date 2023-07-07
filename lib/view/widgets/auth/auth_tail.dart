import 'package:flutter/material.dart';

import '../../../utils.dart';

class AuthTextTail extends StatelessWidget {
  final String text;
  final String textButton;
  final void Function() buttonOnPressed;
  const AuthTextTail({Key? key, required this.text, required this.textButton, required this.buttonOnPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    print(fem);
    double ffem = fem * 0.97;
    return  Container(
      // BnK (5:66)
      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 9 * fem, 0 * fem),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed:buttonOnPressed, child:  Text(
            textButton,
            style: SafeGoogleFont(
              'KohinoorArabic-Semibold',
              fontSize: 18 * ffem,
              fontWeight: FontWeight.w400,
              height: 1.2575 * ffem / fem,
              color: Color(0xff4bb2e3),
            ),
          ),),
          Text(
            text ,
            style: SafeGoogleFont(
              'KohinoorArabic-Semibold',
              fontSize: 18 * ffem,
              fontWeight: FontWeight.w400,
              height: 1.2575 * ffem / fem,
              color: Color(0xff232323),
            ),
          ),

        ],

      ),
    )
    ;
  }
}
