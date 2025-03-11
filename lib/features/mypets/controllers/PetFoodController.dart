import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pawrentingreborn/data/repositories/PetRepo.dart';
import 'package:pawrentingreborn/features/mypets/controllers/PetController.dart';
import 'package:pawrentingreborn/features/mypets/models/FoodModel.dart';

class PetFoodController extends GetxController {
  static PetFoodController get instance => Get.find();
  PetController petController = Get.find();
  final petRepo = PetRepo.instance;
  RxList<FoodModel> petFoods = <FoodModel>[].obs;
  final nameController = TextEditingController();
  final amountController = TextEditingController();
  final timeController = TextEditingController();

  void resetControllers() {
    nameController.clear();
    amountController.clear();
    timeController.clear();
  }

  void initFood(String petId) {
    petFoods.clear();
    petFoods.assignAll(
        petController.petList.where((pet) => pet.id == petId).first.foods);
  }

  void addFood(String petId) {
    try {
      if (timeController.text.isEmpty) throw Exception("Time is empty");

      DateTime parsedDate = DateFormat.jm().parse(timeController.text);
      DateTime now = DateTime.now();
      DateTime finalDate = DateTime(
          now.year, now.month, now.day, parsedDate.hour, parsedDate.minute);

      FoodModel newFood = FoodModel(
        food: nameController.text,
        amount: double.parse(amountController.text),
        date: finalDate,
      );

      petFoods.add(newFood);
      print(petFoods.length);
      petController.petList
          .where((pet) => pet.id == petId)
          .first
          .foods
          .add(newFood);
      petRepo.updatePet(
          petId, petController.petList.where((pet) => pet.id == petId).first);
      resetControllers();
    } catch (e) {
      Get.snackbar("Error", "Invalid time format. Please select a valid time.");
    }
  }
}
