
// ignore_for_file: prefer_const_constructors, must_be_immutable, deprecated_member_use

import 'package:almaqsura/custom_wigets/dotted_line/dotted_arrow_vertical.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:almaqsura/colors_app/colors_app.dart';

class CustomCardReservationCompleted extends StatelessWidget {
  final String image;
  final String name;
  final String from;
  final String to;
  final String stateOfTrip;
  final String km;
  final String time;
  final String price;

  static int cardIdCounter = 1;
  late final String cardId;

  CustomCardReservationCompleted({
    super.key,
    required this.image,
    required this.name,
    required this.from,
    required this.to,
    required this.stateOfTrip,
    required this.km,
    required this.time,
    required this.price,
  }) {
    cardId = cardIdCounter.toString();
    cardIdCounter++;
  }
  String data = 'الطائف - الدوادمي';

  @override
  Widget build(BuildContext context) {
    RxBool isExpanded = false.obs;

    String day = DateFormat('d').format(DateTime.now());
    String monthName = DateFormat('MMMM', 'AR').format(DateTime.now());
    String year = DateFormat('y').format(DateTime.now());
    final String formattedTime =
        DateFormat('hh:mm a', 'en').format(DateTime.now());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Card(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 56,
                    width: 56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: ColorsApp.greenBright,
                        width: 1.5,
                      ),
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'رحلة $from - $to',
                        style: TextStyle(
                          color: ColorsApp.customGryText,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    alignment: Alignment.center,
                    height: 32,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: ColorsApp.greenBright,

                      // color: _getColorBasedOnStatus(stateOfTrip),
                    ),
                    child: Text(
                      stateOfTrip,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Divider(
                  height: 1,
                  color: ColorsApp.customGryDivider,
                ),
              ),
              Obx(() {
                return AnimatedCrossFade(
                  firstChild: IconButton(
                    icon: Icon(Icons.expand_more),
                    onPressed: () {
                      isExpanded.value = !isExpanded.value;
                    },
                  ),
                  secondChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 110,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/location.svg',
                                  color: ColorsApp.primaryColor,
                                  fit: BoxFit.scaleDown,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  '$km km',
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
                                SizedBox(width: 8),
                                Text(
                                  '$time دقيقة',
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
                                  fit: BoxFit.scaleDown,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  '\$ $price',
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
                      SizedBox(height: 4),
                      Text(
                        '$day, $monthName $year | $formattedTime',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: ColorsApp.customGry,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Divider(
                          height: 1,
                          color: ColorsApp.customGryDivider,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, right: 5),
                            child: Row(
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
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 15),
                          //   child: InkWell(onTap: () {
                              
                          //   },
                          //     child: Container(
                          //       height: 40,
                          //       alignment: Alignment.center,
                          //       decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(48),
                          //           color: ColorsApp.primaryColor),
                          //       child: Text(
                          //         'إعادة الحجز',
                          //         style: TextStyle(
                          //           fontSize: 16,
                          //           color: ColorsApp.whiteColor,
                          //           fontWeight: FontWeight.w500,
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // )
                          // Text(
                          //   'تتبع الموقع',
                          //   style: TextStyle(
                          //     fontSize: 12,
                          //     fontWeight: FontWeight.w400,
                          //   ),
                          // ),
                          // SizedBox(height: 5),
                          // Container(
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(10),
                          //     color: ColorsApp.customGry,
                          //   ),
                          //   height: 190,
                          //   child: Center(child: Text('MAP')),
                          // ),
                        ],
                      ),
                      Center(
                        child: IconButton(
                          icon: Icon(Icons.expand_less),
                          onPressed: () {
                            isExpanded.value = !isExpanded.value;
                          },
                        ),
                      ),
                    ],
                  ),
                  crossFadeState: isExpanded.value
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: Duration(milliseconds: 300),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }






// // ignore_for_file: prefer_const_constructors

// import 'package:almaqsura/colors_app/colors_app.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:intl/intl.dart';

// class CustomCardReservationCompleted extends StatefulWidget {
//   final String image;
//   final String name;
//   final String from;
//   final String to;
//   final String stateOfTrip;
//   final String km;
//   final String time;
//   final String price;

//   const CustomCardReservationCompleted({
//     Key? key,
//     required this.image,
//     required this.name,
//     required this.from,
//     required this.to,
//     required this.stateOfTrip,
//     required this.km,
//     required this.time,
//     required this.price,
//   }) : super(key: key);

//   @override
//   State<CustomCardReservationCompleted> createState() => _CustomExpandableCardState();
// }

// class _CustomExpandableCardState extends State<CustomCardReservationCompleted> {
//   bool isExpanded = false;
//   String day = DateFormat('d').format(DateTime.now());
//   String monthName = DateFormat('MMMM', 'AR').format(DateTime.now());
//   String year = DateFormat('y').format(DateTime.now());

//   final String formattedTime =
//       DateFormat('hh:mm a', 'en').format(DateTime.now());
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//       child: Card(
//         color: Colors.white,
//         elevation: 4,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     height: 56,
//                     width: 56,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border: Border.all(
//                         color: ColorsApp.greenBright,
//                         width: 1.5,
//                       ),
//                       image: DecorationImage(
//                         image: AssetImage(widget.image),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 8),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         widget.name,
//                         style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       Text(
//                         'رحلة ${widget.from} - ${widget.to}',
//                         style: TextStyle(
//                           color: ColorsApp.customGryText,
//                           fontSize: 10,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Spacer(),
//                   Container(
//                     alignment: Alignment.center,
//                     height: 32,
//                     width: 70,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(24),
//                       color: _getColorBasedOnStatus(widget.stateOfTrip),
//                     ),
//                     child: Text(
//                       widget.stateOfTrip,
//                       style: TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 5.0),
//                 child: Divider(
//                   height: 1,
//                   color: ColorsApp.customGryDivider,
//                 ),
//               ),
//               AnimatedCrossFade(
//                 firstChild: IconButton(
//                   icon: Icon(Icons.expand_more),
//                   onPressed: () {
//                     setState(() {
//                       isExpanded = true;
//                     });
//                   },
//                 ),
//                 secondChild: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         SizedBox(
//                           // height: 40,
//                           width: 110,
//                           child: Row(
//                             children: [
//                               SvgPicture.asset(
//                                 'assets/icons/location.svg',
//                                 color: ColorsApp.primaryColor,
//                                 fit: BoxFit.scaleDown,
//                               ),
//                               SizedBox(
//                                 width: 8,
//                               ),
//                               Text(
//                                 '${widget.km} km',
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           width: 115,
//                           child: Row(
//                             children: [
//                               SvgPicture.asset(
//                                 'assets/icons/time.svg',
//                                 color: ColorsApp.primaryColor,
//                                 fit: BoxFit.scaleDown,
//                               ),
//                               SizedBox(
//                                 width: 8,
//                               ),
//                               Text(
//                                 '${widget.time} دقيقة',
//                                 // textDirection: TextDirection.rtl,
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           width: 70,
//                           child: Row(
//                             children: [
//                               SvgPicture.asset(
//                                 'assets/icons/dolar.svg',
//                                 // color: ColorsApp.primaryColor,
//                                 fit: BoxFit.scaleDown,
//                               ),
//                               SizedBox(
//                                 width: 8,
//                               ),
//                               Text(
//                                 '\$ ${widget.price} ',
//                                 // textDirection: TextDirection.rtl,
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 4,
//                     ),
//                     Text(
//                       '${day},${monthName} ${year} | ${formattedTime}',
//                       style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400,
//                           color: ColorsApp.customGry),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 5.0),
//                       child: Divider(
//                         height: 1,
//                         color: ColorsApp.customGryDivider,
//                       ),
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'تتبع الموقع',
//                           style: TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: ColorsApp.customGry,
//                           ),
//                           height: 190,
//                           // width: 40,
//                           child: Center(child: Text('MAP')),
//                         )
//                       ],
//                     ),
//                     Center(
//                       child: IconButton(
//                         icon: Icon(Icons.expand_less),
//                         onPressed: () {
//                           setState(() {
//                             isExpanded = false;
//                           });
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//                 crossFadeState: isExpanded
//                     ? CrossFadeState.showSecond
//                     : CrossFadeState.showFirst,
//                 duration: Duration(milliseconds: 300),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// Color _getColorBasedOnStatus(String status) {
//   // قائمة الألوان المرتبطة بكل حالة
//   List<Color> colors = [
//     ColorsApp.greenWithAlpha, // للحالة "الحالية"
//     ColorsApp.redAlpha, // للحالة "الملغاة"
//     ColorsApp.greenBright, // للحالة "المكتملة"
//   ];

//   // اختيار اللون بناءً على حالة الرحلة
//   switch (status) {
//     case 'الحالية':
//       return colors[0]; // اللون للحالة "الحالية"
//     case 'الملغاة':
//       return colors[1]; // اللون للحالة "الملغاة"
//     case 'المكتملة':
//       return colors[2]; // اللون للحالة "المكتملة"
//     default:
//       return colors[
//           0]; // الافتراضي هو اللون للحالة "الحالية" إذا كانت الحالة غير معروفة
//   }
// }


//   Color _getColorBasedOnStatus(String status) {
//     List<Color> colors = [
//       ColorsApp.greenWithAlpha,
//       ColorsApp.redAlpha,
//       ColorsApp.greenBright,
//     ];

//     switch (status) {
//       case 'الحالية':
//         return colors[0];
//       case 'الملغاة':
//         return colors[1];
//       case 'المكتملة':
//         return colors[2];
//       default:
//         return colors[0];
//     }
//   }
}
