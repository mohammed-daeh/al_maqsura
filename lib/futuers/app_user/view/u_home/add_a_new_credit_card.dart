// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:almaqsura/colors_app/colors_app.dart';
import 'package:almaqsura/custom_wigets/app_bar/custom_app_bar_normal.dart';
import 'package:almaqsura/futuers/app_user/view/u_home/payment_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddANewCreditCard extends StatelessWidget {
  const AddANewCreditCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBarNormal(
              showImage: false,
              name: 'إضافة بطاقة جديدة',
              color: Colors.white,
            ),
            SvgPicture.asset(
              'assets/images/visa.svg',
              // height: 183,
              width: 345,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 49, bottom: 36, right: 24, left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'اسم حامل البطاقة',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff112220)),
                  ),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: ColorsApp.customGry,
                        width: 1,
                      ),
                    ),
                    child: TextFormField(
                      // controller: TextEditingController(),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Ahmad Almohammed',
                        hintStyle: TextStyle(
                          color: ColorsApp.customGry,
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    'رقم البطاقة',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff112220)),
                  ),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: ColorsApp.customGry,
                        width: 1,
                      ),
                    ),
                    child: TextFormField(
                      // controller: TextEditingController(),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'أدخل الرقم المؤلف من 16 خانة',
                        hintStyle: TextStyle(
                          color: ColorsApp.customGry,
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          width: 209,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'تاريخ انتهاء الصلاحية',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff112220)),
                              ),
                              SizedBox(height: 8),
                              Container(
                                padding: EdgeInsets.only(right: 16, left: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(
                                    color: ColorsApp.customGry,
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        // controller: TextEditingController(),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '12-12-2025',
                                          hintStyle: TextStyle(
                                            color: ColorsApp.customGry,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter your name';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      'assets/icons/date.svg',
                                      width: 24,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      // Spacer(),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          width: 127,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'CVV/CVC',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff112220)),
                              ),
                              SizedBox(height: 8),
                              Container(
                                padding: EdgeInsets.only(right: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(
                                    color: ColorsApp.customGry,
                                    width: 1,
                                  ),
                                ),
                                child: TextFormField(
                                  // controller: TextEditingController(),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '123',
                                    hintStyle: TextStyle(
                                      color: ColorsApp.customGry,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your name';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => PaymentView()));
                },
                child: Container(
                  height: 56,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ColorsApp.primaryColor,
                    borderRadius: BorderRadius.circular(48),
                  ),
                  child: Text(
                    'تأكيد الدفع',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: ColorsApp.whiteColor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
