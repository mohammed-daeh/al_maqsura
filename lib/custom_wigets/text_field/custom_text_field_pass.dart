// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:almaqsura/colors_app/colors_app.dart';
import 'package:flutter/material.dart';

class CustomTextFieldPassword extends StatefulWidget {
  final String text;
  final String? Function(String?) validator;
  final TextEditingController? controller;

  const CustomTextFieldPassword({
    super.key,
    required this.text,
    required this.validator,
    this.controller,
  });

  @override
  _CustomTextFieldPasswordState createState() =>
      _CustomTextFieldPasswordState();
}

class _CustomTextFieldPasswordState extends State<CustomTextFieldPassword> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.text,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.only(right: 34),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                color: ColorsApp.customGry,
                width: 1,
              ),
            ),
            child: TextFormField(
              controller: widget.controller,
              obscureText: _isObscured,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscured ? Icons.visibility : Icons.visibility_off,
                    color: ColorsApp.customGry,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                ),
                border: InputBorder.none,
              ),
              validator: widget.validator,
            ),
          ),
        ],
      ),
    );
  }
}
