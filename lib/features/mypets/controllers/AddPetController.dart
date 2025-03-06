import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pawrentingreborn/data/repositories/PetRepo.dart';

class AddPetController extends GetxController {
  // static AddPetController get instance => Get.find();
  final petRepo = PetRepo.instance;
  final _auth = FirebaseAuth.instance;

  final nameController = TextEditingController();
  String type = 'Cat';
  String gender = 'Male';
  final dobController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final breedController = TextEditingController();
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
}
