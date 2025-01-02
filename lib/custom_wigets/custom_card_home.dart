// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import 'package:almaqsura/colors_app/colors_app.dart';
import 'package:almaqsura/custom_wigets/dotted_arrow.dart';
import 'package:almaqsura/futuers/main_pages/home/view/trip_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class CustomCardHome extends StatelessWidget {
  CustomCardHome({super.key});
  String firstPart = 'الطائف';
  String secondPart = 'الدوادمي';
  String date = '2024-09-01';
  String time1 = '10:00';
  String time2 = '2:00';
  String text = '120Km';
  String startingCenter = 'الطائف';
  String accessCenter = 'الدوادمي';
  String day = DateFormat('d').format(DateTime.now());
  String monthName = DateFormat('MMMM', 'AR').format(DateTime.now());
  final String formattedTime = DateFormat('hh:mm').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
      child: Container(
        // padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              // spreadRadius: 5,
              blurRadius: 32,
              offset: Offset(0, 16),
            ),
          ],
        ),
        height: 230,
        width: double.infinity,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${firstPart} إلى ${secondPart}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  children: [
                    Container(
                      child: SvgPicture.asset(
                        'assets/icons/date.svg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      width: 27,
                    ),
                    Container(
                      child: SvgPicture.asset(
                        'assets/icons/time.svg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      time1,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Container(
                      child: SvgPicture.asset(
                        'assets/icons/time.svg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      time2,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Container(
                      child: SvgPicture.asset(
                        'assets/icons/km.svg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Row(
                  children: [
                    Container(
                      child: SvgPicture.asset(
                          'assets/icons/location_yallow.svg',
                          width: 24,
                          height: 24),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomPaint(
                      size: Size(170, 0),
                      painter: DottedArrowPainter(),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset('assets/icons/location_green.svg',
                        width: 24, height: 24),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 218,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${startingCenter}',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          '${day},${monthName} | ${formattedTime}',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: ColorsApp.customGry),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        accessCenter,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${day},${monthName} | ${formattedTime}',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: ColorsApp.customGry),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TripDetailsView()));
                  },
                  child: Container(
                    // width: 294,
                    height: 36,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ColorsApp.primaryColor,
                      borderRadius: BorderRadius.circular(48),
                    ),
                    child: Text(
                      'حجز الآن',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ColorsApp.whiteColor,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}