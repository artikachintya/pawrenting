import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class EditDataController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final usernameController = TextEditingController();
  final dobController = TextEditingController();
  final phonenumController = TextEditingController();
  final emailController = TextEditingController();

  void printName() {
    print(firstNameController.value);
  }
}
