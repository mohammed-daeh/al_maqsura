// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, must_be_immutable

import 'package:almaqsura/colors_app/colors_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReserveASeatView extends StatefulWidget {
  ReserveASeatView({super.key});

  @override
  State<ReserveASeatView> createState() => _ReserveASeatViewState();
}

class _ReserveASeatViewState extends State<ReserveASeatView> {
  String firstPart = 'الطائف';

  String secondPart = 'الدوادمي';

  String day = DateFormat('d').format(DateTime.now());

  String monthName = DateFormat('MMMM', 'AR').format(DateTime.now());

  String year = DateFormat('y').format(DateTime.now());

  final String formattedTime =
      DateFormat('hh:mm a', 'en').format(DateTime.now());

  int selectedNumber = 1;
  String totalPrice = '20';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            child: Container(
              height: 154,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: ColorsApp.primaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                  top: 47,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            size: 32,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 13),
                      child: Container(
                        width: double.infinity,
                        height: 22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          color: ColorsApp.whiteAlpha,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 110,
            right: 24,
            left: 24,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 27, right: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 35,
                            offset: Offset(0, 7))
                      ]),
                  height: 175,
                  width: double.infinity,
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
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${day},${monthName} ${year} | ${formattedTime}',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: ColorsApp.customGry),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            'عدد المقاعد',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text('      data')
                        ],
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      Row(
                        children: [
                          Text(
                            'الأجمالي',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            '\$ ${totalPrice}',
                            style: TextStyle(
                              color: ColorsApp.primaryColor,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      // SizedBox(
                      //   height: 22,
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  width: double.infinity,
                  height: 472,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 32,
                          color: Colors.black12,
                          offset: Offset(0, 7))
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 24, right: 8, left: 8),
                        child: Row(
                          children: [
                            Text(
                              'تحديد المكان',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: ColorsApp.customGryDivider,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'محجوز',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: ColorsApp.greenBright),
                                // color: ColorsApp.greenBright,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'متاح',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(32),
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  childAspectRatio: 2 / 1,
                                  mainAxisSpacing: 12,
                                  mainAxisExtent: 50,
                                  // mainAxisSpacing: 5,
                                  crossAxisSpacing: 1),
                          itemCount: 24,
                          shrinkWrap: true,
                          // physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              child: Column(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: ColorsApp.greenBright),
                                      color: ColorsApp.greenBright,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      // Container(
                      //   color: Colors.amber,
                      //   alignment: Alignment.topCenter,
                      //   height: 10,
                      //   child: Text('1111'),
                      // ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
              bottom: 50,
              right: 40,
              left: 40,
              child: InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(48),
                    color: ColorsApp.primaryColor,
                  ),
                  child: Text(
                    'متابعة',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
