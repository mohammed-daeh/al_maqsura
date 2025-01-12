// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:almaqsura/colors_app/colors_app.dart';
import 'package:almaqsura/custom_wigets/custom_navigation_bar.dart';
import 'package:almaqsura/futuers/app_driver/controllar/custom_navigation_controllar.dart';
import 'package:almaqsura/futuers/app_driver/controllar/d_form_add_trip_controllar.dart';
import 'package:almaqsura/futuers/app_driver/view/d_home/d_add_trip_view.dart';
import 'package:almaqsura/futuers/app_driver/view/d_home/d_home_view.dart';
import 'package:almaqsura/futuers/app_driver/view/d_notifications/d_notification_view.dart';
import 'package:almaqsura/futuers/app_driver/view/d_profile/d_profile_view.dart';
import 'package:almaqsura/futuers/app_driver/view/d_reservation/d_reservation_view.dart';
import 'package:almaqsura/futuers/app_driver/view/d_trips/d_trips_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDriverMainView extends StatelessWidget {
  AppDriverMainView({super.key});

  final List<Widget> _pages = [
    DriverHomeView(),
    DriverReservationView(),
    DriverTripsView(),
    DriverNotificationView(),
    DriverProfilView(),
  ];

  final DriverBottomNavController _controller =
      Get.put(DriverBottomNavController());
  final tripController = Get.put(TripController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(name: name, location: location),
      body: Stack(
        children: [
          Positioned.fill(
            child: Obx(() => _pages[_controller.selectedIndex.value]),
          ),
          Positioned(
            bottom: 24,
            left: 24,
            right: 24,
            child: Container(
              height: 72,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 11,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Obx(() => CustomBottomNavigationBar(
                    activeIcons: _controller.iconPathsActive,
                    inactiveIcons: _controller.iconPathsInactive,
                    labels: _controller.labels,
                    selectedIndex: _controller.selectedIndex.value,
                    onTabSelected: _controller.changeTabIndex,
                  )),
            ),
          ),
          Positioned(
              right: 24,
              bottom: 110,
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => AddTripDriverView()));
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorsApp.primaryColor,
                  ),
                  child: Icon(
                    Icons.add_outlined,
                    size: 30,
                    color: ColorsApp.whiteColor,
                  ),
                ),
              )),
          // Positioned(
          //     right: 124,
          //     bottom: 110,
          //     child: InkWell(
          //       onTap: () {
          //         // tripController.printTrips();
          //       },
          //       child: Container(
          //         width: 50,
          //         height: 50,
          //         decoration: BoxDecoration(
          //           shape: BoxShape.circle,
          //           color: ColorsApp.primaryColor,
          //         ),
          //         child: Icon(
          //           Icons.add_outlined,
          //           size: 30,
          //           color: ColorsApp.whiteColor,
          //         ),
          //       ),
          //     ))

        ],
      ),
    );
  }
}
