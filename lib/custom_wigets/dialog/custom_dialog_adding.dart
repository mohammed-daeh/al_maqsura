// ignore_for_file: prefer_const_constructors

import 'package:almaqsura/colors_app/colors_app.dart';
import 'package:almaqsura/futuers/app_driver/controllar/d_form_add_trip_controllar.dart';
import 'package:almaqsura/futuers/app_driver/d_main_view.dart';
import 'package:almaqsura/futuers/app_driver/view/d_home/d_add_trip_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomDialogAddingTrip {
  static void dialogaddedTrip(BuildContext context, Trip trip) {
    final tripController = Get.put(TripController());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            decoration: BoxDecoration(),
            height: 250,
            width: 500,
            child: Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 34),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/correct.svg',
                    // width: 80,
                    height: 56,
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    "تمت إضافة الرحلة بنجاح..",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              tripController.addTrip(trip);

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => AppDriverMainView()));
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'تم إضافة الرحلة بنجاح',
                                    style: TextStyle(
                                        color: ColorsApp.whiteColor,
                                        fontSize: 10),
                                  ),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 40,
                              // width: 135,
                              decoration: BoxDecoration(
                                color: ColorsApp.primaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'تم',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 17,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              tripController.addTrip(trip);

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => AddTripDriverView()));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(245, 245, 245, 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'اضافة جديدة',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
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
          ),
 
        );
      },
    );
  }
}
