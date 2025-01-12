// ignore_for_file: prefer_const_constructors

import 'package:almaqsura/colors_app/colors_app.dart';
import 'package:almaqsura/futuers/app_driver/controllar/d_form_add_trip_controllar.dart';
import 'package:almaqsura/futuers/app_driver/d_main_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final tripController = Get.put(TripController());

class CustomDialogRemoveTrip {
  static void dialogremoveTrip(BuildContext context, int id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          // alignment: Alignment.bottomCenter,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            alignment: Alignment.center,
            height: 240,
            width: 500,
            child: Padding(
              padding: const EdgeInsets.only(top: 49, bottom: 49),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SvgPicture.asset(
                  //   'assets/icons/correct.svg',
                  //   // width: 80,
                  //   height: 56,
                  // ),
                  // SizedBox(
                  //   height: 32,
                  // ),
                  Text(
                    "هل أنت متأكد من حذف الرحلة؟",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'سيتم حذف جميع تفاصيل الرحلة بشكل نهائي ولن تتمكن من استعادتها..!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 33,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              tripController.removeTrip(id);

                            
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => AppDriverMainView()));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 40,
                              // width: 135,
                              decoration: BoxDecoration(
                                color: ColorsApp.redDelete,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'حذف',
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
                              Navigator.pop(context);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(245, 245, 245, 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'إلغاء',
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
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
