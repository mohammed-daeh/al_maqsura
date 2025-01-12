// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, avoid_print

import 'package:almaqsura/colors_app/colors_app.dart';
import 'package:almaqsura/custom_wigets/app_bar/custom_app_bar_normal.dart';
import 'package:almaqsura/custom_wigets/dotted_line/dotted_arrow_vertical2.dart';
import 'package:almaqsura/custom_wigets/text_field/custom_text_field_add_trip.dart';
import 'package:almaqsura/futuers/app_driver/controllar/d_form_add_trip_controllar.dart';
import 'package:almaqsura/futuers/app_driver/view/d_home/d_add_trip_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddTripDriverView extends StatefulWidget {
  final int? id; // id يمكن أن يكون null في حالة إضافة رحلة جديدة
  final String departurePlace;
  final String destination;
  final String tripDate;
  final String departureTime;
  final String arrivalTime;
  final String seats;
  final String seatCost;

  const AddTripDriverView({
    super.key,
    this.id, // في حالة التعديل، سيتم تمرير id
    this.departurePlace = "", // القيم الافتراضية في حالة إضافة
    this.destination = "",
    this.tripDate = "",
    this.departureTime = "",
    this.arrivalTime = "",
    this.seats = "",
    this.seatCost = "",
  });

  @override
  State<AddTripDriverView> createState() => _AddTripDriverViewState();
}

class _AddTripDriverViewState extends State<AddTripDriverView> {
  final _departurePlaceController = TextEditingController();
  final _destinationController = TextEditingController();
  final _tripDateController = TextEditingController();
  final _departureTimeController = TextEditingController();
  final _arrivalTimeController = TextEditingController();
  final _seatsController = TextEditingController();
  final _seatCostController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  TripController tripController = Get.put(TripController());

  @override
  void initState() {
    super.initState();

    // إذا كان id موجودًا، نقوم بالبحث عن الرحلة في قائمة الرحلات
    if (widget.id != null) {
      // ابحث عن الرحلة باستخدام الـ id
      var trip = tripController.trips.firstWhere(
        (trip) => trip.id == widget.id,
        // orElse: () => null, // في حالة عدم العثور على الرحلة
      );

      // إذا وجدنا الرحلة، نقوم بملء الحقول بالقيم الخاصة بها
      _departurePlaceController.text = trip.departurePlace;
      _destinationController.text = trip.destination;
      _tripDateController.text =
          trip.tripDate.toString(); // تأكد من تنسيق التاريخ بشكل صحيح
      _departureTimeController.text = trip.departureTime;
      _arrivalTimeController.text = trip.arrivalTime;
      _seatsController.text = trip.seats;
      _seatCostController.text = trip.seatCost;
    }
  }

