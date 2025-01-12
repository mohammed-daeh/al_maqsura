
import 'package:get/get.dart';

class UserBottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  final List<String> iconPathsActive = [
    'assets/icons/home_color.svg',
    'assets/icons/reservations_color.svg',
    'assets/icons/notifications_color.svg',
    'assets/icons/profile_color.svg',
  ];

  final List<String> iconPathsInactive = [
    'assets/icons/home_outlined.svg',
    'assets/icons/reservations_outlined.svg',
    'assets/icons/notifications_outlined.svg',
    'assets/icons/profile_outlined.svg',
  ];

  final List<String> labels = [
    'الرئيسية',
    'الحجوزات',
    'الإشعارات',
    'حسابي',
  ];

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }

  String getActiveIcon(int index) => iconPathsActive[index];
  String getInactiveIcon(int index) => iconPathsInactive[index];
  String getLabel(int index) => labels[index];
}
