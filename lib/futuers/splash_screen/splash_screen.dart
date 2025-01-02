// ignore_for_file: prefer_const_constructors

import 'package:almaqsura/colors_app/colors_app.dart';
import 'package:almaqsura/futuers/on_boarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnBoardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.secondaryColor,
      body: Center(
        child: Image(
          image: AssetImage('assets/images/logo.png'),
          height: 160,
        ),
      ),
    );
  }
}
