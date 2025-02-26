import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PetFoodController extends GetxController {
  final nameController = TextEditingController();
  final amountController = TextEditingController();
  final timeController = TextEditingController();

  void resetControllers() {
    nameController.clear();
    amountController.clear();
    timeController.clear();
  }
}

