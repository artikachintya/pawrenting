import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/data/repositories/PetRepo.dart';

class AddPetController extends GetxController {
  // static AddPetController get instance => Get.find();
  final petRepo = PetRepo.instance;
  final _auth = FirebaseAuth.instance;

  final nameController = TextEditingController();
  String type = 'Cat';
  String gender = 'Male';
  final dobController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final breedController = TextEditingController();
}
