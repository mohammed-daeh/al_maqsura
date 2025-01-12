
// ignore_for_file: prefer_const_constructors, use_super_parameters

import 'package:almaqsura/colors_app/colors_app.dart';
import 'package:almaqsura/futuers/app_driver/d_main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DriverProfilView extends StatelessWidget {
  const DriverProfilView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(right: 32),
            height: 110,
            alignment: Alignment.bottomRight,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back, size: 32,
                    // color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => AppDriverMainView()));
                  },
                ),
                Text(
                  'حسابي',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    // color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Divider(),
          ),
          Column(
            children: [
              Container(
                height: 96,
                width: 96,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: ColorsApp.greenBright,
                    )),
                child: Image.asset('assets/images/man.png'),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'Ahmad Almohammed',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Ahmad.Almohammed@gmail.com',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: ColorsApp.customGryText),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorsApp.greenWithAlpha,
                    ),
                    child: Icon(
                      Icons.edit,
                      color: ColorsApp.primaryColor,
                      size: 15,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'السعودية , الطائف , حي شهار',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ColorsApp.customGryText),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 27, left: 21),
            child: Column(
              children: [
                DCustomRowWidget(
                  onTap: () {},
                  pathIcon: 'assets/icons/setting.svg',
                  title: 'الإعدادت',
                ),
                DCustomRowWidget(
                  onTap: () {},
                  pathIcon: 'assets/icons/location_g.svg',
                  title: 'الموقع',
                ),
                DCustomRowWidget(
                  onTap: () {},
                  pathIcon: 'assets/icons/payment_card.svg',
                  title: 'الدفع',
                ),
                DCustomRowWidget(
                  onTap: () {},
                  pathIcon: 'assets/icons/power.svg',
                  title: 'تسجيل الخروج',
                ),
                DCustomRowWidget(
                  onTap: () {},
                  pathIcon: 'assets/icons/info.svg',
                  title: 'حول التطبيق',
                ),
              ],
            ),
          ),
          SizedBox(
            height: 90,
          )
        ],
      ),
    );
  }
}

class DCustomRowWidget extends StatelessWidget {
  final String title;
  final String pathIcon;
  final VoidCallback onTap;

  const DCustomRowWidget({
    required this.title,
    required this.pathIcon,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorsApp.greenWithAlpha,
                ),
                child: SvgPicture.asset(
                  pathIcon, // مسار ملف SVG
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Spacer(),
              Icon(
                Icons.keyboard_arrow_left,
                size: 24,
              )
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
