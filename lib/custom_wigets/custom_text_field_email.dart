// ignore_for_file: prefer_const_constructors, use_super_parameters

import 'package:almaqsura/colors_app/colors_app.dart';
import 'package:flutter/material.dart';

class CustomTextFieldEmail extends StatelessWidget {
  final String text;
  final String hintText;
  final Widget icon;
  final String? Function(String?) validator;
  final TextEditingController? controller;

  const CustomTextFieldEmail({
    Key? key,
    required this.text,
    required this.hintText,
    required this.icon,
    required this.validator,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff112220)),
          ),
          SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                color: ColorsApp.customGry,
                width: 1,
              ),
            ),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: icon,
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                  color: ColorsApp.customGry,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
              validator: validator,
            ),
          ),
        ],
      ),
    );
  }
}
