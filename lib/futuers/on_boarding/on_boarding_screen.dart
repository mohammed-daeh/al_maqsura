// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:almaqsura/colors_app/colors_app.dart';
import 'package:almaqsura/futuers/auth/view/creat_account_view.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final List<Map<String, String>> mapOnBoarding = [
    {
      'title': 'مرحبًا بك 🖐🏻✨',
      'description1': 'استمتع بحجز رحلتك بسهولة',
      'description2':
          'اختر الرحلة المناسبة لك من بين العديد من الخيارات المتاحة عبر تطبيقنا السهل والمرن.',
    },
    {
      'title': 'نتابع رحلتك خطوة بخطوة ✨',
      'description1': 'سلاسة في التنقل وتتبع مسارك بكل دقة!',
      'description2': 'هدفنا أن نوفر لك رحلة مريحة ومتابعة دقيقة لحجزك وموقعك.',
    },
    {
      'title': 'راحة وخدمات مميزة ✨',
      'description1': 'راحة وخدمات مميزة..!',
      'description2':
          'احجز بسهولة. واستمتع بأسعار تنافسية وخدمات مريحة تلبي احتياجاتك.',
    },
  ];
  int _currentPage = 0;

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  Widget _buildDot({required int index}) {
    return InkWell(
      onTap: () {
        _pageController.animateToPage(
          index,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.symmetric(horizontal: 4),
        height: 8,
        width: _currentPage == index ? 32 : 8,
        decoration: BoxDecoration(
          color: _currentPage == index ? ColorsApp.primaryColor : Colors.grey,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 553,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(20)),
                  image: DecorationImage(
                    image: AssetImage('assets/images/on_boarding_image.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 553,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                  gradient: LinearGradient(colors: [
                    ColorsApp.primaryColor.withOpacity(0.1),
                    ColorsApp.primaryColor,
                  ], stops: [
                    0.3,
                    1
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                ),
              ),
              Positioned(
                left: 16,
                // bottom: 50,
                top: 307,
                right: 16,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 35,
                          offset: Offset(0, 10)),
                    ],
                    color: ColorsApp.whiteColor,
                  ),
                  width: double.infinity,
                  height: 339,
                  child: PageView.builder(
                    onPageChanged: _onPageChanged,
                    controller: _pageController,
                    itemCount: mapOnBoarding.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 64),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    mapOnBoarding[index]['title'].toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 24,
                                  ),
                                  Text(
                                    mapOnBoarding[index]['description1']
                                        .toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    mapOnBoarding[index]['description2']
                                        .toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            if (_currentPage != 2)
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      _pageController.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.linear,
                                      );
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 148,
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: ColorsApp.primaryColor,
                                        borderRadius: BorderRadius.circular(48),
                                      ),
                                      child: Text(
                                        'التالي',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: ColorsApp.whiteColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      _pageController.animateToPage(
                                        2,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.linear,
                                      );
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Color(0xffB3B5CC),
                                        ),
                                        borderRadius: BorderRadius.circular(48),
                                      ),
                                      width: 148,
                                      height: 48,
                                      child: Text(
                                        'تخطي',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xffB3B5CC),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            else
                              Center(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CreatAccountView()));
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 297,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: ColorsApp.primaryColor,
                                      borderRadius: BorderRadius.circular(48),
                                    ),
                                    child: Text(
                                      'لنبدأ الأن',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: ColorsApp.whiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 125,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(mapOnBoarding.length, (index) {
              return _buildDot(index: index);
            }),
          ),
        ],
      ),
    );
  }
}
