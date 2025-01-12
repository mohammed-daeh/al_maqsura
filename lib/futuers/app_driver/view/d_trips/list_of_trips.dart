// ignore_for_file: prefer_const_constructors

import 'package:almaqsura/colors_app/colors_app.dart';
import 'package:almaqsura/custom_wigets/card/custom_card_trips.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class ListOfTrips extends StatelessWidget {
  final RxInt _currentIndexStatus = 0.obs;
  final List<String> listStatus = ['الكل', 'يومية', 'شهرية'];
  final RxList<List<Map<String, String>>> listTrips =
      List.generate(3, (_) => <Map<String, String>>[]).obs;

  ListOfTrips({super.key}) {
    List<Map<String, String>> allTrips = [
      {
        "status": "يومية",
        "firstPart": "الطائف",
        "secondPart": "الرياض",
        "goTime": "08:00",
        "arrivedTime": "12:00",
        "day": "السبت",
        "monthName": "رريناير",
      },
      {
        "status": "يومية",
        "firstPart": "الطائف",
        "secondPart": "الرياض",
        "goTime": "08:00",
        "arrivedTime": "12:00",
        "day": "السبت",
        "monthName": "رريناير",
      },
      {
        "status": "يومية",
        "firstPart": "الطائف",
        "secondPart": "الرياض",
        "goTime": "08:00",
        "arrivedTime": "12:00",
        "day": "السبت",
        "monthName": "رريناير",
      },
      {
        "status": "شهرية",
        "firstPart": "الطائف",
        "secondPart": "الرياض",
        "goTime": "08:00",
        "arrivedTime": "12:00",
        "day": "السبت",
        "monthName": "رريناير",
      },
      {
        "status": "شهرية",
        "firstPart": "الطائف",
        "secondPart": "الرياض",
        "goTime": "08:00",
        "arrivedTime": "12:00",
        "day": "السبت",
        "monthName": "رريناير",
      },
      {
        "status": "شهرية",
        "firstPart": "الطائف",
        "secondPart": "الرياض",
        "goTime": "08:00",
        "arrivedTime": "12:00",
        "day": "السبت",
        "monthName": "رريناير",
      },
      {
        "status": "يومية",
        "firstPart": "الطائف",
        "secondPart": "الرياض",
        "goTime": "08:00",
        "arrivedTime": "12:00",
        "day": "السبت",
        "monthName": "رريناير",
      },
      {
        "status": "شهرية",
        "firstPart": "الطائف",
        "secondPart": "الرياض",
        "goTime": "08:00",
        "arrivedTime": "12:00",
        "day": "السبت",
        "monthName": "رريناير",
      },
      {
        "status": "شهرية",
        "firstPart": "الطائف",
        "secondPart": "الرياض",
        "goTime": "08:00",
        "arrivedTime": "12:00",
        "day": "السبت",
        "monthName": "رريناير",
      },
    ];
    for (var trip in allTrips) {
      String status = trip["status"]!;

      if (status == "يومية" && status == 'شهرية') {
        listTrips[0].add(trip);
      } else if (status == "يومية") {
        listTrips[1].add(trip);
      } else if (status == "شهرية") {
        listTrips[2].add(trip);
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
        child: Column(
          children: [
            SizedBox(
              height: 10,
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
                      listStatus.length,
                      (index) => GestureDetector(
                        onTap: () {
                          _pageController.animateToPage(
                            index,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                          _currentIndexStatus.value = index;
                          _scrollToIndex(index);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 105,
                          height: 40,
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: _currentIndexStatus.value == index
                                ? ColorsApp.greenLight
                                : ColorsApp.greenWithAlpha,
                          ),
                          child: Text(
                            listStatus[index],
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
            SizedBox(height: 10),
            SizedBox(
              // height: 500,
              height: MediaQuery.of(context).size.height - 185,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  _currentIndexStatus.value = index;
                  _scrollToIndex(index);
                },
                itemCount: listStatus.length,
                itemBuilder: (context, dayIndex) {
                  return Obx(() {
                    List<Map<String, String>> trips;
                    if (dayIndex == 0) {
                      // دمج الكروت في حالة "الكل"
                      trips = [...listTrips[1], ...listTrips[2]];
                    } else {
                      trips = listTrips[dayIndex];
                    }
                    // final trips = listTrips[dayIndex];
                    if (trips.isEmpty) {
                      return const Center(
                        child: Text(
                          'لا توجد حجوزات متوفرة',
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
                        return CustomCardTrips(
                          status: trip["status"] ?? "N/A",
                          firstPart: trip["firstPart"] ?? "N/A",
                          secondPart: trip["secondPart"] ?? "N/A",
                          goTime: trip["goTime"] ?? "N/A",
                          arrivedTime: trip["arrivedTime"] ?? "N/A",
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
    );
  }
}
