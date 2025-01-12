// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, depend_on_referenced_packages, unnecessary_brace_in_string_interps, avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_string_interpolations, deprecated_member_use

import 'package:almaqsura/colors_app/colors_app.dart';
import 'package:almaqsura/custom_wigets/dotted_line/dotted_arrow.dart';
import 'package:almaqsura/futuers/app_driver/view/d_home/d_add_trip_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCardTrips extends StatelessWidget {
  final String firstPart;
  final String secondPart;
  final String status;
  final String goTime;
  final String arrivedTime;
  final String day;
  final String monthName;
  // final String id;

  const CustomCardTrips({
    super.key,
    required this.firstPart,
    required this.secondPart,
    required this.status,
    required this.goTime,
    required this.arrivedTime,
    required this.day,
    required this.monthName,
    //  required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22, right: 22, bottom: 24),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 32,
              offset: Offset(0, 16),
            ),
          ],
        ),
        height: 150,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  child: SvgPicture.asset('assets/icons/location_yallow.svg',
                      width: 24, height: 24),
                ),
                SizedBox(
                  width: 10,
                ),
                CustomPaint(
                  size: Size(148, 0),
                  painter: DottedArrowPainter(),
                ),
                SizedBox(
                  width: 10,
                ),
                SvgPicture.asset('assets/icons/location_green.svg',
                    width: 24, height: 24),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  width: 190,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${firstPart}',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${day},${monthName} | ${goTime}',
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
                      '${secondPart}',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      '${day},${monthName} | ${arrivedTime}',
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
              height: 17,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Container(
                    width: 85,
                    height: 32,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ColorsApp.greenBright,
                      borderRadius: BorderRadius.circular(48),
                    ),
                    child: Text(
                      status,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AddTripDriverView();
                      }));
                    },
                    child: Container(
                      width: 32,
                      height: 32,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ColorsApp.greenWithAlpha,
                        borderRadius: BorderRadius.circular(48),
                      ),
                      child: Icon(
                        Icons.edit,
                        color: ColorsApp.primaryColor,
                        size: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: InkWell(
                      onTap: () {
                        // return CustomDialogRemoveTrip.removeTrip(context);
                      },
                      child: Container(
                        width: 32,
                        height: 32,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: ColorsApp.redAlpha,
                          borderRadius: BorderRadius.circular(48),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/delete.svg',
                          color: Colors.red,
                          width: 16,
                          height: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
