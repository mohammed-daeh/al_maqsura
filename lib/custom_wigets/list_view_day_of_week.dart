
import 'package:almaqsura/colors_app/colors_app.dart';
import 'package:almaqsura/custom_wigets/custom_card_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; 

class PageViewHome extends StatelessWidget {
  final PageController _pageController = PageController();
  final RxInt _currentIndexDay = 0.obs;
  final List<String> daysOfWeek = [];

  PageViewHome() {
    DateTime today = DateTime.now();
    for (int i = 0; i < 7; i++) {
      String day =
          DateFormat('EEEE', 'ar').format(today.add(Duration(days: i)));
      if (i == 0) {
        daysOfWeek.add("اليوم");
      } else {
        daysOfWeek.add(day);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Obx(() => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                ),
              )),
          SizedBox(height: 16),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                _currentIndexDay.value = index;
              },
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      children: [
                        CustomCardHome(),
                        CustomCardHome(),
                        CustomCardHome(),
                        CustomCardHome(),
                        CustomCardHome(),
                        CustomCardHome(),
                        CustomCardHome(),
                        CustomCardHome(),
                        CustomCardHome(),
                        CustomCardHome(),
                        CustomCardHome(),
                        CustomCardHome(),
                        CustomCardHome(),
                        CustomCardHome(),
                        CustomCardHome(),
                        CustomCardHome(),
                        CustomCardHome(),
                      ],
                    ),
                  ),
                ),
                Center(child: Text('الصفحة 2', style: TextStyle(fontSize: 24))),
                Center(child: Text('الصفحة 3', style: TextStyle(fontSize: 24))),
                Center(child: Text('الصفحة 3', style: TextStyle(fontSize: 24))),
                Center(child: Text('الصفحة 3', style: TextStyle(fontSize: 24))),
                Center(child: Text('الصفحة 3', style: TextStyle(fontSize: 24))),
                Center(child: Text('الصفحة 3', style: TextStyle(fontSize: 24))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
