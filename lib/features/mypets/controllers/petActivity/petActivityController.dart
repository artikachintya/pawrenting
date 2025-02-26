import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PetActivityController extends GetxController {
  var category = 0.obs;

  final typeController = TextEditingController();
  final titleController = TextEditingController();
  final timeController = TextEditingController();
  final location = TextEditingController();

  void resetControllers() {
    typeController.clear();
    titleController.clear();
    timeController.clear();
    location.clear();
  }

  void selectCategory(int index) {
    category.value = index;
  }
}
