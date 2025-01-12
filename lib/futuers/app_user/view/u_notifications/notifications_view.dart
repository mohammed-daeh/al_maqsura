// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:almaqsura/colors_app/colors_app.dart';
import 'package:almaqsura/custom_wigets/app_bar/custom_app_bar_normal.dart';
import 'package:flutter/material.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarNormal(
          spacer: 9,
          name: 'الإشعارات',
          color: ColorsApp.primaryColor,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 17, right: 24, left: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'اليوم',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              Container(
                padding: EdgeInsets.all(16),
                height: 87,
                decoration: BoxDecoration(
                  color: ColorsApp.greenWithAlpha,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'رحلتك جاهزة للانطلاق!',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        Text(
                          'منذ 3 دقيقة',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    Text(
                      'تأكد من جاهزيتك واستعد لتجربة سفر مريحة وآمنة.',
                      style: TextStyle(
                        color: ColorsApp.customGryText,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              // CustomCardReservation()
            ],
          ),
        )
      ],
    );
  }
}
