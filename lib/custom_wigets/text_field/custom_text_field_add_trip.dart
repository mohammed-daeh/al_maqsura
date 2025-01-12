// ignore_for_file: prefer_const_constructors

import 'package:almaqsura/colors_app/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFfieldAddTrip extends StatelessWidget {
  final String hintText;
  final String? pathIcon;
  final String? Function(String?) validator;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final Function()? onTap;
  // final FocusNode? focusNode;
  final bool readOnly;

  const CustomTextFfieldAddTrip({
    required this.hintText,
    required this.validator,
    required this.controller,
    // required this.focusNode,
    this.pathIcon,
    this.keyboardType = TextInputType.text,
    this.onTap,
    this.readOnly = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      // focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: TextInputAction.next,
      validator: validator,
      onTap: onTap,
      readOnly: onTap != null,
      decoration: InputDecoration(
        prefixIcon: pathIcon != null
            ? SvgPicture.asset(
                pathIcon!,
                fit: BoxFit.scaleDown,
              )
            : null,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: ColorsApp.customGryText,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsApp.customGryText.withOpacity(0.5),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsApp.primaryColor.withOpacity(0.4),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }
}
