import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/mypets/models/pet.dart';

class PetController extends GetxController {
  // Observable variable to hold pet data
  final nameController = TextEditingController();
  final typeController = TextEditingController();
  final genderController = TextEditingController();
  final breedController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  
  var pet = Pet(
    name: '',
    type: '',
    gender: '',
    dateOfBirth: DateTime.now(),
    height: 0.0,
    weight: 0.0,
    breed: '',
  ).obs;
  void updatePet({
    String? name,
    String? type,
    String? gender,
    String? breed,
    DateTime? dateOfBirth,
    double? height,
    double? weight,
  }) {
    pet.update((val) {
      val!.name = name ?? val.name;
      val.type = type ?? val.type;
      val.gender = gender ?? val.gender;
      val.breed = breed ?? val.breed;
      val.dateOfBirth = dateOfBirth ?? val.dateOfBirth;
      val.height = height ?? val.height;
      val.weight = weight ?? val.weight;
    });
  }
}