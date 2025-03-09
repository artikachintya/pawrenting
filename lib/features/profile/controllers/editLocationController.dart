import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pawrentingreborn/data/repositories/LocationRepo.dart';
import 'package:pawrentingreborn/features/profile/models/LocationModel.dart';

class EditLocationController extends GetxController {
  // Form key to manage form validation
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Text editing controllers for form fields
  final TextEditingController labelController = TextEditingController();
  final TextEditingController receiverNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController fullAddressController = TextEditingController();

  final LocationRepo locationRepo = Get.put(LocationRepo());

  RxList<LocationModel> userLocations = <LocationModel>[].obs;
  RxBool isLoading = false.obs;

  String? getUserEmail() {
    return FirebaseAuth.instance.currentUser?.email;
  }

  /// 🔹 Fetch user locations from Firestore
  Future<void> fetchUserLocations() async {
    String? email = getUserEmail();
    isLoading.value = true;

    userLocations.clear();
    try {
      if (email != null) {
        print("🔹 Fetching locations for email: $email"); 
        List<LocationModel> locations = await locationRepo.getUserLocations();
        print("📍 Fetched locations: $locations"); 
        userLocations.assignAll(locations);
        update(); 
      } else {
        print("User email is null");
      }
    } catch (e) {
      print("Error fetching locations: $e");
    } finally {
      isLoading.value = false;
    }
  }

  /// 🔹 Update a location at a specific index
  Future<void> updateLocation(int index, LocationModel updatedLocation) async {
    String? email = getUserEmail();
    if (index < 0 || index >= userLocations.length) {
      print("Invalid index");
      return;
    }

    isLoading.value = true;
    try {
      if (email != null) {
        await locationRepo.updateLocation(index, updatedLocation);
        userLocations[index] = updatedLocation; // Update locally
        print("Location updated successfully!");
      }
    } catch (e) {
      print("Error updating location: $e");
    } finally {
      isLoading.value = false;
    }
  }
 
  /// 🔹 Remove a location by index
  Future<void> removeLocation(int index) async {
    String? email = getUserEmail();
    if (index < 0 || index >= userLocations.length) {
      print("Invalid index");
      return;
    }

    isLoading.value = true;
    try {
      if (email != null) {
        await locationRepo.removeLocation(email, index);
        userLocations.removeAt(index); // Remove locally
        print("Location removed successfully!");
      }
    } catch (e) {
      print("Error removing location: $e");
    } finally {
      isLoading.value = false;
    }
  }

  /// 🔹 Save location details
  void saveLocation() {
    String? userEmail = getUserEmail();

    if (userEmail == null) {
      Get.snackbar("Error", "User not logged in!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }

    if (formKey.currentState!.validate()) {
      // Extract user input values
      String label = labelController.text;
      String receiverName = receiverNameController.text;
      String phoneNumber = phoneNumberController.text;
      String fullAddress = fullAddressController.text;

      // Debugging print statements
      print("Label: $label");
      print("Receiver Name: $receiverName");
      print("Phone Number: $phoneNumber");
      print("Full Address: $fullAddress");

      // Show success message
      Get.snackbar("Success", "Location details saved successfully");
    } else {
      Get.snackbar("Error", "Please fill in all fields correctly");
    }
  }

  void printUserData() {
    print("Label: \${labelController.text}");
    print("Receiver's Name: \${receiverNameController.text}");
    print("Phone Number: \${phoneNumberController.text}");
    print("Detail Address: \${fullAddressController.text}");
  }

  @override
  void onClose() {
    labelController.dispose();
    receiverNameController.dispose();
    phoneNumberController.dispose();
    fullAddressController.dispose();
    super.onClose();
  }
}
