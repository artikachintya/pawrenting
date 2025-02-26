<<<<<<< HEAD
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/data/repositories/LocationRepo.dart';
import 'package:pawrentingreborn/features/profile/models/LocationModel.dart';
=======
import 'package:flutter/material.dart';
import 'package:get/get.dart';
>>>>>>> c460ae616d91ff4b9bd64bef72fa9de18f34120a

class AddLocationController extends GetxController {
  // Form key for validation
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final TextEditingController labelController = TextEditingController();
  final TextEditingController receiverNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController fullAddressController = TextEditingController();

<<<<<<< HEAD
  //**Get current user's email from Firebase Auth**
  String? getUserEmail() {
    return FirebaseAuth.instance.currentUser?.email;
  }

  // Method to validate and save location
  Future<void> saveLocation() async {
    String? userEmail = getUserEmail();

    if (userEmail == null) {
      Get.snackbar("Error", "User not logged in!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }

    if (formKey.currentState!.validate()) {
      // Perform save operation
      LocationModel newLocation = LocationModel(
        label: labelController.text,
        receiverName: receiverNameController.text,
        phoneNum: phoneNumberController.text,
        fullAddress: fullAddressController.text,
      );
      // ✅ Save location to Firestore
      try {
        LocationRepo locationRepo = LocationRepo();
        await locationRepo.addLocation(userEmail, newLocation);
        Get.snackbar("Success", "Location added successfully!",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);

        clearForm(); // ✅ Clear input fields after saving
      } catch (e) {
        Get.snackbar("Error", "Failed to add location: $e",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
=======
  // Method to validate and save location
  void saveLocation() {
    if (formKey.currentState!.validate()) {
      // Perform save operation
      Get.snackbar(
        "Success",
        "Location added successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
>>>>>>> c460ae616d91ff4b9bd64bef72fa9de18f34120a
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

  void clearForm() {
    labelController.clear();
    receiverNameController.clear();
    phoneNumberController.clear();
    fullAddressController.clear();
  }

  // Dispose controllers when no longer needed
  @override
  void onClose() {
    labelController.dispose();
    receiverNameController.dispose();
    phoneNumberController.dispose();
    fullAddressController.dispose();
    super.onClose();
  }
}
