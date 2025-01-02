
import 'package:get/get.dart';

class WeekDaysController extends GetxController {
  var currentIndex = 0.obs;
  var weekDays = <String>['السبت', 'الأحد', 'الإثنين', 'الثلاثاء', 'الأربعاء', 'الخميس', 'الجمعة'];

  void changeDay(int index) {
    currentIndex.value = index;
  }
}