import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/data/repositories/UserRepo.dart';
import 'package:pawrentingreborn/features/authentication/model/UserModel.dart';

class EditDataController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final usernameController = TextEditingController();
  final dobController = TextEditingController();
  final phonenumController = TextEditingController();
  final emailController = TextEditingController();

  final _userRepo = Get.put(UserRepo());

  @override
  void onInit() {
    super.onInit();
    fetchUserData(); // Automatically fetch user data when controller is initialized
  }

  Future<void> fetchUserData() async {
    try {
      UserModel? user = await _userRepo.fetchUserByEmail(FirebaseAuth.instance.currentUser!.email!);
      if (user != null) {
        firstNameController.text = user.firstName;
        lastNameController.text = user.lastName;
        usernameController.text = user.username;
        dobController.text = user.dob;
        phonenumController.text = user.phoneNum;
        emailController.text = user.email; 
        update(); // Update UI after setting values
      } else {
        print("User not found");
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }

 Future<void> updateUserData() async {
  try {
    String email = FirebaseAuth.instance.currentUser!.email!;
    UserModel? user = await _userRepo.fetchUserByEmail(email);

    if (user == null) {
      Get.snackbar("Error", "User not found", snackPosition: SnackPosition.BOTTOM);
      return;
    }

    // Use fetched data and only update modified fields
    Map<String, dynamic> updatedData = {};

    if (firstNameController.text != user.firstName) {
      updatedData["firstName"] = firstNameController.text;
    }
    if (lastNameController.text != user.lastName) {
      updatedData["lastName"] = lastNameController.text;
    }
    if (usernameController.text != user.username) {
      updatedData["username"] = usernameController.text;
    }
    if (dobController.text != user.dob) {
      updatedData["dob"] = dobController.text;
    }
    if (phonenumController.text != user.phoneNum) {
      updatedData["phoneNum"] = phonenumController.text;
    }

    if (updatedData.isNotEmpty) {
      await _userRepo.updateUserByEmail(email, updatedData);
      Get.snackbar("Success", "Your data has been updated!", snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar("No Changes", "No changes detected.", snackPosition: SnackPosition.BOTTOM);
    }
  } catch (e) {
    Get.snackbar("Error", "Failed to update data: $e", snackPosition: SnackPosition.BOTTOM);
  }
}





  void printUserData() {
    print("First Name: ${firstNameController.text}");
    print("Last Name: ${lastNameController.text}");
    print("Username: ${usernameController.text}");
    print("Date of Birth: ${dobController.text}");
    print("Phone Number: ${phonenumController.text}");
    print("Email: ${emailController.text}");
  }
}