import 'package:get/get.dart';

class Trip {
  int id;
  String departurePlace;
  String destination;
  DateTime tripDate;
  String departureTime;
  String arrivalTime;
  String seats;
  String seatCost;

  Trip({
    required this.id,
    required this.departurePlace,
    required this.destination,
    required this.tripDate,
    required this.departureTime,
    required this.arrivalTime,
    required this.seats,
    required this.seatCost,
  });
}

class TripController extends GetxController {
  var trips = <Trip>[].obs; // قائمة الرحلات المخزنة
  static int _lastId = 0; // تخزين آخر معرف تم إنشاؤه

  // إضافة رحلة جديدة
  void addTrip(Trip trip) {
    _lastId++; // زيادة الـ ID بمقدار 1
    trip.id = _lastId; // تعيين المعرف الجديد للرحلة
    trips.add(trip);
  }

  // حذف رحلة باستخدام id
  void removeTrip(int id) {
    trips.removeWhere((trip) => trip.id == id);
  }

  // تعديل رحلة باستخدام id
  void updateTrip(Trip updatedTrip) {
    var index = trips.indexWhere((trip) => trip.id == updatedTrip.id);
    if (index != -1) {
      trips[index] = updatedTrip;
    }
  }

  // void printTrips() {
  //   for (var item in trips) {
  //     print('***********Trip ID: ${item.id}');
  //     // print('***********Departure Place: ${item.departurePlace}');
  //     // print('***********Destination: ${item.destination}');
  //     print('***********Trip Date: ${item.tripDate}');
  //     print('***********Departure Time: ${item.departureTime}');
  //     // print('***********Arrival Time: ${item.arrivalTime}');
  //     print('***********Seats: ${item.seats}');
  //     print('***********Seat Cost: ${item.seatCost}');
  //     print('*' * 50);
  //     // print(item);
  //   }
    // print('Trips: $trips');
  // }
}

// TripController tripController = Get.put(TripController());
// tripController.printTrips();


// class TripController extends GetxController {
//   var trips = <Trip>[].obs;

//   // إضافة رحلة جديدة
//   void addTrip(Trip trip) {
//     trips.add(trip);
//   }

//   void removeTrip(Trip trip) {
//     trips.remove(trip);
//   }

//   // تعديل رحلة موجودة
//   void updateTrip(int index, Trip updatedTrip) {
//     trips[index] = updatedTrip;
//   }
// }
