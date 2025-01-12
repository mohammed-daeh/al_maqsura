// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:almaqsura/colors_app/colors_app.dart';
import 'package:almaqsura/custom_wigets/app_bar/custom_app_bar_normal.dart';
import 'package:flutter/material.dart';

class DriverReservationView extends StatelessWidget {
  const DriverReservationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        CustomAppBarNormal(
          spacer: 9,
          name: 'الإشعارات',
          color: ColorsApp.primaryColor,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Column(
            children: [
              CustomCardDriverReservations(),
              CustomCardDriverReservations(),
              CustomCardDriverReservations(),
              CustomCardDriverReservations(),
            ],
          ),
        )
      ],
    ));
  }
}

class CustomCardDriverReservations extends StatelessWidget {
  const CustomCardDriverReservations({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24.0, left: 24, bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(177, 175, 151, 0.2),
                offset: Offset(0, 5),
                blurRadius: 10),
          ],
          borderRadius: BorderRadius.circular(10),
          color: ColorsApp.whiteColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'حجوزات الرحلة الأولى',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'رحلة الطائف _ الدوادمي',
                    style: TextStyle(
                      color: ColorsApp.customGryText,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    '25 ديسمبر 2024 ',
                    style: TextStyle(
                      color: ColorsApp.customGryText,
                      fontSize: 8,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: ColorsApp.greenWithAlpha),
                child: Icon(
                  Icons.keyboard_arrow_left,
                  color: ColorsApp.primaryColor,
                  size: 24,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
