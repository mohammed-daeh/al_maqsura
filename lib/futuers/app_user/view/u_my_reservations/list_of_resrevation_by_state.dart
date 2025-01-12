import 'package:almaqsura/colors_app/colors_app.dart';
import 'package:almaqsura/custom_wigets/card/custom_card_reservation_canceled.dart';
import 'package:almaqsura/custom_wigets/card/custom_card_reservation_completed.dart';
import 'package:almaqsura/custom_wigets/card/custom_card_reservation_current.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ListOfResrevationByState extends StatelessWidget {
  final RxInt _currentIndexDay = 0.obs;
  final List<String> daysOfWeek = ['الحالية', 'الملغاة', 'المكتملة'];
  final RxList<List<Map<String, String>>> tripsPerDay =
      List.generate(3, (_) => <Map<String, String>>[]).obs;

  ListOfResrevationByState({super.key}) {
    // DateTime today = DateTime.now();

    // for (int i = 0; i < 7; i++) {
    //   DateTime currentDay = today.add(Duration(days: i));
    //   String dayName = DateFormat('EEEE', 'ar').format(currentDay);

    //   if (i == 0) {
    //     daysOfWeek.add("اليوم");
    //   } else {
    //     daysOfWeek.add(dayName);
    //   }
    // }

    List<Map<String, String>> allTrips = [
      {
        "status": "الحالية",
        "name": "عنوان",
        'from': "5",
        "to": "4",
        "km": "12",
        "price": "500",
        "time": "4",
        "image": 'assets/images/on_boarding_image.png',
      },
      {
        "status": "المكتملة",
        "name": "عنوان",
        'from': "5",
        "to": "4",
        "km": "12",
        "price": "500",
        "time": "4",
        "image": 'assets/images/man.png',
      },
      {
        "status": "الحالية",
        "name": "عنوان",
        'from': "5",
        "to": "4",
        "km": "12",
        "price": "500",
        "time": "4",
        "image": 'assets/images/man.png',
      },
      {
        "status": "الملغاة",
        "name": "عنوان",
        'from': "5",
        "to": "4",
        "km": "12",
        "price": "500",
        "time": "4",
        "image": 'assets/images/man.png',
      },
      {
        "status": "الملغاة",
        "name": "عنوان",
        'from': "5",
        "to": "4",
        "km": "12",
        "price": "500",
        "time": "4",
        "image": 'assets/images/man.png',
      },
      {
        "status": "الملغاة",
        "name": "عنوان",
        'from': "5",
        "to": "4",
        "km": "12",
        "price": "500",
        "time": "4",
        "image": 'assets/images/man.png',
      },
      {
        "status": "الملغاة",
        "name": "عنوان",
        'from': "5",
        "to": "4",
        "km": "12",
        "price": "500",
        "time": "4",
        "image": 'assets/images/man.png',
      },
      {
        "status": "الملغاة",
        "name": "عنوان",
        'from': "5",
        "to": "4",
        "km": "12",
        "price": "500",
        "time": "4",
        "image": 'assets/images/man.png',
      },
      {
        "status": "الملغاة",
        "name": "عنوان",
        'from': "5",
        "to": "4",
        "km": "12",
        "price": "500",
        "time": "4",
        "image": 'assets/images/man.png',
      },
      {
        "status": "الملغاة",
        "name": "عنوان",
        'from': "5",
        "to": "4",
        "km": "12",
        "price": "500",
        "time": "4",
        "image": 'assets/images/man.png',
      },
      {
        "status": "الملغاة",
        "name": "عنوان",
        'from': "5",
        "to": "4",
        "km": "12",
        "price": "500",
        "time": "4",
        "image": 'assets/images/man.png',
      },
      {
        "status": "الملغاة",
        "name": "عنوان",
        'from': "5",
        "to": "4",
        "km": "12",
        "price": "500",
        "time": "4",
        "image": 'assets/images/man.png',
      },
    ];
    for (var trip in allTrips) {
      String status = trip["status"]!;

      if (status == "الحالية") {
        tripsPerDay[0].add(trip);
      } else if (status == "الملغاة") {
        tripsPerDay[1].add(trip);
      } else if (status == "المكتملة") {
        tripsPerDay[2].add(trip);
      }
    }
  }

  final ScrollController _scrollControllerAll = ScrollController();
  final ScrollController _scrollController = ScrollController();
  final PageController _pageController = PageController();

  void _scrollToIndex(int index) {
    double itemWidth = 96;
    double scrollPosition = index * itemWidth;

    if (_scrollController.hasClients) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          scrollPosition,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  void _scrollToTop() {
    double scrollPosition = 0;

    if (_scrollControllerAll.hasClients) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        _scrollControllerAll.animateTo(
          scrollPosition,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification.metrics.pixels == 0 &&
              notification is ScrollUpdateNotification) {
            _scrollToTop();
            return true;
          }
          return false;
        },
        child: SingleChildScrollView(
          controller: _scrollControllerAll,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 6,
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          color: ColorsApp.greenWithAlpha,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/setting.svg',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                            color: ColorsApp.customGry,
                            width: 1,
                          ),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'ابحث عن رحلة',
                            hintStyle: TextStyle(
                              color: ColorsApp.customGry,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: ColorsApp.customGry,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: ColorsApp.customGryDivider,
              ),
              SizedBox(
                height: 40,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: _scrollController,
                  child: Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(
                        daysOfWeek.length,
                        (index) => GestureDetector(
                          onTap: () {
                            _pageController.animateToPage(
                              index,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                            _currentIndexDay.value = index;
                            _scrollToIndex(index);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 105,
                            height: 40,
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: _currentIndexDay.value == index
                                  ? ColorsApp.greenLight
                                  : ColorsApp.greenWithAlpha,
                            ),
                            child: Text(
                              daysOfWeek[index],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                height: MediaQuery.of(context).size.height - 0,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    _currentIndexDay.value = index;
                    _scrollToIndex(index);
                  },
                  itemCount: daysOfWeek.length,
                  itemBuilder: (context, dayIndex) {
                    return Obx(() {
                      final trips = tripsPerDay[dayIndex];
                      // priz
                      if (trips.isEmpty) {
                        return Center(
                          child: Text(
                            'لا توجد رحلات متوفرة',
                            style: TextStyle(
                              fontSize: 16,
                              color: ColorsApp.customGry,
                            ),
                          ),
                        );
                      }
                      return ListView.builder(
                        controller: _scrollControllerAll,
                        padding: EdgeInsets.only(
                          top: 10,
                          bottom: 350,
                        ),
                        itemCount: trips.length,
                        itemBuilder: (context, tripIndex) {
                          final trip = trips[tripIndex];
                          if (trip['status'] == 'المكتملة') {
                            return CustomCardReservationCompleted(
                              stateOfTrip: trip['status'] ?? 'N/A',
                              name: trip['name'] ?? 'N/A',
                              from: trip['from'] ?? 'N/A',
                              to: trip['to'] ?? 'N/A',
                              km: trip['km'] ?? 'N/A',
                              price: trip['price'] ?? 'N/A',
                              time: trip['time'] ?? 'N/A',
                              image: trip['image'] ?? 'N/A',
                            );
                          } else if (trip['status'] == 'الملغاة') {
                            return CustomCardReservationCanceled(
                              stateOfTrip: trip['status'] ?? 'N/A',
                              name: trip['name'] ?? 'N/A',
                              from: trip['from'] ?? 'N/A',
                              to: trip['to'] ?? 'N/A',
                              km: trip['km'] ?? 'N/A',
                              price: trip['price'] ?? 'N/A',
                              time: trip['time'] ?? 'N/A',
                              image: trip['image'] ?? 'N/A',
                            );
                          }
                          return CustomCardReservationCurrent(
                            stateOfTrip: trip['status'] ?? 'N/A',
                            name: trip['name'] ?? 'N/A',
                            from: trip['from'] ?? 'N/A',
                            to: trip['to'] ?? 'N/A',
                            km: trip['km'] ?? 'N/A',
                            price: trip['price'] ?? 'N/A',
                            time: trip['time'] ?? 'N/A',
                            image: trip['image'] ?? 'N/A',
                          );
                          // return CustomExpandableCard(
                          //   stateOfTrip: trip['status'] ?? 'N/A',
                          //   name: trip['name'] ?? 'N/A',
                          //   from: trip['from'] ?? 'N/A',
                          //   to: trip['to'] ?? 'N/A',
                          //   km: trip['km'] ?? 'N/A',
                          //   price: trip['price'] ?? 'N/A',
                          //   time: trip['time'] ?? 'N/A',
                          //   image: AssetImage('assets/images/man.png'),
                          // );
                        },
                      );
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// import 'package:almaqsura/colors_app/colors_app.dart';
// import 'package:almaqsura/custom_wigets/custom_card_reservation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';

// class ListOfResrevationByState extends StatelessWidget {
//   final RxInt currentIndexState = 0.obs;
//   final RxList<List<Map<String, String>>> tripsPerState =
//       List.generate(7, (_) => <Map<String, String>>[]).obs;
//   final List<String> stateTrip = [
//     'الحالية',
//     'المكتملة',
//     'الملغاة',
//   ];

//   ListOfResrevationByState({super.key}) {
//     List<Map<String, String>> allReservations = [
//       {
//         'status': 'الحالية',
//         'name': 'عنوان الرحلة 1',
//         'from': 'من مكان 1',
//         'to': 'إلى مكان 1',
//         'km': '12',
//         'price': '500',
//         'time': '4',
//       },
//       {
//         'status': 'المكتملة',
//         'name': 'عنوان الرحلة 1',
//         'from': 'من مكان 1',
//         'to': 'إلى مكان 1',
//         'km': '12',
//         'price': '500',
//         'time': '4',
//       },
//       {
//         'status': 'الملغاة',
//         'name': 'عنوان الرحلة 1',
//         'from': 'من مكان 1',
//         'to': 'إلى مكان 1',
//         'km': '12',
//         'price': '500',
//         'time': '4',
//       },
//     ];

//     for (var status in stateTrip) {
//       List<Map<String, String>> filteredReservations =
//           allReservations.where((trip) => trip['status'] == status).toList();

//       print(
//           'Filtered reservations for $status: $filteredReservations'); // طباعة بيانات كل حالة

//       tripsPerState.add(filteredReservations);
//     }

//     // List<Map<String, String>> allReservations = [
//     //   {
//     //     'status': 'الحالية',
//     //     'name': 'عنوان الرحلة 1',
//     //     'from': 'من مكان 1',
//     //     'to': 'إلى مكان 1',
//     //     'km': '12',
//     //     'price': '500',
//     //     'time': '4',
//     //   },
//     //   {
//     //     'status': 'المكتملة',
//     //     'name': 'عنوان الرحلة 1',
//     //     'from': 'من مكان 1',
//     //     'to': 'إلى مكان 1',
//     //     'km': '12',
//     //     'price': '500',
//     //     'time': '4',
//     //   },
//     //   {
//     //     'status': 'الملغاة',
//     //     'name': 'عنوان الرحلة 1',
//     //     'from': 'من مكان 1',
//     //     'to': 'إلى مكان 1',
//     //     'km': '12',
//     //     'price': '500',
//     //     'time': '4',
//     //   },
//     // ];

//     // for (var status in stateTrip) {
//     //   List<Map<String, String>> filteredReservations =
//     //       allReservations.where((trip) => trip['status'] == status).toList();
//     //   tripsPerState.add(filteredReservations);

//     //   // tripsPerState.add(
//     //   //     allReservations.where((trip) => trip['status'] == status).toList());
//     // }
//   }
//   final ScrollController _scrollControllerAll = ScrollController();

//   final ScrollController _scrollController = ScrollController();
//   final PageController _pageController = PageController();

//   void _scrollToIndex(int index) {
//     double itemWidth = 96;
//     double scrollPosition = index * itemWidth;

//     if (_scrollController.hasClients) {
//       SchedulerBinding.instance.addPostFrameCallback((_) {
//         _scrollController.animateTo(
//           scrollPosition,
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeInOut,
//         );
//       });
//     }
//   }

//   void _scrollToTop() {
//     double scrollPosition = 0;

//     if (_scrollControllerAll.hasClients) {
//       SchedulerBinding.instance.addPostFrameCallback((_) {
//         _scrollControllerAll.animateTo(
//           scrollPosition,
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeInOut,
//         );
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: NotificationListener<ScrollNotification>(
//         onNotification: (ScrollNotification notification) {
//           if (notification.metrics.pixels == 0 &&
//               notification is ScrollUpdateNotification) {
//             _scrollToTop();
//             return true;
//           }
//           return false;
//         },
//         child: SingleChildScrollView(
//           controller: _scrollControllerAll,
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 24,
//                   vertical: 6,
//                 ),
//                 child: Row(
//                   children: [
//                     InkWell(
//                       onTap: () {},
//                       child: Container(
//                         height: 48,
//                         width: 48,
//                         decoration: BoxDecoration(
//                           color: ColorsApp.greenWithAlpha,
//                           shape: BoxShape.circle,
//                         ),
//                         child: SvgPicture.asset(
//                           'assets/icons/setting.svg',
//                           fit: BoxFit.scaleDown,
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 8),
//                     Expanded(
//                       child: Container(
//                         height: 50,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(40),
//                           border: Border.all(
//                             color: ColorsApp.customGry,
//                             width: 1,
//                           ),
//                         ),
//                         child: TextFormField(
//                           decoration: InputDecoration(
//                             hintText: 'ابحث عن رحلة',
//                             hintStyle: TextStyle(
//                               color: ColorsApp.customGry,
//                               fontWeight: FontWeight.w400,
//                               fontSize: 12,
//                             ),
//                             prefixIcon: Icon(
//                               Icons.search,
//                               color: ColorsApp.customGry,
//                             ),
//                             border: InputBorder.none,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Divider(color: ColorsApp.customGryDivider),
//               SizedBox(
//                 height: 40,
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   controller: _scrollController,
//                   child: Obx(
//                     () => Row(
//                       children: List.generate(
//                         stateTrip.length,
//                         (index) => GestureDetector(
//                           onTap: () {
//                             _pageController.animateToPage(
//                               index,
//                               duration: Duration(milliseconds: 300),
//                               curve: Curves.easeInOut,
//                             );
//                             currentIndexState.value = index;
//                             _scrollToIndex(index);
//                           },
//                           child: Container(
//                             alignment: Alignment.center,
//                             width: 80,
//                             height: 40,
//                             margin: EdgeInsets.symmetric(horizontal: 8),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(24),
//                               color: currentIndexState.value == index
//                                   ? ColorsApp.greenLight
//                                   : ColorsApp.greenWithAlpha,
//                             ),
//                             child: Text(
//                               stateTrip[index],
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height - 0,
//                 child: PageView.builder(
//                   controller: _pageController,
//                   onPageChanged: (index) {
//                     currentIndexState.value = index;
//                     _scrollToIndex(index);
//                   },
//                   itemCount: stateTrip.length,
//                   itemBuilder: (context, stateIndex) {
//                     print('State Index: $stateIndex'); // طباعة حالة التمرير
//                     print('***********************${stateIndex}'); //
//                     // طباعة البيانات لكل حالة
//                     final reservations = tripsPerState[stateIndex];
//                     reservations.forEach((reservation) {
//                       print(reservation); // طباعة تفاصيل كل رحلة
//                     });

// ignore_for_file: prefer_const_constructors

//                     return Obx(
//                       () {
//                         final reservations = tripsPerState[stateIndex];
//                         if (reservations.isEmpty) {
//                           return Center(
//                             child: Text(
//                               'لا توجد طلبات لديك',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 color: ColorsApp.customGry,
//                               ),
//                             ),
//                           );
//                         }
//                         return ListView.builder(
//                           padding: EdgeInsets.only(top: 10, bottom: 350),
//                           itemCount: reservations.length,
//                           itemBuilder: (context, reservationIndex) {
//                             final reservation = reservations[reservationIndex];
//                             return CustomExpandableCard(
//                               stateOfTrip: reservation['status'] ?? 'N/A',
//                               name: reservation['name'] ?? 'N/A',
//                               from: reservation['from'] ?? 'N/A',
//                               to: reservation['to'] ?? 'N/A',
//                               km: reservation['km'] ?? 'N/A',
//                               price: reservation['price'] ?? 'N/A',
//                               time: reservation['time'] ?? 'N/A',
//                               image: AssetImage('assets/images/man.png'),
//                             );
//                             // print(reservations); // طباعة البيانات لكل حالة
//                             // print('State: , Reservations: $reservations');
//                           },
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:almaqsura/colors_app/colors_app.dart';
// import 'package:almaqsura/custom_wigets/custom_card_reservation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';

// class ListOfResrevationByState extends StatelessWidget {
//   final RxInt currentIndexState = 0.obs;
//   final RxList<List<Map<String, String>>> tripsPerState =
//       List.generate(3, (_) => <Map<String, String>>[]).obs;
//   final List<String> stateTrip = ['الحالية', 'المكتملة', 'الملغاة'];

//   ListOfResrevationByState({super.key}) {
//     List<Map<String, String>> allReservations = [
//       {
//         "status": "الحالية",
//         "name": "عنوان",
//         'from': "5",
//         "to": "4",
//         "km": "12",
//         "price": "500",
//         "time": "4",
//       },
//       {
//         "status": "المكتملة",
//         "name": "عنوان",
//         'from': "5",
//         "to": "4",
//         "km": "12",
//         "price": "500",
//         "time": "4",
//       },
//       {
//         "status": "الحالية",
//         "name": "عنوان",
//         'from': "5",
//         "to": "4",
//         "km": "12",
//         "price": "500",
//         "time": "4",
//       },
//       {
//         "status": "الملغاة",
//         "name": "عنوان",
//         'from': "5",
//         "to": "4",
//         "km": "12",
//         "price": "500",
//         "time": "4",
//       },
//     ];
//     // for (int i = 0; i < 3; i++) {
//     //   String currentDayName = stateTrip[i];
//     //   // ? DateFormat('EEEE', 'ar').format(today)
//     //   // : daysOfWeek[i];

//     //   tripsPerState[i] =
//     //       allReservations.where((x) => x["day"] == currentDayName).toList();
//     // }
//     // for (var status in stateTrip) {
//     //   List<Map<String, String>> filteredReservations =
//     //       allReservations.where((trip) => trip['status'] == status).toList();
//     //   tripsPerState.add(filteredReservations); // تأكد من الإضافة
//     // }
//     for (var status in stateTrip) {
//       List<Map<String, String>> filteredReservations =
//           allReservations.where((trip) => trip['status'] == status).toList();
//       tripsPerState.add(filteredReservations); // تأكد من الإضافة
//     }
//   }

//   final ScrollController _scrollControllerAll = ScrollController();
//   final ScrollController _scrollController = ScrollController();
//   final PageController _pageController = PageController();

//   void _scrollToIndex(int index) {
//     double itemWidth = 96;
//     double scrollPosition = index * itemWidth;

//     if (_scrollController.hasClients) {
//       SchedulerBinding.instance.addPostFrameCallback((_) {
//         _scrollController.animateTo(
//           scrollPosition,
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeInOut,
//         );
//       });
//     }
//   }

//   void _scrollToTop() {
//     double scrollPosition = 0;

//     if (_scrollControllerAll.hasClients) {
//       SchedulerBinding.instance.addPostFrameCallback((_) {
//         _scrollControllerAll.animateTo(
//           scrollPosition,
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeInOut,
//         );
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: NotificationListener<ScrollNotification>(
//         onNotification: (ScrollNotification notification) {
//           if (notification.metrics.pixels == 0 &&
//               notification is ScrollUpdateNotification) {
//             _scrollToTop();
//             return true;
//           }
//           return false;
//         },
//         child: SingleChildScrollView(
//           controller: _scrollControllerAll,
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 24,
//                   vertical: 6,
//                 ),
//                 child: Row(
//                   children: [
//                     InkWell(
//                       onTap: () {},
//                       child: Container(
//                         height: 48,
//                         width: 48,
//                         decoration: BoxDecoration(
//                           color: ColorsApp.greenWithAlpha,
//                           shape: BoxShape.circle,
//                         ),
//                         child: SvgPicture.asset(
//                           'assets/icons/setting.svg',
//                           fit: BoxFit.scaleDown,
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 8),
//                     Expanded(
//                       child: Container(
//                         height: 50,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(40),
//                           border: Border.all(
//                             color: ColorsApp.customGry,
//                             width: 1,
//                           ),
//                         ),
//                         child: TextFormField(
//                           decoration: InputDecoration(
//                             hintText: 'ابحث عن رحلة',
//                             hintStyle: TextStyle(
//                               color: ColorsApp.customGry,
//                               fontWeight: FontWeight.w400,
//                               fontSize: 12,
//                             ),
//                             prefixIcon: Icon(
//                               Icons.search,
//                               color: ColorsApp.customGry,
//                             ),
//                             border: InputBorder.none,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Divider(color: ColorsApp.customGryDivider),
//               SizedBox(
//                 height: 40,
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   controller: _scrollController,
//                   child: Obx(
//                     () => Row(
//                       children: List.generate(
//                         stateTrip.length,
//                         (index) => GestureDetector(
//                           onTap: () {
//                             _pageController.animateToPage(
//                               index,
//                               duration: Duration(milliseconds: 300),
//                               curve: Curves.easeInOut,
//                             );
//                             currentIndexState.value = index;
//                             _scrollToIndex(index);
//                           },
//                           child: Container(
//                             alignment: Alignment.center,
//                             width: 80,
//                             height: 40,
//                             margin: EdgeInsets.symmetric(horizontal: 8),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(24),
//                               color: currentIndexState.value == index
//                                   ? ColorsApp.greenLight
//                                   : ColorsApp.greenWithAlpha,
//                             ),
//                             child: Text(
//                               stateTrip[index],
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height - 0,
//                 child: PageView.builder(
//                   controller: _pageController,
//                   onPageChanged: (index) {
//                     currentIndexState.value = index;
//                     _scrollToIndex(index);
//                   },
//                   itemCount: stateTrip.length,
//                   itemBuilder: (context, stateIndex) {
//                     Obx(() {
//                       final reservations = tripsPerState[stateIndex];
//                       print(reservations);
//                       if (reservations.isEmpty) {
//                         return Center(
//                           child: Text(
//                             'لا توجد طلبات لديك',
//                             style: TextStyle(
//                               fontSize: 16,
//                               color: ColorsApp.customGry,
//                             ),
//                           ),
//                         );
//                       }
//                       return ListView.builder(
//                         padding: EdgeInsets.only(top: 10, bottom: 200),
//                         itemCount: reservations.length,
//                         itemBuilder: (context, reservationIndex) {
//                           final reservation = reservations[reservationIndex];
//                           return CustomExpandableCard(
//                             stateOfTrip: reservation['status'] ?? 'N/A',
//                             name: reservation['name'] ?? 'N/A',
//                             from: reservation['from'] ?? 'N/A',
//                             to: reservation['to'] ?? 'N/A',
//                             km: reservation['km'] ?? 'N/A',
//                             price: reservation['price'] ?? 'N/A',
//                             time: reservation['time'] ?? 'N/A',
//                             image: AssetImage('assets/images/man.png'),
//                           );
//                         },
//                       );
//                     });
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:almaqsura/colors_app/colors_app.dart';
// import 'package:almaqsura/custom_wigets/custom_card_reservation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';

// class ListOfResrevationByState extends StatelessWidget {
//   final RxInt currentIndexState = 0.obs;
//   final RxList<List<Map<String, String>>> tripsPerState =
//       List.generate(3, (_) => <Map<String, String>>[]).obs;
//   final List<String> stateTrip = ['الحالية', 'المكتملة', 'الملغاة'];

//   ListOfResrevationByState({super.key}) {
//     List<Map<String, String>> allReservations = [
//       // {
//       //   "status": "الحالية",
//       //   "name": "عنوان",
//       //   'from': "5",
//       //   "to": "4",
//       //   "km": "12",
//       //   "price": "500",
//       //   "time": "4",
//       // },
//       // {
//       //   "status": "المكتملة",
//       //   "name": "عنوان",
//       //   'from': "5",
//       //   "to": "4",
//       //   "km": "12",
//       //   "price": "500",
//       //   "time": "4",
//       // },
//       // {
//       //   "status": "الحالية",
//       //   "name": "عنوان",
//       //   'from': "5",
//       //   "to": "4",
//       //   "km": "12",
//       //   "price": "500",
//       //   "time": "4",
//       // },
//       // {
//       //   "status": "الملغاة",
//       //   "name": "عنوان",
//       //   'from': "5",
//       //   "to": "4",
//       //   "km": "12",
//       //   "price": "500",
//       //   "time": "4",
//       // },
//     ];

//     // for (var status in stateTrip) {
//     //   List<Map<String, String>> filteredReservations =
//     //       allReservations.where((trip) => trip['status'] == status).toList();
//     //   tripsPerState.add(filteredReservations);
//     // }
//   }

//   final ScrollController _scrollControllerAll = ScrollController();
//   final ScrollController _scrollController = ScrollController();
//   final PageController _pageController = PageController();

//   void _scrollToIndex(int index) {
//     double itemWidth = 96;
//     double scrollPosition = index * itemWidth;

//     if (_scrollController.hasClients) {
//       SchedulerBinding.instance.addPostFrameCallback((_) {
//         _scrollController.animateTo(
//           scrollPosition,
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeInOut,
//         );
//       });
//     }
//   }

//   void _scrollToTop() {
//     double scrollPosition = 0;

//     if (_scrollControllerAll.hasClients) {
//       SchedulerBinding.instance.addPostFrameCallback((_) {
//         _scrollControllerAll.animateTo(
//           scrollPosition,
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeInOut,
//         );
//       });
//     }
//   }

//   void _printReservations() {
//     for (var reservationList in tripsPerState) {
//       for (var reservation in reservationList) {
//         print(reservation);
//         print('----------------');
//       }
//     }
//     print('----------------');
//   }

//   @override
//   Widget build(BuildContext context) {
//     _printReservations();
//     return Scaffold(
//       body: NotificationListener<ScrollNotification>(
//         onNotification: (ScrollNotification notification) {
//           if (notification.metrics.pixels == 0 &&
//               notification is ScrollUpdateNotification) {
//             _scrollToTop();
//             return true;
//           }
//           return false;
//         },
//         child: SingleChildScrollView(
//           controller: _scrollControllerAll,
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 24,
//                   vertical: 6,
//                 ),
//                 child: Row(
//                   children: [
//                     InkWell(
//                       onTap: () {},
//                       child: Container(
//                         height: 48,
//                         width: 48,
//                         decoration: BoxDecoration(
//                           color: ColorsApp.greenWithAlpha,
//                           shape: BoxShape.circle,
//                         ),
//                         child: SvgPicture.asset(
//                           'assets/icons/setting.svg',
//                           fit: BoxFit.scaleDown,
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 8),
//                     Expanded(
//                       child: Container(
//                         height: 50,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(40),
//                           border: Border.all(
//                             color: ColorsApp.customGry,
//                             width: 1,
//                           ),
//                         ),
//                         child: TextFormField(
//                           decoration: InputDecoration(
//                             hintText: 'ابحث عن رحلة',
//                             hintStyle: TextStyle(
//                               color: ColorsApp.customGry,
//                               fontWeight: FontWeight.w400,
//                               fontSize: 12,
//                             ),
//                             prefixIcon: Icon(
//                               Icons.search,
//                               color: ColorsApp.customGry,
//                             ),
//                             border: InputBorder.none,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Divider(color: ColorsApp.customGryDivider),
//               SizedBox(
//                 height: 40,
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   controller: _scrollController,
//                   child: Obx(
//                     () => Row(
//                       children: List.generate(
//                         stateTrip.length,
//                         (index) => GestureDetector(
//                           onTap: () {
//                             _pageController.animateToPage(
//                               index,
//                               duration: Duration(milliseconds: 300),
//                               curve: Curves.easeInOut,
//                             );
//                             currentIndexState.value = index;
//                             _scrollToIndex(index);
//                           },
//                           child: Container(
//                             alignment: Alignment.center,
//                             width: 80,
//                             height: 40,
//                             margin: EdgeInsets.symmetric(horizontal: 8),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(24),
//                               color: currentIndexState.value == index
//                                   ? ColorsApp.greenLight
//                                   : ColorsApp.greenWithAlpha,
//                             ),
//                             child: Text(
//                               stateTrip[index],
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height - 100,
//                 child: PageView.builder(
//                   controller: _pageController,
//                   onPageChanged: (index) {
//                     currentIndexState.value = index;
//                     _scrollToIndex(index);
//                   },
//                   itemCount: stateTrip.length,
//                   itemBuilder: (context, stateIndex) {
//                     Obx(() {
//                       final reservations = tripsPerState[stateIndex];
//                       if (reservations.isEmpty) {
//                         return Center(
//                           child: Text(
//                             'لا توجد طلبات لديك',
//                             style: TextStyle(
//                               fontSize: 16,
//                               color: ColorsApp.customGry,
//                             ),
//                           ),
//                         );
//                       }
//                       return ListView.builder(
//                         controller: _scrollControllerAll,
//                         padding: EdgeInsets.only(top: 10, bottom: 200),
//                         itemCount: reservations.length,
//                         itemBuilder: (context, reservationIndex) {
//                           final reservation = reservations[reservationIndex];
//                           return CustomExpandableCard(
//                             stateOfTrip: reservation['status'] ?? 'N/A',
//                             name: reservation['name'] ?? 'N/A',
//                             from: reservation['from'] ?? 'N/A',
//                             to: reservation['to'] ?? 'N/A',
//                             km: reservation['km'] ?? 'N/A',
//                             price: reservation['price'] ?? 'N/A',
//                             time: reservation['time'] ?? 'N/A',
//                             image: AssetImage('assets/images/man.png'),
//                           );
//                         },
//                       );
//                     });
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
