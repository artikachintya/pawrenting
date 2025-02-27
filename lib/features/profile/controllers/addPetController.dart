import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddPetController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Text Editing Controllers
  final TextEditingController petNameController = TextEditingController();
  final TextEditingController petBreedsController = TextEditingController();
  final TextEditingController petGenderController = TextEditingController();
  final TextEditingController petDateOfBirthController = TextEditingController();
  final TextEditingController petWeightController = TextEditingController();
  final TextEditingController petHeightController = TextEditingController();
  final TextEditingController petImageController = TextEditingController();
  final TextEditingController petSpeciesController = TextEditingController();

  // Firestore instance
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Method to save pet data to Firebase
  void savePet(String userId) async {
    if (formKey.currentState!.validate()) {
      try {
        await firestore.collection("users").doc(userId).collection("pets").add({
          "name": petNameController.text,
          "breeds": petBreedsController.text,
          "gender": petGenderController.text,
          "date_of_birth": petDateOfBirthController.text,
          "weight": double.tryParse(petWeightController.text) ?? 0.0,
          "height": double.tryParse(petHeightController.text) ?? 0.0,
          "image_url": petImageController.text,
          "species": petSpeciesController.text,
          "created_at": Timestamp.now(),
        });

        Get.snackbar(
          "Success",
          "Pet added successfully!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        clearForm();
      } catch (e) {
        Get.snackbar(
          "Error",
          "Failed to add pet: $e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } else {
      Get.snackbar(
        "Error",
        "Please fill in all required fields correctly",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
  

  // Clear input fields
  void clearForm() {
    petNameController.clear();
    petBreedsController.clear();
    petGenderController.clear();
    petDateOfBirthController.clear();
    petWeightController.clear();
    petHeightController.clear();
    petImageController.clear();
    petSpeciesController.clear();
  }

  // Dispose controllers
  @override
  void onClose() {
    petNameController.dispose();
    petBreedsController.dispose();
    petGenderController.dispose();
    petDateOfBirthController.dispose();
    petWeightController.dispose();
    petHeightController.dispose();
    petImageController.dispose();
    petSpeciesController.dispose();
    super.onClose();
  }
}
