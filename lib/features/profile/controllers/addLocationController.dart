import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/data/repositories/LocationRepo.dart';
import 'package:pawrentingreborn/features/profile/controllers/editLocationController.dart';
import 'package:pawrentingreborn/features/home/controllers/LocationController.dart';
import 'package:pawrentingreborn/features/profile/models/LocationModel.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';

class AddLocationController extends GetxController {
  // Form key for validation
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final EditLocationController editLocationController = Get.find<EditLocationController>();


  // Controllers for text fields
  final TextEditingController labelController = TextEditingController();
  final TextEditingController receiverNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController fullAddressController = TextEditingController();

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
        LocationRepo locationRepo = LocationRepo();
        await locationRepo.addLocation(newLocation);
  await editLocationController.fetchUserLocations(); // 🔹 Refresh locations list after saving

        // Get.snackbar("Success", "Location added successfully!",
        //     snackPosition: SnackPosition.BOTTOM,
        //     backgroundColor: TColors.accent,
        //     colorText: Colors.white);

        clearForm(); 
        // ✅ Clear input fields after saving
      
    } else {
      Get.snackbar(
        "Error",
        "Please fill in all required fields correctly",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
    LocationController locationController = Get.find();
    await locationController.fetchLocations();
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
