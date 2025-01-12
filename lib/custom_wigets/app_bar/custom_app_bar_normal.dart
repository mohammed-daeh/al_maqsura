// // ignore_for_file: prefer_const_constructors

// import 'package:almaqsura/colors_app/colors_app.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class CustomAppBarNormal extends StatelessWidget {
//   final String name;
//   final double? width;

//   const CustomAppBarNormal({
//     required this.name, this.width
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(20),
//           bottomRight: Radius.circular(20),
//         ),
//         color: ColorsApp.primaryColor,
//       ),
//       child: Padding(
//         padding: const EdgeInsets.only(
//           left: 25,
//           right: 25,
//           top: 47,
//         ),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 IconButton(
//                   icon: Icon(
//                     Icons.arrow_back,
//                     size: 32,
//                     color: Colors.white,
//                   ),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//                 Text(
//                   name,
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.white,
//                   ),
//                 ),
//                 Spacer(),
//                 Container(
//                   padding: EdgeInsets.all(8),
//                   width: 40,
//                   height: 40,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     shape: BoxShape.circle,
//                   ),
//                   child: SvgPicture.asset(
//                     'assets/images/logo.svg',
//                     fit: BoxFit.cover,
//                   ),
//                 )
//               ],
//             ),
//             Spacer(),
//             Spacer(),
//             Container(
//               width: width,
//               // width: double.infinity,
//               height: 19,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(20),
//                   topRight: Radius.circular(20),
//                 ),
//                 color: ColorsApp.whiteAlpha,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

// ignore_for_file: prefer_const_constructors

//   // @override
//   // Size get preferredSize => const Size.fromHeight(123);
// }
import 'package:almaqsura/colors_app/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBarNormal extends StatelessWidget {
  final String name;
  final double? width;
  final bool showImage;
  final double? spacer;
  final Color color;

  const CustomAppBarNormal({
    super.key,
    required this.name,
    this.width,
    this.showImage = true,
    this.spacer,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
          top: 47,
        ),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back,
                      size: 32,
                      color:
                          color == Colors.white ? Colors.black : Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      // color: Colors.white,
                      color:
                          color == Colors.white ? Colors.black : Colors.white),
                ),
                Spacer(),
                if (showImage)
                  Container(
                    padding: EdgeInsets.all(8),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      'assets/images/logo.svg',
                      fit: BoxFit.cover,
                    ),
                  ),
              ],
            ),
            SizedBox(height: spacer),
            Container(
              width: width,
              height: 19,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: ColorsApp.whiteAlpha,
              ),
            )
          ],
        ),
      ),
    );
  }
}
