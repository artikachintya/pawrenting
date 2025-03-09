import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
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
    FoodModel newFood = FoodModel(
      food: nameController.text,
      amount: double.parse(amountController.text),
      date: DateTime.parse(timeController.text),
    );
    petFoods.add(newFood);
    petController.petList
        .where((pet) => pet.id == petId)
        .first
        .foods
        .add(newFood);
    petRepo.updatePet(
        petId, petController.petList.where((pet) => pet.id == petId).first);
    resetControllers();
  }
}

