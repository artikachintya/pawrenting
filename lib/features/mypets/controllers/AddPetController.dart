import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPetController extends GetxController {
  final nameController = TextEditingController();
  String type = 'Cat';
  String gender = 'Male';
  final dobController = TextEditingController();
  final weightController = TextEditingController();
}
