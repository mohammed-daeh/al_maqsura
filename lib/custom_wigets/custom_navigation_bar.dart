// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:almaqsura/colors_app/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final List<String> activeIcons;
  final List<String> inactiveIcons;
  final List<String> labels;
  final int selectedIndex;
  final Function(int) onTabSelected;

  const CustomBottomNavigationBar({
    Key? key,
    required this.activeIcons,
    required this.inactiveIcons,
    required this.labels,
    required this.selectedIndex,
    required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(labels.length, (index) {
          final isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () => onTabSelected(index),
            child: Container(
              width: 62,
              decoration: BoxDecoration(
                border: isSelected
                    ? Border(
                        top: BorderSide(
                          color:
                              ColorsApp.primaryColor, 
                          width: 2.5,
                        ),
                      )
                    : null,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    isSelected ? activeIcons[index] : inactiveIcons[index],
                    height: 24,
                    width: 24,
                  ),
                  SizedBox(height: 8),
                  Text(
                    isSelected ? labels[index] : '',
                    style: TextStyle(
                      color: isSelected
                          ? ColorsApp.primaryColor
                          : Colors.transparent,
                      fontSize: isSelected ? 12 : 0,
                      fontWeight:
                          isSelected ? FontWeight.w500 : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
