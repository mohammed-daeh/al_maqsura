// import 'package:flutter/material.dart';

// class DriverHomeView extends StatelessWidget {
//   const DriverHomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Center(child: Text('DriverHomeView')));
//   }
// }

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_const_constructors_in_immutables

import 'package:almaqsura/custom_wigets/app_bar/custom_app_bar_main.dart';
import 'package:almaqsura/futuers/app_driver/view/d_home/d_days_of_week_driver_view.dart';
import 'package:flutter/material.dart';

class DriverHomeView extends StatelessWidget {
  DriverHomeView({super.key});
  // final WeekDaysController controller = Get.find<WeekDaysController>();
  final String name = 'أحمد المحمد';
  final String location = 'السعودية_الطائف';
  @override
  Widget build(BuildContext context) {
    // TextEditingController? serchController;

    return Scaffold(
      body: Column(
        children: [
          Container(
              height: 123,
              child: CustomAppBarMain(name: name, location: location)),
          Expanded(
            child: DaysOfWeekDriverView(),
          )
        ],
      ),
    );
  }
}
