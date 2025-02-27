import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditDataController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final usernameController = TextEditingController();
  final dobController = TextEditingController();
  final phonenumController = TextEditingController();
  final emailController = TextEditingController();

  void printUserData() {
    print("First Name: ${firstNameController.text}");
    print("Last Name: ${lastNameController.text}");
    print("Username: ${usernameController.text}");
    print("Date of Birth: ${dobController.text}");
    print("Phone Number: ${phonenumController.text}");
    print("Email: ${emailController.text}");
  }
}
