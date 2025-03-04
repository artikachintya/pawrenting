import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pawrentingreborn/features/mypets/models/ActivityModel.dart';
import 'package:pawrentingreborn/features/mypets/models/DiaryModel.dart';
import 'package:pawrentingreborn/features/mypets/models/FoodModel.dart';
import 'package:pawrentingreborn/features/mypets/models/VaccineModel.dart';

class PetModel {
  final String breed;
  final String name;
  final DateTime dob;
  final String gender;
  final String type;
  final double height;
  final double weight;
  final String uid;
  final List<ActivityModel> activities;
  final List<FoodModel> foods;
  final List<DiaryModel> diaries;
  List<VaccineModel> vaccines = [];

  PetModel({
    required this.breed,
    required this.name,
    required this.dob,
    required this.gender,
    required this.type,
    required this.height,
    required this.weight,
    required this.uid,
    required this.activities,
    required this.foods,
    required this.diaries,
    List<VaccineModel>? vaccines, // Allow manual setting of vaccines
  }) {
    if (vaccines != null) {
      this.vaccines = vaccines;
    } else {
      // Assign default vaccine list based on pet type
      this.vaccines = type.toLowerCase() == 'cat'
          ? VaccineModel.getCatVaccineList()
          : VaccineModel.getDogVaccineList();
    }
  }
  factory PetModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    try {
      return PetModel(
        breed: data?['breed'] ?? '',
        name: data?['name'] ?? '',
        dob: DateTime.parse(data?['dob'] ?? DateTime.now().toIso8601String()),
        gender: data?['gender'] ?? '',
        type: data?['type'] ?? '',
        height: (data?['height'] ?? 0.0).toDouble(),
        weight: (data?['weight'] ?? 0.0).toDouble(),
        uid: data?['uid'] ?? '',
        activities: (data?['activities'] as List<dynamic>?)
                ?.map((item) => ActivityModel.fromJson(item))
                .toList() ??
            [],
        foods: (data?['foods'] as List<dynamic>?)
                ?.map((item) => FoodModel.fromJson(item))
                .toList() ??
            [],
        diaries: (data?['diaries'] as List<dynamic>?)
                ?.map((item) => DiaryModel.fromJson(item))
                .toList() ??
            [],
        vaccines: (data?['vaccines'] as List<dynamic>?)
                ?.map((item) => VaccineModel.fromJson(item))
                .toList() ??
            [],
      );
    } catch (e) {
      throw Exception('Error parsing pet data: $e');
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'breed': breed,
      'name': name,
      'dob': dob.toIso8601String(),
      'gender': gender,
      'type': type,
      'height': height,
      'weight': weight,
      'uid': uid,
      'activities': activities.map((item) => item.toJson()).toList(),
      'foods': foods.map((item) => item.toJson()).toList(),
      'diaries': diaries.map((item) => item.toJson()).toList(),
      'vaccines': vaccines.map((item) => item.toJson()).toList(),
    };
  }
}
