import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pawrentingreborn/data/repositories/UserRepo.dart';
import 'package:pawrentingreborn/features/authentication/model/UserModel.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';

class EditDataController extends GetxController {
  RxDouble pawpay = 0.0.obs;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final usernameController = TextEditingController();
  final dobController = TextEditingController();
  final phonenumController = TextEditingController();
  final emailController = TextEditingController();

  final _userRepo = Get.put(UserRepo());

  String? profilePic;

  @override
  void onInit() {
    super.onInit();
    fetchUserData(); // Automatically fetch user data when controller is initialized
  }

  Future<void> fetchUserData() async {
    try {
      UserModel? user = await _userRepo
          .fetchUserByEmail(FirebaseAuth.instance.currentUser!.email!);
      if (user != null) {
        pawpay.value = user.pawpay;
        firstNameController.text = user.firstName;
        lastNameController.text = user.lastName;
        usernameController.text = user.username;
        dobController.text = user.dob;
        phonenumController.text = user.phoneNum;
        emailController.text = user.email;
        profilePic = user.profilePic;
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
        Get.snackbar("Error", "User not found",
            snackPosition: SnackPosition.BOTTOM);
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

        fetchUserData();
        update();
        Get.snackbar("Success", "Your data has been updated!",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: TColors.accent,
            colorText: Colors.white);
      } else {
        Get.snackbar("No Changes", "No changes detected.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: TColors.accent,
            colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to update data: $e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  Future<void> updatePawpay(double newPawpay) async {
    try {
      String email = FirebaseAuth.instance.currentUser!.email!;
      UserModel? user = await _userRepo.fetchUserByEmail(email);

      if (user == null) {
        Get.snackbar("Error", "User not found",
            snackPosition: SnackPosition.BOTTOM);
        return;
      }

      await _userRepo.updateUserByEmail(email, {"pawpay": newPawpay});
      pawpay.value = newPawpay;
      update(); // Update UI after setting new pawpay value
    } catch (e) {
      Get.snackbar("Error", "Failed to update pawpay: $e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  Future<void> updateProfilePicture() async {
    try {
      final ImagePicker _imagePicker = ImagePicker();
      XFile? profilePic =
          await _imagePicker.pickImage(source: ImageSource.gallery);
      if (profilePic != null) {
        Uint8List imageBytes = await profilePic.readAsBytes();
        String encodedProfilePic =
            base64Encode(imageBytes); // Convert image to Base64
        String email = FirebaseAuth.instance.currentUser!.email!;
        UserModel? user = await _userRepo.fetchUserByEmail(email);
        await _userRepo
            .updateUserByEmail(email, {"profilePic": encodedProfilePic});

        this.profilePic = encodedProfilePic;
        update(); // Refresh UI

        Get.snackbar("Success", "Profile picture updated!",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: TColors.accent,
            colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to update profile picture: $e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
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

  void subtractPawpay(double amount) async {
    if (amount <= 0) {
      Get.snackbar("Error", "Amount must be greater than zero",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }

    if (pawpay.value < amount) {
      Get.snackbar("Error", "Insufficient pawpay balance",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }
    print(pawpay.value);
    print(amount);

    pawpay.value -= amount;
    update(); // Update UI after subtracting pawpay
    await updatePawpay(pawpay.value);
  }
}
