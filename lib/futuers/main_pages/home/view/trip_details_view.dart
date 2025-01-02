// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, depend_on_referenced_packages

import 'package:almaqsura/colors_app/colors_app.dart';
import 'package:almaqsura/custom_wigets/custom_app_bar_normal.dart';
import 'package:almaqsura/custom_wigets/dotted_arrow_vertical.dart';
import 'package:almaqsura/futuers/main_pages/home/view/reserve_a_seat_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class TripDetailsView extends StatelessWidget {
  TripDetailsView({super.key});
  String numberOfSeats = '12';
  String firstPart = 'الطائف';
  String secondPart = 'الدوادمي';
  String day = DateFormat('d').format(DateTime.now());
  String monthName = DateFormat('MMMM', 'AR').format(DateTime.now());
  String year = DateFormat('y').format(DateTime.now());

  final String formattedTime =
      DateFormat('hh:mm a', 'en').format(DateTime.now());
  String km = '20';
  String price = '15';
  String time = '40';
  String data = 'الطائف - الدوادمي';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBarNormal(name: 'تفاصيل الرحلة'),
        body: Stack(
          children: [
            Container(
              color: Colors.red,
            ),
            Positioned(
              bottom: 30,
              left: 24,
              right: 24,
              child: Container(
                height: 324,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 32,
                      offset: Offset(0, 16),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 16, left: 16, top: 24, bottom: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${firstPart} إلى ${secondPart}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          Container(
                            alignment: Alignment.center,
                            width: 98,
                            height: 32,
                            decoration: BoxDecoration(
                              color: ColorsApp.greenBright,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Text(
                              '${numberOfSeats} مقعد متاح',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${day},${monthName} ${year} | ${formattedTime}',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: ColorsApp.customGry),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            // height: 40,
                            width: 118,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/location.svg',
                                  color: ColorsApp.primaryColor,
                                  fit: BoxFit.scaleDown,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  '${km} km',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 132,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/time.svg',
                                  color: ColorsApp.primaryColor,
                                  fit: BoxFit.scaleDown,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  '${time} دقيقة',
                                  // textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/dolar.svg',
                                  // color: ColorsApp.primaryColor,
                                  fit: BoxFit.scaleDown,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  '\$ ${price} ',
                                  // textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        // margin: EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: ColorsApp.customGryDivider, width: 1)),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          CustomPaint(
                            size: Size(35, 60), // الحجم
                            painter: DashedArrowVirticalPainter(),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/location_background.svg',
                                    width: 32,
                                    height: 32,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'الأنطلاق',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        data,
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: ColorsApp.customGry),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 27,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/location_background2.svg',
                                    width: 32,
                                    height: 32,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'الأنطلاق',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        data,
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: ColorsApp.customGry),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReserveASeatView()));
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
