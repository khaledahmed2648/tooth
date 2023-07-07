import 'package:flutter/cupertino.dart';

class CustomLoginLogo extends StatelessWidget {
  const CustomLoginLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Container(
      // logo2color1xs5 (5:37)
      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2*fem, 84*fem),
      width: 148*fem,
      height: 170*fem,
      child: Image.asset(
        'assets/images/logo-2-color-1.png',
        fit: BoxFit.contain,
      ),
    );
  }
}
