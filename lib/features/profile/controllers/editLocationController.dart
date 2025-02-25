import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditLocationController extends GetxController {
  // Form key to manage form validation
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Text editing controllers for form fields
  final TextEditingController labelController = TextEditingController();
  final TextEditingController receiverNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController fullAddressController = TextEditingController();

  // Method to handle saving location details
  void saveLocation() {
    if (formKey.currentState!.validate()) {
      // Extract user input values
      String label = labelController.text;
      String receiverName = receiverNameController.text;
      String phoneNumber = phoneNumberController.text;
      String fullAddress = fullAddressController.text;

      // For now, just printing the values (can be replaced with API call or local storage logic)
      print("Label: $label");
      print("Receiver Name: $receiverName");
      print("Phone Number: $phoneNumber");
      print("Full Address: $fullAddress");

      // Show success message (You can customize this part)
      Get.snackbar("Success", "Location details saved successfully");
    } else {
      // Show error message if validation fails
      Get.snackbar("Error", "Please fill in all fields correctly");
    }
  }

  
  void printUserData() {
    print("Label: ${labelController.text}");
    print("Receiver's Name: ${receiverNameController.text}");
    print("Phone Number: ${phoneNumberController.text}");
    print("Detail Addres: ${fullAddressController.text}");
  }

  // Dispose controllers when not needed to free memory
  @override
  void onClose() {
    labelController.dispose();
    receiverNameController.dispose();
    phoneNumberController.dispose();
    fullAddressController.dispose();
    super.onClose();
  }
}
