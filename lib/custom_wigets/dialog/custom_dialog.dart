// ignore_for_file: prefer_const_constructors

import 'package:almaqsura/colors_app/colors_app.dart';
import 'package:almaqsura/futuers/app_user/u_main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomDialog {
  static void confirmPayment(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            decoration: BoxDecoration(),
            height: 300,
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
                    "تم الدفع بنجاح ، شكرًا لاختيارك خدماتنا! ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'رحلة ممتعة وآمنة...',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => MainView()));
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
                                'حجز رحلة أخرى',
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
                  )
                ],
              ),
            ),
          ),
          // icon: SvgPicture.asset(
          //   'assets/icons/cash.svg',
          //   width: 20,
          //   height: 20,
          // ),
          // icon: Icon(Icons.abc),
          // title:
          // content: Text("هذا ديالوغ مُنشأ داخل كلاس مخصص."),
          // actions: [
          //   TextButton(
          //     onPressed: () {
          //       Navigator.of(context).pop(); // إغلاق الديالوغ
          //     },
          //     child: Text("إغلاق"),
          //   ),
          //   TextButton(
          //     onPressed: () {
          //       // تنفيذ إجراء معين
          //       Navigator.of(context).pop();
          //     },
          //     child: Text("موافق"),
          //   ),
          // ],
        );
      },
    );
  }
}
