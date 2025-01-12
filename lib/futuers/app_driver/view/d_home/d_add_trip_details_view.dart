// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, depend_on_referenced_packages, sized_box_for_whitespace, unnecessary_brace_in_string_interps, deprecated_member_use

import 'package:almaqsura/colors_app/colors_app.dart';
import 'package:almaqsura/custom_wigets/app_bar/custom_app_bar_normal.dart';
import 'package:almaqsura/custom_wigets/dialog/custom_dialog_adding.dart';
import 'package:almaqsura/custom_wigets/dialog/custom_dialog_remove_trip.dart';
import 'package:almaqsura/custom_wigets/dotted_line/dotted_arrow_vertical.dart';
import 'package:almaqsura/futuers/app_driver/controllar/d_form_add_trip_controllar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class AddTripDetailsView extends StatelessWidget {
  final Trip trip;
  AddTripDetailsView({super.key, required this.trip});
  String km = '2000';
  String time = '400';
  String data = 'الطائف - الدوادمي';
  @override
  Widget build(BuildContext context) {
    String day = DateFormat('d').format(trip.tripDate);
    String month = DateFormat('MMM', 'ar').format(trip.tripDate);
    String year = DateFormat('yyy').format(trip.tripDate);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.amber,
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 105),
            child: Container(
              color: Colors.red,
              child: Center(
                child: Text('The Map'),
              ),
            ),
          ),
          Container(
            height: 123,
            child: CustomAppBarNormal(
              color: ColorsApp.primaryColor,
              name: 'تفاصيل الرحلة',
              spacer: 9,
            ),
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
                          '${trip.departurePlace} - ${trip.destination}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        Container(
                          alignment: Alignment.center,
                          width: 65,
                          height: 32,
                          decoration: BoxDecoration(
                            color: ColorsApp.greenBright,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Text(
                            'يومية',
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
                      '${day}  ${month}  ${year} | ${trip.arrivalTime}',
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
                          width: 110,
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
                          width: 115,
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
                          width: 70,
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
                                '\$ ${trip.seatCost} ',
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'الانطلاق',
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'الوجهة',
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
                    Row(
                      children: [
                        InkWell(
                          //تأكيد
                          onTap: () {
                            CustomDialogAddingTrip.dialogaddedTrip(
                                context, trip);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 36,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(48),
                              color: ColorsApp.primaryColor,
                            ),
                            child: Text(
                              'تأكيد الاضافة',
                              style: TextStyle(
                                  color: ColorsApp.whiteColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          // تعديل
                          onTap: () {
                            Navigator.pop(context, trip);

                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) {
                            //   return AddTripDriverView(
                            //     id: trip.id,
                            //     departurePlace: trip.departurePlace,
                            //     destination: trip.destination,
                            //     tripDate: trip.tripDate.toString(),
                            //     departureTime: trip.departureTime,
                            //     arrivalTime: trip.arrivalTime,
                            //     // day: day,
                            //     // monthName: monthName,
                            //   );
                            // }));
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
                        SizedBox(
                          width: 16,
                        ),
                        InkWell(
                          onTap: () {
                            CustomDialogRemoveTrip.dialogremoveTrip(
                                context, trip.id);
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
                              width: 16,
                              height: 16,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
