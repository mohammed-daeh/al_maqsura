// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:almaqsura/custom_wigets/custom_navigation_bar.dart';
import 'package:almaqsura/futuers/app_user/view/u_my_reservations/my_reservation_view.dart';
import 'package:almaqsura/futuers/app_user/controllar/custom_navigation_controllar.dart';
import 'package:almaqsura/futuers/app_user/view/u_home/home_view.dart';
import 'package:almaqsura/futuers/app_user/view/u_notifications/notifications_view.dart';
import 'package:almaqsura/futuers/app_user/view/u_profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainView extends StatelessWidget {
  MainView({super.key});

  final List<Widget> _pages = [
    HomeView(),
    MyReservationsView(),
    NotificationsView(),
    ProfileView(),
  ];

  final UserBottomNavController _controller =
      Get.put(UserBottomNavController());

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
        ],
      ),
    );
  }
}
