import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:pawrentingreborn/data/repositories/PetRepo.dart';
import 'package:pawrentingreborn/features/mypets/controllers/PetController.dart';
import 'package:pawrentingreborn/features/mypets/models/ActivityModel.dart';

class ActivityController extends GetxController {
  static ActivityController get instance => Get.find();
  PetController petController = Get.find();
  List<ActivityModel> activityList = [];
  final petRepo = PetRepo.instance;

  var category = 0.obs;

  final typeController = TextEditingController();
  final titleController = TextEditingController();
  final timeController = TextEditingController();
  final location = TextEditingController();

  void initActivityList(String petId) {
    activityList.clear();
    activityList =
        petController.petList.where((pet) => pet.id == petId).first.activities;
  }

  void resetControllers() {
    typeController.clear();
    titleController.clear();
    timeController.clear();
    location.clear();
  }

  void selectCategory(int index) {
    category.value = index;
  }

  void addActivity(String petId) {
    ActivityModel newActivity = ActivityModel(
      date: DateFormat("d MMMM yyyy").parse(timeController.text),
      title: titleController.text,
      location: location.text,
      type: typeController.text,
    );
    print('anjay');
    petController.petList
        .where((pet) => pet.id == petId)
        .first
        .activities
        .add(newActivity);
    petRepo.updatePet(
        petId, petController.petList.where((pet) => pet.id == petId).first);
  }
}
