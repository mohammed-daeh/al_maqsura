// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:almaqsura/colors_app/colors_app.dart';
import 'package:almaqsura/custom_wigets/app_bar/custom_app_bar_normal.dart';
import 'package:almaqsura/futuers/app_user/view/u_my_reservations/list_of_resrevation_by_state.dart';
import 'package:flutter/material.dart';

class MyReservationsView extends StatelessWidget {
  const MyReservationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            // height: 123,
            child: CustomAppBarNormal(
              name: 'حجوزاتي',
              color: ColorsApp.primaryColor,
              spacer: 9,
            ),
          ),
          Expanded(
            child: ListOfResrevationByState(),
          )
        ],
      ),
    );
  }
}
