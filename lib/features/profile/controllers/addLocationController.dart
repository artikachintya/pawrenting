import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddLocationController extends GetxController {
  // Form key for validation
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final TextEditingController labelController = TextEditingController();
  final TextEditingController receiverNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController fullAddressController = TextEditingController();

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
