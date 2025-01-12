// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_const_constructors_in_immutables

import 'package:almaqsura/custom_wigets/app_bar/custom_app_bar_main.dart';
import 'package:flutter/material.dart';

import 'list_view_day_of_week.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
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
            child: ListViewDayOfWeek(),
          )
        ],
      ),
    );
  }
}
