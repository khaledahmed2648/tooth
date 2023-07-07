import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils.dart';

class CustomLoginTextField extends StatelessWidget {
  TextDirection? textDirection;
  final String hint;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  String? Function(String?)? onValidate;

  CustomLoginTextField(
      {Key? key,
      required this.hint,
      this.textDirection,
      this.onValidate,
      this.prefixIcon,
      this.suffixIcon,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return TextFormField(
      textDirection: textDirection,
      validator: onValidate,
      controller: controller,
      textAlign: TextAlign.right,
      style: SafeGoogleFont(
        'KohinoorArabic-Regular',
        fontSize: 24 * ffem,
        fontWeight: FontWeight.w400,
        height: 1.2575 * ffem / fem,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        hintStyle: SafeGoogleFont(
          'KohinoorArabic-Regular',
          fontSize: 24 * ffem,
          fontWeight: FontWeight.w400,
          height: 1.2575 * ffem / fem,
          color: Color(0xffa8b1ce),
        ),
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: prefixIcon,
              )
            : null,
        suffixIcon: suffixIcon != null
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: suffixIcon,
              )
            : null,
        hintText: hint,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: Colors.grey, width: 1)),
        contentPadding: const EdgeInsets.all(7.0),
      ),
    ).marginOnly(bottom: 10);
  }
}
