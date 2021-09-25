import 'package:get/get.dart';

class BottomNavController extends GetxController {
  final _selectedIndex = 0.obs;
  get selectedIndex => _selectedIndex.value;
  set selectedIndex(index) => _selectedIndex.value = index;
  var catIndex = 0.obs;

  var colorIndex = 0.obs;
  var sizeIndex = 0.obs;
}
