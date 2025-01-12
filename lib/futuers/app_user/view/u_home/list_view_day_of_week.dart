import 'package:almaqsura/colors_app/colors_app.dart';
import 'package:almaqsura/custom_wigets/card/custom_card_home_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ListViewDayOfWeek extends StatelessWidget {
  final RxInt _currentIndexDay = 0.obs;
  final List<String> daysOfWeek = [];
  final RxList<List<Map<String, String>>> tripsPerDay =
      List.generate(7, (_) => <Map<String, String>>[]).obs;

  ListViewDayOfWeek({super.key}) {
    DateTime today = DateTime.now();

    for (int i = 0; i < 7; i++) {
      DateTime currentDay = today.add(Duration(days: i));
      String dayName = DateFormat('EEEE', 'ar').format(currentDay);

      if (i == 0) {
        daysOfWeek.add("اليوم");
      } else {
        daysOfWeek.add(dayName);
      }
    }

    List<Map<String, String>> allTrips = [
      {
        "firstPart": "الطائف",
        "secondPart": "الرياض",
        "date": "2024-01-05",
        "goTime": "08:00",
        "arrivedTime": "12:00",
        "distance": "400",
        "day": "السبت",
        "monthName": "رريناير",
      },
      {
        "firstPart": "جدة",
        "secondPart": "الرياض",
        "date": "2024-01-06",
        "goTime": "18:00",
        "arrivedTime": "01:00",
        "distance": "800",
        "day": "الأحد",
        "monthName": "يناير",
      },
      {
        "firstPart": "mmmmمكة",
        "secondPart": "الدمام",
        "date": "2024-01-07",
        "goTime": "14:00",
        "arrivedTime": "20:00",
        "distance": "1200",
        "day": "الاثنين",
        "monthName": "يناير",
      },
      {
        "firstPart": "mmmmمكة",
        "secondPart": "الدمام",
        "date": "2024-01-07",
        "goTime": "14:00",
        "arrivedTime": "20:00",
        "distance": "1200",
        "day": "الثلاثاء",
        "monthName": "يناير",
      },
      {
        "firstPart": "mmmmمكة",
        "secondPart": "الدمام",
        "date": "2024-01-07",
        "goTime": "14:00",
        "arrivedTime": "20:00",
        "distance": "1200",
        "day": "الأربعاء",
        "monthName": "يناير",
      },
      {
        "firstPart": "mmmmمكة",
        "secondPart": "الدمام",
        "date": "2024-01-07",
        "goTime": "14:00",
        "arrivedTime": "20:00",
        "distance": "1200",
        "day": "الخميس",
        "monthName": "يناير",
      },
      {
        "firstPart": "mmmmمكة",
        "secondPart": "الدمام",
        "date": "2024-01-07",
        "goTime": "14:00",
        "arrivedTime": "20:00",
        "distance": "1200",
        "day": "الجمعة",
        "monthName": "يناير",
      },
      {
        "firstPart": "mmmmمكة",
        "secondPart": "الدhhhhhhمام",
        "date": "2024-01-07",
        "goTime": "24:99",
        "arrivedTime": "24:99",
        "distance": "1200",
        "day": "الجمعة",
        "monthName": "فبراير",
      },
      {
        "firstPart": "mmmmمكة",
        "secondPart": "الدمام",
        "date": "2024-01-07",
        "goTime": "14:00",
        "arrivedTime": "20:00",
        "distance": "1200",
        "day": "الجمعة",
        "monthName": "يناير",
      },

      {
        "firstPart": "الطائف",
        "secondPart": "الرياض",
        "date": "2024-01-05",
        "goTime": "08:00",
        "arrivedTime": "12:00",
        "distance": "400",
        "day": "السبت",
        "monthName": "يناير",
      },
      {
        "firstPart": "جدة",
        "secondPart": "الرياض",
        "date": "2024-01-06",
        "goTime": "18:00",
        "arrivedTime": "01:00",
        "distance": "800",
        "day": "الأحد",
        "monthName": "يناير",
      },
      {
        "firstPart": "مكة",
        "secondPart": "الدمام",
        "date": "2024-01-07",
        "goTime": "14:00",
        "arrivedTime": "20:00",
        "distance": "1200",
        "day": "الاثنين",
        "monthName": "يناير",
      },
      // ... بقية البيانات
    ];

    for (int i = 0; i < 7; i++) {
      String currentDayName = daysOfWeek[i] == "اليوم"
          ? DateFormat('EEEE', 'ar').format(today)
          : daysOfWeek[i];

      tripsPerDay[i] =
          allTrips.where((trip) => trip["day"] == currentDayName).toList();
    }
  }

  final ScrollController _scrollControllerAll = ScrollController();
  final ScrollController _scrollController = ScrollController();
  final PageController _pageController = PageController();

  // void _scrollToIndex(int index) {
  //   double itemWidth = 96;
  //   double scrollPosition = index * itemWidth;

  //   _scrollController.animateTo(
  //     scrollPosition,
  //     duration: const Duration(milliseconds: 300),
  //     curve: Curves.easeInOut,
  //   );
  // }

  // void _scrollToTop() {
  //   double scrollPosition = 0;

  //   _scrollControllerAll.animateTo(
  //     scrollPosition,
  //     duration: const Duration(milliseconds: 300),
  //     curve: Curves.easeInOut,
  //   );
  // }
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
                            width: 80,
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
                        padding: EdgeInsets.only(top: 10, bottom: 350),
                        itemCount: trips.length,
                        itemBuilder: (context, tripIndex) {
                          final trip = trips[tripIndex];
                          return CustomCardHomeUser(
                            firstPart: trip["firstPart"] ?? "N/A",
                            secondPart: trip["secondPart"] ?? "N/A",
                            date: trip["date"] ?? "N/A",
                            goTime: trip["goTime"] ?? "N/A",
                            arrivedTime: trip["arrivedTime"] ?? "N/A",
                            distance: trip["distance"] ?? "N/A",
                            day: trip['day'] ?? "N/A",
                            monthName: trip['monthName'] ?? "N/A",
                          );
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
// import 'package:almaqsura/custom_wigets/custom_card_home.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';

// class ListViewDayOfWeek extends StatelessWidget {
//   // final PageController _pageController = PageController();
//   final RxInt _currentIndexDay = 0.obs;
//   final List<String> daysOfWeek = [];
//   final RxList<List<Map<String, String>>> tripsPerDay =
//       List.generate(7, (_) => <Map<String, String>>[]).obs;

//   ListViewDayOfWeek() {
//     DateTime today = DateTime.now();

//     for (int i = 0; i < 7; i++) {
//       DateTime currentDay = today.add(Duration(days: i));
//       String dayName = DateFormat('EEEE', 'ar').format(currentDay);

//       if (i == 0) {
//         daysOfWeek.add("اليوم");
//       } else {
//         daysOfWeek.add(dayName);
//       }
//     }

//     List<Map<String, String>> allTrips = [
//       {
//         "firstPart": "الطائف",
//         "secondPart": "الرياض",
//         "date": "2024-01-05",
//         "goTime": "08:00",
//         "arrivedTime": "12:00",
//         "distance": "400",
//         "day": "السبت",
//         "monthName": "رريناير",
//       },
//       {
//         "firstPart": "جدة",
//         "secondPart": "الرياض",
//         "date": "2024-01-06",
//         "goTime": "18:00",
//         "arrivedTime": "01:00",
//         "distance": "800",
//         "day": "الأحد",
//         "monthName": "يناير",
//       },
//       {
//         "firstPart": "mmmmمكة",
//         "secondPart": "الدمام",
//         "date": "2024-01-07",
//         "goTime": "14:00",
//         "arrivedTime": "20:00",
//         "distance": "1200",
//         "day": "الاثنين",
//         "monthName": "يناير",
//       },
//       {
//         "firstPart": "mmmmمكة",
//         "secondPart": "الدمام",
//         "date": "2024-01-07",
//         "goTime": "14:00",
//         "arrivedTime": "20:00",
//         "distance": "1200",
//         "day": "الثلاثاء",
//         "monthName": "يناير",
//       },
//       {
//         "firstPart": "mmmmمكة",
//         "secondPart": "الدمام",
//         "date": "2024-01-07",
//         "goTime": "14:00",
//         "arrivedTime": "20:00",
//         "distance": "1200",
//         "day": "الأربعاء",
//         "monthName": "يناير",
//       },
//       {
//         "firstPart": "mmmmمكة",
//         "secondPart": "الدمام",
//         "date": "2024-01-07",
//         "goTime": "14:00",
//         "arrivedTime": "20:00",
//         "distance": "1200",
//         "day": "الخميس",
//         "monthName": "يناير",
//       },
//       {
//         "firstPart": "mmmmمكة",
//         "secondPart": "الدمام",
//         "date": "2024-01-07",
//         "goTime": "14:00",
//         "arrivedTime": "20:00",
//         "distance": "1200",
//         "day": "الجمعة",
//         "monthName": "يناير",
//       },
//       {
//         "firstPart": "mmmmمكة",
//         "secondPart": "الدhhhhhhمام",
//         "date": "2024-01-07",
//         "goTime": "24:99",
//         "arrivedTime": "24:99",
//         "distance": "1200",
//         "day": "الجمعة",
//         "monthName": "فبراير",
//       },
//       {
//         "firstPart": "mmmmمكة",
//         "secondPart": "الدمام",
//         "date": "2024-01-07",
//         "goTime": "14:00",
//         "arrivedTime": "20:00",
//         "distance": "1200",
//         "day": "الجمعة",
//         "monthName": "يناير",
//       },
//     ];

//     for (int i = 0; i < 7; i++) {
//       String currentDayName = daysOfWeek[i] == "اليوم"
//           ? DateFormat('EEEE', 'ar').format(today)
//           : daysOfWeek[i];

//       tripsPerDay[i] =
//           allTrips.where((trip) => trip["day"] == currentDayName).toList();
//     }
//   }
//   final ScrollController _scrollController = ScrollController();
//   final PageController _pageController = PageController();

//   void _scrollToIndex(int index) {
//     double itemWidth = 96;
//     double scrollPosition = index * itemWidth;

//     _scrollController.animateTo(
//       scrollPosition,
//       duration: Duration(milliseconds: 300),
//       curve: Curves.easeInOut,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 24,
//                 vertical: 6,
//               ),
//               child: Row(
//                 children: [
//                   InkWell(
//                     onTap: () {},
//                     child: Container(
//                       height: 48,
//                       width: 48,
//                       decoration: BoxDecoration(
//                         color: ColorsApp.greenWithAlpha,
//                         shape: BoxShape.circle,
//                       ),
//                       child: SvgPicture.asset(
//                         'assets/icons/setting.svg',
//                         fit: BoxFit.scaleDown,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 8,
//                   ),
//                   Expanded(
//                     child: Container(
//                       height: 50,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(40),
//                         border: Border.all(
//                           color: ColorsApp.customGry,
//                           width: 1,
//                         ),
//                       ),
//                       child: TextFormField(
//                         decoration: InputDecoration(
//                           hintText: 'ابحث عن رحلة',
//                           hintStyle: TextStyle(
//                             color: ColorsApp.customGry,
//                             fontWeight: FontWeight.w400,
//                             fontSize: 12,
//                           ),
//                           prefixIcon: Icon(
//                             Icons.search,
//                             color: ColorsApp.customGry,
//                           ),
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Divider(
//               color: ColorsApp.customGryDivider,
//             ),
//             SizedBox(
//               height: 40,
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 controller: _scrollController,
//                 child: Obx(
//                   () => Row(
//                     children: List.generate(
//                       daysOfWeek.length,
//                       (index) => GestureDetector(
//                         onTap: () {
//                           _pageController.animateToPage(
//                             index,
//                             duration: Duration(milliseconds: 300),
//                             curve: Curves.easeInOut,
//                           );
//                           _currentIndexDay.value = index;
//                           _scrollToIndex(index);
//                         },
//                         child: Container(
//                           alignment: Alignment.center,
//                           width: 80,
//                           height: 40,
//                           margin: EdgeInsets.symmetric(horizontal: 8),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(24),
//                             color: _currentIndexDay.value == index
//                                 ? ColorsApp.greenLight
//                                 : ColorsApp.greenWithAlpha,
//                           ),
//                           child: Text(
//                             daysOfWeek[index],
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 12,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//             SizedBox(
//               // height: 800,
//               height: MediaQuery.of(context).size.height - 0,
//               child: PageView.builder(

//                 controller: _pageController,
//                 onPageChanged: (index) {
//                   _currentIndexDay.value = index;
//                   _scrollToIndex(index); // تحريك السكرول مع تغيير الصفحة

//                 },

//                 itemCount: daysOfWeek.length,
//                 itemBuilder: (context, dayIndex) {
//                   return Obx(() {
//                     final trips = tripsPerDay[dayIndex];
//                     if (trips.isEmpty) {
//                       return Center(
//                         child: Text(
//                           'لا توجد رحلات متوفرة',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: ColorsApp.customGry,
//                           ),
//                         ),
//                       );
//                     }
//                     return ListView.builder(
//                       padding: EdgeInsets.only(top: 10, bottom: 350),
//                       itemCount: trips.length,
//                       itemBuilder: (context, tripIndex) {
//                         final trip = trips[tripIndex];
//                         return CustomCardHome(
//                           firstPart: trip["firstPart"] ?? "N/A",
//                           secondPart: trip["secondPart"] ?? "N/A",
//                           date: trip["date"] ?? "N/A",
//                           goTime: trip["goTime"] ?? "N/A",
//                           arrivedTime: trip["arrivedTime"] ?? "N/A",
//                           distance: trip["distance"] ?? "N/A",
//                           day: trip['day'] ?? "N/A",
//                           monthName: trip['monthName'] ?? "N/A",

// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors

//                         );
//                       },
//                     );
//                   });
//                 },
//               ),
//             ),
//             // SizedBox(
//             //   height: 150,
//             // )
//           ],
//         ),
//       ),
//     );
//   }
// }
