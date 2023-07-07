import 'package:flutter/material.dart';

import '../../../utils.dart';

// Color(0x7fffb800):Color(0xffffb800)
class SignUpChoosePosition extends StatefulWidget {

  SignUpChoosePosition({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpChoosePosition> createState() => _SignUpChoosePositionState();
}

class _SignUpChoosePositionState extends State<SignUpChoosePosition> {
  bool isCompany=true;
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    print(fem);
    double ffem = fem * 0.97;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(70 * fem),
          border: Border.all(color: Color(0xff0093F5), width: 1)),
      margin: EdgeInsets.fromLTRB(0 * fem, 36.17 * fem, 0 * fem, 36.17 * fem),

      width: 100 * fem,
      height: 50 * fem,
    );
  }
}
