// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:almaqsura/colors_app/colors_app.dart';
import 'package:almaqsura/custom_wigets/app_bar/custom_app_bar_normal.dart';

class DriverNotificationView extends StatelessWidget {
  const DriverNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarNormal(
          spacer: 9,
          name: 'الإشعارات',
          color: ColorsApp.primaryColor,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 17, right: 24, left: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'اليوم',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              // استدعاء NotificationCard وتمرير البيانات
              NotificationCard(
                title: 'رحلتك جاهزة للانطلاق!',
                subtitle: 'تأكد من جاهزيتك واستعد لتجربة سفر مريحة وآمنة.',
                time: 'منذ 3 دقيقة',
              ),
              NotificationCard(
                title: 'رحلتك جاهزة للانطلاق!',
                subtitle: 'تأكد من جاهزيتك واستعد لتجربة سفر مريحة وآمنة.',
                time: 'منذ 3 دقيقة',
              ),
              NotificationCard(
                title: 'رحلتك جاهزة للانطلاق!',
                subtitle: 'تأكد من جاهزيتك واستعد لتجربة سفر مريحة وآمنة.',
                time: 'منذ 3 دقيقة',
              ),
              NotificationCard(
                title: 'رحلتك جاهزة للانطلاق!',
                subtitle: 'تأكد من جاهزيتك واستعد لتجربة سفر مريحة وآمنة.',
                time: 'منذ 3 دقيقة',
              ),
              // يمكنك إضافة المزيد من الإشعارات هنا
            ],
          ),
        ),
      ],
    );
  }
}

// ويدجت لعرض الكارد
class NotificationCard extends StatelessWidget {
  final String title; // النص الرئيسي
  final String subtitle; // النص الفرعي
  final String time; // الوقت

  const NotificationCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(title), // استخدام النص الرئيسي كمفتاح فريد
      direction: DismissDirection.endToStart, // سحب من اليمين لليسار
      onDismissed: (direction) {
        // عرض حوار تأكيد الحذف
        _deleteNotification(context);
      },
      background: Container(
        padding: EdgeInsets.only(left: 15),
        color: Colors.red, // خلفية حمراء عند السحب
        alignment: Alignment.centerLeft,
        child: Icon(Icons.delete, color: Colors.white), // أيقونة الحذف
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          padding: EdgeInsets.all(16),
          height: 87,
          decoration: BoxDecoration(
            color: ColorsApp.greenWithAlpha,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title, // النص الرئيسي
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  Text(
                    time, // الوقت
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Text(
                subtitle, // النص الفرعي
                style: TextStyle(
                  color: ColorsApp.customGryText,
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // عرض حوار التأكيد عند الحذف
  void _deleteNotification(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('تأكيد الحذف'),
          content: Text('هل أنت متأكد أنك تريد حذف هذه الإشعار؟'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // إغلاق الحوار
              },
              child: Text('إلغاء'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // إغلاق الحوار بعد التأكيد
                // يمكن إضافة منطق الحذف هنا إذا كنت تعمل مع قائمة
              },
              child: Text('تأكيد'),
            ),
          ],
        );
      },
    );
  }
}









// // ignore_for_file: prefer_const_constructors

// import 'package:almaqsura/colors_app/colors_app.dart';
// import 'package:almaqsura/custom_wigets/app_bar/custom_app_bar_normal.dart';
// import 'package:flutter/material.dart';

// class DriverNotificationView extends StatelessWidget {
//   const DriverNotificationView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         CustomAppBarNormal(
//           spacer: 9,
//           name: 'الإشعارات',
//           color: ColorsApp.primaryColor,
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 17, right: 24, left: 24),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'اليوم',
//                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//               ),
//               Container(
//                 padding: EdgeInsets.all(16),
//                 height: 87,
//                 decoration: BoxDecoration(
//                   color: ColorsApp.greenWithAlpha,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           'رحلتك جاهزة للانطلاق!',
//                           style: TextStyle(
//                               fontSize: 12, fontWeight: FontWeight.w500),
//                         ),
//                         Spacer(),
//                         Text(
//                           'منذ 3 دقيقة',
//                           style: TextStyle(
//                               fontSize: 10, fontWeight: FontWeight.w400),
//                         )
//                       ],
//                     ),
//                     Text(
//                       'تأكد من جاهزيتك واستعد لتجربة سفر مريحة وآمنة.',
//                       style: TextStyle(
//                         color: ColorsApp.customGryText,
//                         fontSize: 10,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               // CustomCardReservation()
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
