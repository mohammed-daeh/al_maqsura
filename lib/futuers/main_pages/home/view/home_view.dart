// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:almaqsura/colors_app/colors_app.dart';
import 'package:almaqsura/custom_wigets/list_view_day_of_week.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  // final WeekDaysController controller = Get.find<WeekDaysController>();

  @override
  Widget build(BuildContext context) {
    TextEditingController? serchController;

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 24, left: 24),
            child: Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: ColorsApp.greenWithAlpha,
                        shape: BoxShape.circle),
                    child: SvgPicture.asset(
                      'assets/icons/setting.svg',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    // padding: EdgeInsets.only(right: 34),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: ColorsApp.customGry,
                        width: 1,
                      ),
                    ),
                    child: TextFormField(
                      controller: serchController,
                      decoration: InputDecoration(
                        hintText: 'ابحث عن رحلة',
                        hintStyle: TextStyle(
                            color: ColorsApp.customGry,
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Divider(
              color: ColorsApp.customGry,
            ),
          ),
          Expanded(
            child: PageViewHome(),
          )
        ],
      ),
    );
  }
}