  @override
  Widget build(BuildContext context) {
    final tripController = Get.put(TripController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBarNormal(
                name: widget.id == null ? 'إضافة رحلة' : 'تعديل رحلة',
                color: ColorsApp.whiteColor),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'بيانات الرحلة',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(6),
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorsApp.greenWithAlpha),
                                child: SvgPicture.asset(
                                  'assets/icons/location_background.svg',
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              CustomPaint(
                                size: Size(0, 30),
                                painter: DottedArrowPainterVertical(),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                padding: EdgeInsets.all(6),
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorsApp.greenWithAlpha),
                                child: SvgPicture.asset(
                                  'assets/icons/location_background2.svg',
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 93,
                            child: Column(
                              children: [
                                CustomTextFfieldAddTrip(
                                  hintText: 'مكان الانطلاق',
                                  controller: _departurePlaceController,
                                  // focusNode: _destinationFocusNode,
                                  // focusNode: FocusNode(),
                                  validator: (value) =>
                                      value!.isEmpty ? 'هذا الحقل مطلوب' : null,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                CustomTextFfieldAddTrip(
                                  hintText: 'الوجهة',
                                  controller: _destinationController,
                                  // focusNode: _seatCostFocusNode,
                                  // focusNode: FocusNode(),
                                  validator: (value) =>
                                      value!.isEmpty ? 'هذا الحقل مطلوب' : null,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextFfieldAddTrip(
                      pathIcon: 'assets/icons/date2.svg',
                      hintText: 'تاريخ الرحلة',
                      controller: _tripDateController,
                      // focusNode: _tripDateFocusNode,
                      // focusNode: FocusNode(),
                      keyboardType: TextInputType.datetime,
                      onTap: () async {
                        // FocusScope.of(context).requestFocus(FocusNode());

                        DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (selectedDate != null) {
                          DateTime tripDate = DateTime(selectedDate.year,
                              selectedDate.month, selectedDate.day);

                          _tripDateController.text =
                              DateFormat('yyyy-MM-dd').format(tripDate);
                        }
                        // print(selectedDate);
                      },
                      readOnly: true,
                      validator: (value) =>
                          value!.isEmpty ? 'هذا احقل مطلوب' : null,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextFfieldAddTrip(
                      pathIcon: 'assets/icons/time_go.svg',
                      hintText: 'وقت الانطلاق',
                      controller: _departureTimeController,
                      // focusNode: _departureTimeFocusNode,
                      // focusNode: FocusNode(),
                      validator: (value) =>
                          value!.isEmpty ? 'هذا احقل مطلوب' : null,
                      keyboardType: TextInputType.datetime,
                      onTap: () async {
                        // FocusScope.of(context)
                        // .requestFocus(FocusNode()); // إغلاق الكيبورد

                        TimeOfDay? selectedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (selectedTime != null) {
                          _departureTimeController.text =
                              selectedTime.format(context);
                          // FocusScope.of(context)
                          //     .requestFocus(_arrivalTimeFocusNode);
                        }
                      },
                      // readOnly: true,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextFfieldAddTrip(
                      pathIcon: 'assets/icons/time_arrived.svg',
                      hintText: 'وقت الوصول',
                      controller: _arrivalTimeController,
                      // focusNode: _arrivalTimeFocusNode,
                      // focusNode: FocusNode(),
                      onTap: () async {
                        // FocusScope.of(context).requestFocus(FocusNode());

                        TimeOfDay? selectedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (selectedTime != null) {
                          _arrivalTimeController.text =
                              selectedTime.format(context);
                          // FocusScope.of(context).requestFocus(_seatsFocusNode);
                        }
                      },
                      // readOnly: true,
                      validator: (value) =>
                          value!.isEmpty ? 'هذا الحقل مطلوب' : null,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextFfieldAddTrip(
                      pathIcon: 'assets/icons/seat.svg',
                      hintText: 'عدد المقاعد',
                      controller: _seatsController,
                      // focusNode: _seatsFocusNode,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'هذا الحقل مطلوب';
                        }
                        final parsedValue = int.tryParse(value);
                        if (parsedValue == null) {
                          return 'الرجاء إدخال عدد صحيح';
                        }
                        return null;
                      },

                      // focusNode: FocusNode(),
                      // validator: (value) =>
                      //     value!.isEmpty ? 'هذا الحقل مطلوب' : null,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextFfieldAddTrip(
                      pathIcon: 'assets/icons/dollar_gray.svg',
                      hintText: 'تكلفة المقعد',
                      controller: _seatCostController,
                      // focusNode: _seatCostFocusNode,

                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'هذا الحقل مطلوب';
                        }
                        final parsedValue = double.tryParse(value);
                        if (parsedValue == null) {
                          return 'الرجاء إدخال عدد صحيح';
                        }
                        return null;
                      },

                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 56,
                    ),
                    InkWell(
                      onTap: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          String tripDateString = _tripDateController.text;

                          try {
                            DateTime tripDate = DateTime.parse(tripDateString);
                            // tripDate = DateTime(
                            //     tripDate.year, tripDate.month, tripDate.day);

                            // DateTime dateOnly = DateTime(tripDate.year,
                            //     tripDate.month, tripDate.day); // نتجاهل الوقت

                            // tripDate = DateTime(tripDate.year, tripDate.month,
                            //     tripDate.day, 0, 0, 0);

                            if (widget.id != null) {
                              // حالة التعديل
                              var updatedTrip = Trip(
                                id: widget
                                    .id!, // نستخدم id الموجود لتعديل الرحلة
                                departurePlace: _departurePlaceController.text,
                                destination: _destinationController.text,
                                tripDate: tripDate,
                                departureTime: _departureTimeController.text,
                                arrivalTime: _arrivalTimeController.text,
                                seats: _seatsController.text,
                                seatCost: _seatCostController.text,
                              );

                              tripController.updateTrip(updatedTrip);

                              Navigator.pop(context); // العودة بعد التعديل
                            } else {
                              // String tripDateStringd = _tripDateController.text;

                              // حالة الإضافة
                              var newTrip = Trip(
                                id: tripController.trips.length + 1,
                                departurePlace: _departurePlaceController.text,
                                destination: _destinationController.text,
                                tripDate: tripDate,
                                departureTime: _departureTimeController.text,
                                arrivalTime: _arrivalTimeController.text,
                                seats: _seatsController.text,
                                seatCost: _seatCostController.text,
                              );

                              // tripController.addTrip(newTrip);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      AddTripDetailsView(trip: newTrip),
                                ),
                              );
                            }
                          } catch (e) {
                            print("حدث خطأ: $e");
                          }
                        }
                      },
                      child: Container(
                        height: 56,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: ColorsApp.primaryColor,
                          borderRadius: BorderRadius.circular(47),
                        ),
                        child: Text(
                          widget.id == null ? 'إضافة الرحلة' : 'تعديل الرحلة',
                          style: TextStyle(
                            color: ColorsApp.whiteColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

// import 'package:almaqsura/colors_app/colors_app.dart';
// import 'package:almaqsura/custom_wigets/app_bar/custom_app_bar_normal.dart';
// import 'package:almaqsura/custom_wigets/dotted_line/dotted_arrow_vertical2.dart';
// import 'package:almaqsura/custom_wigets/text_field/custom_text_field_add_trip.dart';
// import 'package:almaqsura/futuers/app_driver/controllar/d_form_add_trip_controllar.dart';
// import 'package:almaqsura/futuers/app_driver/view/d_home/d_add_trip_details_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';

// class AddTripDriverView extends StatefulWidget {
//   final int?
//       id; // هنا جعلنا id يمكن أن يكون null، لأنه في حالة الإضافة لن نمرر id
//   final String departurePlace;
//   final String destination;
//   final String tripDate;
//   final String departureTime;
//   final String arrivalTime;
//   // final String day;
//   // final String monthName;
//   final String seats;
//   final String seatCost;

//   AddTripDriverView({
//     super.key,
//     this.id, // id اختياري في حالة الإضافة
//     this.departurePlace = "", // القيم الافتراضية للإضافة
//     this.destination = "",
//     this.tripDate = "",
//     this.departureTime = "",
//     this.arrivalTime = "",
//     // this.day = '',
//     // this.monthName = '',
//     this.seats = '',
//     this.seatCost = '',
//   });

//   @override
//   State<AddTripDriverView> createState() => _AddTripDriverViewState();
// }

// class _AddTripDriverViewState extends State<AddTripDriverView> {
//   final _departurePlaceController = TextEditingController();

//   final _destinationController = TextEditingController();

//   final _tripDateController = TextEditingController();

//   final _departureTimeController = TextEditingController();

//   final _arrivalTimeController = TextEditingController();

//   final _seatsController = TextEditingController();

//   final _seatCostController = TextEditingController();

//   final _formKey = GlobalKey<FormState>();
//     final tripController = Get.put(TripController());

//   @override
//   void initState() {
//     super.initState();

//     // إذا كان id غير موجود، فهذا يعني أننا في وضع الإضافة
//     if (widget.id != null) {
//       // إذا كان لدينا بيانات، نقوم بتعبئة الحقول
//       _departurePlaceController.text = widget.departurePlace;
//       _destinationController.text = widget.destination;
//       _tripDateController.text = widget.tripDate;
//       _departureTimeController.text = widget.departureTime;
//       _arrivalTimeController.text = widget.arrivalTime;
//       _arrivalTimeController.text = widget.arrivalTime;
//       _seatsController.text = widget.seats; // تعبئة عدد المقاعد
//       _seatCostController.text = widget.seatCost; // تعبئة تكلفة المقعد    }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final tripController = Get.put(TripController());
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             CustomAppBarNormal(
//                 name: widget.id == null ? 'إضافة رحلة' : 'تعديل رحلة',
//                 color: ColorsApp.whiteColor),
//             Divider(),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Text(
//                       'بيانات الرحلة',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         top: 8,
//                       ),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Column(
//                             children: [
//                               Container(
//                                 padding: EdgeInsets.all(6),
//                                 width: 35,
//                                 height: 35,
//                                 decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: ColorsApp.greenWithAlpha),
//                                 child: SvgPicture.asset(
//                                   'assets/icons/location_background.svg',
//                                   fit: BoxFit.scaleDown,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 5,
//                               ),
//                               CustomPaint(
//                                 size: Size(0, 30),
//                                 painter: DottedArrowPainterVertical(),
//                               ),
//                               SizedBox(
//                                 height: 5,
//                               ),
//                               Container(
//                                 padding: EdgeInsets.all(6),
//                                 width: 35,
//                                 height: 35,
//                                 decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: ColorsApp.greenWithAlpha),
//                                 child: SvgPicture.asset(
//                                   'assets/icons/location_background2.svg',
//                                   fit: BoxFit.scaleDown,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           SizedBox(
//                             width: MediaQuery.of(context).size.width - 93,
//                             child: Column(
//                               children: [
//                                 CustomTextFfieldAddTrip(
//                                   hintText: 'مكان الانطلاق',
//                                   controller: _departurePlaceController,
//                                   // focusNode: _destinationFocusNode,
//                                   // focusNode: FocusNode(),
//                                   validator: (value) =>
//                                       value!.isEmpty ? 'هذا الحقل مطلوب' : null,
//                                 ),
//                                 SizedBox(
//                                   height: 15,
//                                 ),
//                                 CustomTextFfieldAddTrip(
//                                   hintText: 'الوجهة',
//                                   controller: _destinationController,
//                                   // focusNode: _seatCostFocusNode,
//                                   // focusNode: FocusNode(),
//                                   validator: (value) =>
//                                       value!.isEmpty ? 'هذا الحقل مطلوب' : null,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     CustomTextFfieldAddTrip(
//                       pathIcon: 'assets/icons/date2.svg',
//                       hintText: 'تاريخ الرحلة',
//                       controller: _tripDateController,
//                       // focusNode: _tripDateFocusNode,
//                       // focusNode: FocusNode(),
//                       keyboardType: TextInputType.datetime,
//                       onTap: () async {
//                         // FocusScope.of(context).requestFocus(FocusNode());

//                         DateTime? selectedDate = await showDatePicker(
//                           context: context,
//                           initialDate: DateTime.now(),
//                           firstDate: DateTime(2000),
//                           lastDate: DateTime(2101),
//                         );
//                         if (selectedDate != null) {
//                           DateTime tripDate = DateTime(selectedDate.year,
//                               selectedDate.month, selectedDate.day);

//                           _tripDateController.text =
//                               DateFormat('yyyy-MM-dd').format(tripDate);
//                         }
//                       },
//                       readOnly: true,
//                       validator: (value) =>
//                           value!.isEmpty ? 'هذا احقل مطلوب' : null,
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     CustomTextFfieldAddTrip(
//                       pathIcon: 'assets/icons/time_go.svg',
//                       hintText: 'وقت الانطلاق',
//                       controller: _departureTimeController,
//                       // focusNode: _departureTimeFocusNode,
//                       // focusNode: FocusNode(),
//                       validator: (value) =>
//                           value!.isEmpty ? 'هذا احقل مطلوب' : null,
//                       keyboardType: TextInputType.datetime,
//                       onTap: () async {
//                         // FocusScope.of(context)
//                         // .requestFocus(FocusNode()); // إغلاق الكيبورد

//                         TimeOfDay? selectedTime = await showTimePicker(
//                           context: context,
//                           initialTime: TimeOfDay.now(),
//                         );
//                         if (selectedTime != null) {
//                           _departureTimeController.text =
//                               selectedTime.format(context);
//                           // FocusScope.of(context)
//                           //     .requestFocus(_arrivalTimeFocusNode);
//                         }
//                       },
//                       // readOnly: true,
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     CustomTextFfieldAddTrip(
//                       pathIcon: 'assets/icons/time_arrived.svg',
//                       hintText: 'وقت الوصول',
//                       controller: _arrivalTimeController,
//                       // focusNode: _arrivalTimeFocusNode,
//                       // focusNode: FocusNode(),
//                       onTap: () async {
//                         // FocusScope.of(context).requestFocus(FocusNode());

//                         TimeOfDay? selectedTime = await showTimePicker(
//                           context: context,
//                           initialTime: TimeOfDay.now(),
//                         );
//                         if (selectedTime != null) {
//                           _arrivalTimeController.text =
//                               selectedTime.format(context);
//                           // FocusScope.of(context).requestFocus(_seatsFocusNode);
//                         }
//                       },
//                       // readOnly: true,
//                       validator: (value) =>
//                           value!.isEmpty ? 'هذا الحقل مطلوب' : null,
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     CustomTextFfieldAddTrip(
//                       pathIcon: 'assets/icons/seat.svg',
//                       hintText: 'عدد المقاعد',
//                       controller: _seatsController,
//                       // focusNode: _seatsFocusNode,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'هذا الحقل مطلوب';
//                         }
//                         final parsedValue = int.tryParse(value);
//                         if (parsedValue == null) {
//                           return 'الرجاء إدخال عدد صحيح';
//                         }
//                         return null;
//                       },

//                       // focusNode: FocusNode(),
//                       // validator: (value) =>
//                       //     value!.isEmpty ? 'هذا الحقل مطلوب' : null,
//                       keyboardType: TextInputType.number,
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     CustomTextFfieldAddTrip(
//                       pathIcon: 'assets/icons/dollar_gray.svg',
//                       hintText: 'تكلفة المقعد',
//                       controller: _seatCostController,
//                       // focusNode: _seatCostFocusNode,

//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'هذا الحقل مطلوب';
//                         }
//                         final parsedValue = double.tryParse(value);
//                         if (parsedValue == null) {
//                           return 'الرجاء إدخال عدد صحيح';
//                         }
//                         return null;
//                       },

//                       keyboardType: TextInputType.number,
//                     ),
//                     SizedBox(
//                       height: 56,
//                     ),
//                     InkWell(
//                       onTap: () {
//                         if (_formKey.currentState?.validate() ?? false) {
//                           String tripDateString = _tripDateController.text;

//                           try {
//                             DateTime tripDate = DateTime.parse(tripDateString);
//                             if (widget.id != null) {
//                               // حالة التعديل
//                               var updatedTrip = Trip(
//                                 id: widget
//                                     .id!, // نستخدم id الموجود لتعديل الرحلة
//                                 departurePlace: _departurePlaceController.text,
//                                 destination: _destinationController.text,
//                                 tripDate: tripDate,
//                                 departureTime: _departureTimeController.text,
//                                 arrivalTime: _arrivalTimeController.text,
//                                 seats: _seatsController.text,
//                                 seatCost: _seatCostController.text,
//                               );

//                               tripController.updateTrip(updatedTrip);

//                               Navigator.pop(context); // العودة بعد التعديل
//                             } else {
//                               // حالة الإضافة
//                               var newTrip = Trip(
//                                 id: tripController.trips.length + 1,
//                                 departurePlace: _departurePlaceController.text,
//                                 destination: _destinationController.text,
//                                 tripDate: tripDate,
//                                 departureTime: _departureTimeController.text,
//                                 arrivalTime: _arrivalTimeController.text,
//                                 seats: _seatsController.text,
//                                 seatCost: _seatCostController.text,
//                               );

//                               // tripController.addTrip(newTrip);

//                               Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (_) =>
//                                       AddTripDetailsView(trip: newTrip),
//                                 ),
//                               );
//                             }
//                           } catch (e) {
//                             print("حدث خطأ: $e");
//                           }
//                         }
//                       },
//                       child: Container(
//                         height: 56,
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                           color: ColorsApp.primaryColor,
//                           borderRadius: BorderRadius.circular(47),
//                         ),
//                         child: Text(
//                           widget.id == null ? 'إضافة الرحلة' : 'تعديل الرحلة',
//                           style: TextStyle(
//                             color: ColorsApp.whiteColor,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 25,
//                     )
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

// import 'package:almaqsura/colors_app/colors_app.dart';
// import 'package:almaqsura/custom_wigets/app_bar/custom_app_bar_normal.dart';
// import 'package:almaqsura/custom_wigets/dotted_line/dotted_arrow_vertical2.dart';
// import 'package:almaqsura/custom_wigets/text_field/custom_text_field_add_trip.dart';
// import 'package:almaqsura/futuers/app_driver/controllar/d_form_add_trip_controllar.dart';
// import 'package:almaqsura/futuers/app_driver/view/d_home/d_add_trip_details_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';

// class AddTripDriverView extends StatelessWidget {
//   AddTripDriverView({super.key});

//   final _departurePlaceController = TextEditingController();
//   final _destinationController = TextEditingController();
//   final _tripDateController = TextEditingController();
//   final _departureTimeController = TextEditingController();
//   final _arrivalTimeController = TextEditingController();
//   final _seatsController = TextEditingController();
//   final _seatCostController = TextEditingController();
// // override
// //   void dispose() {
// //     // عند الخروج من الصفحة، تأكد من التخلص من الـ controllers بشكل صحيح
// //     _departurePlaceController.dispose();
// //     _destinationController.dispose();
// //     _tripDateController.dispose();
// //     _departureTimeController.dispose();
// //     _arrivalTimeController.dispose();
// //     _seatsController.dispose();
// //     _seatCostController.dispose();
// //     super.dispose();
// //   }

//   final _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     final tripController = Get.put(TripController());
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             CustomAppBarNormal(name: 'إضافة رحلة', color: ColorsApp.whiteColor),
//             Divider(),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Text(
//                       'بيانات الرحلة',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         top: 8,
//                       ),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Column(
//                             children: [
//                               Container(
//                                 padding: EdgeInsets.all(6),
//                                 width: 35,
//                                 height: 35,
//                                 decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: ColorsApp.greenWithAlpha),
//                                 child: SvgPicture.asset(
//                                   'assets/icons/location_background.svg',
//                                   fit: BoxFit.scaleDown,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 5,
//                               ),
//                               CustomPaint(
//                                 size: Size(0, 30),
//                                 painter: DottedArrowPainterVertical(),
//                               ),
//                               SizedBox(
//                                 height: 5,
//                               ),
//                               Container(
//                                 padding: EdgeInsets.all(6),
//                                 width: 35,
//                                 height: 35,
//                                 decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: ColorsApp.greenWithAlpha),
//                                 child: SvgPicture.asset(
//                                   'assets/icons/location_background2.svg',
//                                   fit: BoxFit.scaleDown,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           SizedBox(
//                             width: MediaQuery.of(context).size.width - 93,
//                             child: Column(
//                               children: [
//                                 CustomTextFfieldAddTrip(
//                                   hintText: 'مكان الانطلاق',
//                                   controller: _departurePlaceController,
//                                   // focusNode: _destinationFocusNode,
//                                   // focusNode: FocusNode(),
//                                   validator: (value) =>
//                                       value!.isEmpty ? 'هذا الحقل مطلوب' : null,
//                                 ),
//                                 SizedBox(
//                                   height: 15,
//                                 ),
//                                 CustomTextFfieldAddTrip(
//                                   hintText: 'الوجهة',
//                                   controller: _destinationController,
//                                   // focusNode: _seatCostFocusNode,
//                                   // focusNode: FocusNode(),
//                                   validator: (value) =>
//                                       value!.isEmpty ? 'هذا الحقل مطلوب' : null,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     CustomTextFfieldAddTrip(
//                       pathIcon: 'assets/icons/date2.svg',
//                       hintText: 'تاريخ الرحلة',
//                       controller: _tripDateController,
//                       // focusNode: _tripDateFocusNode,
//                       // focusNode: FocusNode(),
//                       keyboardType: TextInputType.datetime,
//                       onTap: () async {
//                         // FocusScope.of(context).requestFocus(FocusNode());

//                         DateTime? selectedDate = await showDatePicker(
//                           context: context,
//                           initialDate: DateTime.now(),
//                           firstDate: DateTime(2000),
//                           lastDate: DateTime(2101),
//                         );
//                         if (selectedDate != null) {
//                           DateTime tripDate = DateTime(selectedDate.year,
//                               selectedDate.month, selectedDate.day);

//                           // تعيين التاريخ مع الوقت 00:00:00 في الـ TextEditingController
//                           _tripDateController.text =
//                               DateFormat('yyyy-MM-dd').format(tripDate);

//                           // String formattedDate =
//                           //     DateFormat('yyyy-MM-dd').format(selectedDate);
//                           // _tripDateController.text =
//                           //     formattedDate; // تعيين النص في الـ Controller

//                           // _tripDateController.text =
//                           //     '${selectedDate.toLocal()}'.split(' ')[0];
//                           // FocusScope.of(context)
//                           //     .requestFocus(_departureTimeFocusNode);
//                         }
//                       },
//                       readOnly: true,
//                       validator: (value) =>
//                           value!.isEmpty ? 'هذا احقل مطلوب' : null,
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     CustomTextFfieldAddTrip(
//                       pathIcon: 'assets/icons/time_go.svg',
//                       hintText: 'وقت الانطلاق',
//                       controller: _departureTimeController,
//                       // focusNode: _departureTimeFocusNode,
//                       // focusNode: FocusNode(),
//                       validator: (value) =>
//                           value!.isEmpty ? 'هذا احقل مطلوب' : null,
//                       keyboardType: TextInputType.datetime,
//                       onTap: () async {
//                         // FocusScope.of(context)
//                         // .requestFocus(FocusNode()); // إغلاق الكيبورد

//                         TimeOfDay? selectedTime = await showTimePicker(
//                           context: context,
//                           initialTime: TimeOfDay.now(),
//                         );
//                         if (selectedTime != null) {
//                           _departureTimeController.text =
//                               selectedTime.format(context);
//                           // FocusScope.of(context)
//                           //     .requestFocus(_arrivalTimeFocusNode);
//                         }
//                       },
//                       // readOnly: true,
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     CustomTextFfieldAddTrip(
//                       pathIcon: 'assets/icons/time_arrived.svg',
//                       hintText: 'وقت الوصول',
//                       controller: _arrivalTimeController,
//                       // focusNode: _arrivalTimeFocusNode,
//                       // focusNode: FocusNode(),
//                       onTap: () async {
//                         // FocusScope.of(context).requestFocus(FocusNode());

//                         TimeOfDay? selectedTime = await showTimePicker(
//                           context: context,
//                           initialTime: TimeOfDay.now(),
//                         );
//                         if (selectedTime != null) {
//                           _arrivalTimeController.text =
//                               selectedTime.format(context);
//                           // FocusScope.of(context).requestFocus(_seatsFocusNode);
//                         }
//                       },
//                       // readOnly: true,
//                       validator: (value) =>
//                           value!.isEmpty ? 'هذا الحقل مطلوب' : null,
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     CustomTextFfieldAddTrip(
//                       pathIcon: 'assets/icons/seat.svg',
//                       hintText: 'عدد المقاعد',
//                       controller: _seatsController,
//                       // focusNode: _seatsFocusNode,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'هذا الحقل مطلوب';
//                         }
//                         final parsedValue = int.tryParse(value);
//                         if (parsedValue == null) {
//                           return 'الرجاء إدخال عدد صحيح';
//                         }
//                         return null;
//                       },

//                       // focusNode: FocusNode(),
//                       // validator: (value) =>
//                       //     value!.isEmpty ? 'هذا الحقل مطلوب' : null,
//                       keyboardType: TextInputType.number,
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     CustomTextFfieldAddTrip(
//                       pathIcon: 'assets/icons/dollar_gray.svg',
//                       hintText: 'تكلفة المقعد',
//                       controller: _seatCostController,
//                       // focusNode: _seatCostFocusNode,

//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'هذا الحقل مطلوب';
//                         }
//                         final parsedValue = double.tryParse(value);
//                         if (parsedValue == null) {
//                           return 'الرجاء إدخال عدد صحيح';
//                         }
//                         return null;
//                       },

//                       keyboardType: TextInputType.number,
//                     ),
//                     SizedBox(
//                       height: 56,
//                     ),
//                     InkWell(
//                       onTap: () {
//                         if (_formKey.currentState?.validate() ?? false) {
//                           try {
//                             String tripDateString = _tripDateController.text;

//                             DateTime tripDate = DateTime.parse(
//                                 tripDateString); // تحويل النص إلى تاريخ

//                             var trip = Trip(
//                               id: tripController.trips.length + 1,
//                               departurePlace: _departurePlaceController.text,
//                               destination: _destinationController.text,
//                               tripDate: tripDate,
//                               departureTime: _departureTimeController.text,
//                               arrivalTime: _arrivalTimeController.text,
//                               seats: _seatsController.text,
//                               seatCost: _seatCostController.text,
//                             );

//                             // إضافة الرحلة باستخدام الـ controller
//                             // tripController.addTrip(trip);
                           
//                             Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (_) => AddTripDetailsView(
//                                           trip: trip,
//                                         )));
//                           } catch (e) {
//                             // عرض رسالة الخطأ
//                           }
//                         }
//                       },
//                       child: Container(
//                         height: 56,
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                           color: ColorsApp.primaryColor,
//                           borderRadius: BorderRadius.circular(47),
//                         ),
//                         child: Text(
//                           'إضافة الرحلة',
//                           style: TextStyle(
//                             color: ColorsApp.whiteColor,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 25,
//                     )
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
