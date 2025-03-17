import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pawrentingreborn/data/repositories/PetRepo.dart';
import 'package:pawrentingreborn/features/mypets/controllers/PetController.dart';
import 'package:pawrentingreborn/features/mypets/models/DiaryModel.dart';

class DiaryController extends GetxController {
  static DiaryController get instance => Get.find();
  final titleController = TextEditingController(text: 'TITLE');
  final textController = TextEditingController(text: 'Type here...');
  RxList<DiaryModel> diaryList = <DiaryModel>[].obs;
  PetController petController = Get.find();
  final petRepo = PetRepo.instance;
  Rx<File?> imageFile = Rx<File?>(null);
  RxString base64Image = ''.obs;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File file = File(pickedFile.path);

      // Convert image to Base64
      List<int> imageBytes = await file.readAsBytes();
      String base64String = base64Encode(imageBytes);

      // Update reactive variables
      imageFile.value = file;
      base64Image.value = base64String;
    }
  }

  void addDiary(String petId) {
    DiaryModel newDiary = DiaryModel(
      time: DateTime.now(),
      title: titleController.text,
      content: textController.text,
      image: base64Image.value,
    );
    diaryList.add(newDiary);
    petController.petList
        .where((pet) => pet.id == petId)
        .first
        .diaries
        .add(newDiary);
    petRepo.updatePet(
        petId, petController.petList.where((pet) => pet.id == petId).first);
    titleController.clear();
    textController.clear();
    removeImage();
  }

  void removeImage() {
    imageFile.value = null;
    base64Image.value = '';
  }

  void initDiary(String petId) {
    diaryList.clear();
    diaryList.assignAll(
        petController.petList.where((pet) => pet.id == petId).first.diaries);
  }
}
