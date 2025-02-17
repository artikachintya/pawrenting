import 'package:get/get.dart';

class PetActivityController extends GetxController {
  var category = 0.obs;

  void selectCategory(int index) {
    category.value = index;
  }
}