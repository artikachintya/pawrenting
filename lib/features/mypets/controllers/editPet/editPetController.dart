import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPetController extends GetxController {
  // Define your TextEditingController instances here
  final TextEditingController nameController = TextEditingController();
  var species = 'Cat'.obs; // Observable string for species
  var gender = 'Male'.obs; //
  final TextEditingController birthdateController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController breedController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  @override
  void onClose() {
    // Dispose of the TextEditingController instances when the controller is closed
    nameController.dispose();
    birthdateController.dispose();
    weightController.dispose();
    heightController.dispose();
    breedController.dispose();
    super.onClose();
  }

  // Method to update species
  void updateSpecies(String newSpecies) {
    species.value = newSpecies;
  }

  void updateGender(String newGender) {
    gender.value = newGender;
  }
}