import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:pawrentingreborn/data/repositories/PetRepo.dart';
import 'package:pawrentingreborn/features/mypets/controllers/PetController.dart';
import 'package:pawrentingreborn/features/mypets/models/PetModel.dart';
import 'package:pawrentingreborn/features/mypets/models/VaccineModel.dart';

class AddPetController extends GetxController {
  // static AddPetController get instance => Get.find();
  final petRepo = PetRepo.instance;
  final _auth = FirebaseAuth.instance;
  PetController petController = Get.find();

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

  void addPet() async {
    final user = _auth.currentUser;
    if (user != null) {
      final id =
          '${user.uid}_${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}';
      final pet = PetModel(
        id: id,
        name: nameController.text,
        type: type,
        gender: gender,
        dob: DateFormat("d MMMM yyyy").parse(dobController.text),
        weight: double.tryParse(weightController.text) ?? 0.0,
        height: double.tryParse(heightController.text) ?? 0.0,
        breed: breedController.text,
        image: base64Image.value,
        uid: user.uid,
        vaccines: type.toLowerCase() == 'cat'
            ? VaccineModel.getCatVaccineList()
            : VaccineModel.getDogVaccineList(),
      );
      print('controller lancar');
      await petRepo.createPet(pet);
      petController.fetchUserPets();
    }
  }

  void resetController() {
    nameController.clear();
    type = 'Cat';
    gender = 'Male';
    dobController.clear();
    weightController.clear();
    heightController.clear();
    breedController.clear();
    imageFile.value = null;
    base64Image.value = '';
  }
}
