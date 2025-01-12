// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, must_be_immutable, prefer_const_constructors_in_immutables, library_private_types_in_public_api

import 'package:almaqsura/colors_app/colors_app.dart';
import 'package:almaqsura/custom_wigets/app_bar/custom_app_bar_normal.dart';
import 'package:almaqsura/custom_wigets/dialog/custom_dialog.dart';
import 'package:almaqsura/futuers/app_user/view/u_home/add_a_new_credit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentView extends StatelessWidget {
  PaymentView({super.key});
  // void _showCustomDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text("عنوان الديالوغ"),
  //         content:
  //             Text("هذا هو نص الديالوغ. يمكنك إضافة المزيد من التفاصيل هنا."),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: Text("إلغاء"),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //               // قم بإضافة أي إجراء هنا.
  //             },
  //             child: Text("موافق"),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // String price = '10';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           SizedBox(
//             width: double.infinity,
//             height: double.infinity,
//           ),
//           Positioned(
//             child: SizedBox(
//               height: 154,
//               child: CustomAppBarNormal(
//                 color: ColorsApp.primaryColor,
//                 width: 316,
//                 spacer: 16,
//                 name: 'طريقة الدفع',
//               ),
//             ),
//           ),
//           Positioned(
//             top: 129,
//             right: 24,
//             left: 24,
//             child: Column(
//               children: [
//                 Container(
//                   padding: EdgeInsets.only(
//                     top: 56,
//                   ),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.white,
//                       boxShadow: [
//                         BoxShadow(
//                             color: Colors.black12,
//                             blurRadius: 35,
//                             offset: Offset(0, 7))
//                       ]),
//                   height: 600,
//                   // width: double.infinity,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         CustomeContainerToPay(),
//                         Container(
//                           padding: EdgeInsets.all(16),
//                           margin: EdgeInsets.only(bottom: 56),
//                           height: 56,
//                           decoration: BoxDecoration(
//                             color: ColorsApp.greenWithAlpha,
//                             borderRadius: BorderRadius.circular(40),
//                           ),
//                           child: InkWell(
//                             onTap: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (_) => AddANewCard()));
//                             },
//                             child: Row(
//                               children: [
//                                 Container(
//                                   width: 24,
//                                   height: 24,
//                                   decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color: ColorsApp.greenLight),
//                                   child: Icon(Icons.add,
//                                       size: 18, color: ColorsApp.primaryColor),
//                                 ),
//                                 SizedBox(
//                                   width: 24,
//                                 ),
//                                 Text(
//                                   'إضافة بطاقة جديدة',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () {
//                             return CustomDialog.confirmPayment(context);
//                           },
//                           child: Container(
//                             alignment: Alignment.center,
//                             height: 56,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(48),
//                               color: ColorsApp.primaryColor,
//                             ),
//                             child: Text(
//                               'التأكيد',
//                               style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.white),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            child: SizedBox(
              height: 154,
              child: CustomAppBarNormal(
                color: ColorsApp.primaryColor,
                width: 316,
                spacer: 16,
                name: 'طريقة الدفع',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 126, left: 24, right: 24),
            child: Container(
              height: 600,
              padding: EdgeInsets.only(top: 56),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 35,
                    offset: Offset(0, 7),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomeContainerToPay(),
                      Container(
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.only(bottom: 56),
                        height: 56,
                        decoration: BoxDecoration(
                          color: ColorsApp.greenWithAlpha,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => AddANewCreditCard()),
                            );
                          },
                          child: Row(
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorsApp.greenLight,
                                ),
                                child: Icon(
                                  Icons.add,
                                  size: 18,
                                  color: ColorsApp.primaryColor,
                                ),
                              ),
                              SizedBox(width: 24),
                              Text(
                                'إضافة بطاقة جديدة',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          return CustomDialog.confirmPayment(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(48),
                            color: ColorsApp.primaryColor,
                          ),
                          child: Text(
                            'التأكيد',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      // Text('data'),
                      // Text('data'),
                      // Text('data'),
                      // Text('data'),
                      // Text('data'),
                      // Text('data'),
                      // Text('data'),
                      // Text('data'),
                      // Text('data'),
                      // Text('data'),
                      SizedBox(
                        height: 10,
                      ),
                      // Text('data')
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomeContainerToPay extends StatefulWidget {
  const CustomeContainerToPay({super.key});

  @override
  _CustomeContainerToPayState createState() => _CustomeContainerToPayState();
}

class _CustomeContainerToPayState extends State<CustomeContainerToPay> {
  int selectedValue = 0;

  final List<String> svgIcons = [
    'assets/icons/paypal.svg',
    'assets/icons/cash.svg',
    'assets/icons/google_pay.svg',
    'assets/icons/credit_card.svg',
  ];
  final List<String> names = [
    'PayPal',
    'الدفع النقدي',
    'Google Pay',
    'طريقة الدفع',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(svgIcons.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedValue = index;
            });
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 24),
            padding: EdgeInsets.only(right: 16),
            alignment: Alignment.center,
            height: 56,
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorsApp.customGryDivider,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  svgIcons[index],
                  width: 24,
                  height: 24,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    names[index],
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
                Transform.scale(
                  scale: 1.2,
                  child: Radio<int>(
                    activeColor: ColorsApp.primaryColor,
                    value: index,
                    groupValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
