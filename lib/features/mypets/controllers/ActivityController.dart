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
  RxList<ActivityModel> activities = <ActivityModel>[].obs;
  RxList<ActivityModel> grooming = <ActivityModel>[].obs;
  RxList<ActivityModel> exercise = <ActivityModel>[].obs;
  final petRepo = PetRepo.instance;
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

  void initActivities(String petId) {
    grooming.clear();
    exercise.clear();
    activities.clear();
    activities.assignAll(
        petController.petList.where((pet) => pet.id == petId).first.activities);
    print('act length: ${activities.length}');
    grooming
        .assignAll(activities.where((activity) => activity.type == 'Grooming'));
    exercise
        .assignAll(activities.where((activity) => activity.type == 'Exercise'));
  }

  void selectCategory(int index) {
    category.value = index;
  }

  void clearForm() {
    typeController.clear();
    titleController.clear();
    timeController.clear();
    location.clear();
    super.onClose();
  }

  void addActivity(String petId) {
    ActivityModel newActivity = ActivityModel(
      date: DateFormat("d MMMM yyyy").parse(timeController.text),
      title: titleController.text,
      location: location.text,
      type: typeController.text,
    );
    activities.add(newActivity);
    if (typeController.text == 'Grooming') {
      grooming.add(newActivity);
    } else {
      exercise.add(newActivity);
    }
    print('add activity');
    petController.petList
        .where((pet) => pet.id == petId)
        .first
        .activities
        .add(newActivity);
    petRepo.updatePet(
        petId, petController.petList.where((pet) => pet.id == petId).first);
    clearForm();
  }
}
