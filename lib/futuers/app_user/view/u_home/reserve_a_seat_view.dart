// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, must_be_immutable, non_constant_identifier_names, unnecessary_brace_in_string_interps

import 'package:almaqsura/colors_app/colors_app.dart';
import 'package:almaqsura/custom_wigets/app_bar/custom_app_bar_normal.dart';
import 'package:almaqsura/futuers/app_user/view/u_home/payment_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ReserveASeatView extends StatelessWidget {
  ReserveASeatView({super.key});

  String firstPart = 'الطائف';

  String secondPart = 'الدوادمي';

  String day = DateFormat('d').format(DateTime.now());

  String monthName = DateFormat('MMMM', 'AR').format(DateTime.now());

  String year = DateFormat('y').format(DateTime.now());

  final String formattedTime =
      DateFormat('hh:mm a', 'en').format(DateTime.now());

  int number_of_seats = 10;

  String totalPrice = '20';
  final SeatController seatcontroller = Get.put(SeatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            child: SizedBox(
              height: 154,
              child: CustomAppBarNormal(
                color: ColorsApp.primaryColor,
                width: 316,
                showImage: false,
                name: '',
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
                  padding: EdgeInsets.only(top: 17, right: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 35,
                            offset: Offset(0, 7))
                      ]),
                  height: 160,
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
                          SizedBox(
                            width: 16,
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            width: 94,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: ColorsApp.customGryDivider,
                                )),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  width: 1,
                                  height: 15.0,
                                  color: ColorsApp.customGry, // لون الديفايدر
                                ),
                                Text(
                                  number_of_seats.toString(),
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                Spacer(),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.keyboard_arrow_up_outlined,
                                        size: 16,
                                        color: ColorsApp.customGry,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        size: 16,
                                        color: ColorsApp.customGry,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 432,
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 8, left: 8, top: 20),
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
                      Container(
                        height: 385,
                        padding: const EdgeInsets.only(
                          right: 40,
                          left: 40,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: GridView.builder(
                                padding: const EdgeInsets.all(0),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 15,
                                  mainAxisSpacing: 15,
                                ),
                                itemCount: 12,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, indexA) {
                                  List<int> index = [
                                    1,
                                    2,
                                    5,
                                    6,
                                    9,
                                    10,
                                    13,
                                    14,
                                    17,
                                    18,
                                    21,
                                    22,
                                  ];
                                  int seatNumber = index[indexA];

                                  indexA = index[indexA];
                                  return Obx(() {
                                    bool isSelected = seatcontroller
                                        .selectedSeats
                                        .contains(seatNumber);

                                    return GestureDetector(
                                      onTap: () {
                                        seatcontroller
                                            .toggleSeatSelection(seatNumber);
                                        debugPrint('${indexA}');
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? ColorsApp.customGryDivider
                                              : Colors.white,
                                          border: Border.all(
                                            color: isSelected
                                                ? ColorsApp.customGryDivider
                                                : ColorsApp.greenBright,
                                            width: 1.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        alignment: Alignment.center,
                                      ),
                                    );
                                  });
                                },
                              ),
                            ),
                            SizedBox(width: 50),
                            Expanded(
                              child: GridView.builder(
                                padding: const EdgeInsets.all(0),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 15,
                                  mainAxisSpacing: 15,
                                ),
                                itemCount: 12,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, indexB) {
                                  List<int> index = [
                                    3,
                                    4,
                                    7,
                                    8,
                                    11,
                                    12,
                                    15,
                                    16,
                                    19,
                                    20,
                                    23,
                                    24,
                                  ];
                                  int seatNumber = index[indexB];

                                  indexB = index[indexB];

                                  return Obx(() {
                                    bool isSelected = seatcontroller
                                        .selectedSeats
                                        .contains(seatNumber);

                                    return GestureDetector(
                                      onTap: () {
                                        seatcontroller
                                            .toggleSeatSelection(seatNumber);
                                        debugPrint('${indexB}');
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? ColorsApp.customGryDivider
                                              : Colors.white,
                                          border: Border.all(
                                            color: isSelected
                                                ? ColorsApp.customGryDivider
                                                : ColorsApp.greenBright,
                                            width: 1.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    );
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => PaymentView()));
                  },
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SeatController extends GetxController {
  var selectedSeats = <int>[].obs;

  void toggleSeatSelection(int seatNumber) {
    if (selectedSeats.contains(seatNumber)) {
      selectedSeats.remove(seatNumber);
    } else {
      selectedSeats.add(seatNumber);
    }
  }
}
