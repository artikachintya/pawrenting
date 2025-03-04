import 'package:cloud_firestore/cloud_firestore.dart';

class PetModel {
  final String id;
  final String name;
  final String species;
  final String gender;
  final String breeds;
  final DateTime dateOfBirth;
  final double height;
  final double weight;
  final String image;

  PetModel({
    required this.id,
    required this.name,
    required this.species,
    required this.gender,
    required this.breeds,
    required this.dateOfBirth,
    required this.height,
    required this.weight,
    required this.image,
  });

  toJson(){
    return {
      'id' : id,
      'name' : name,
      'species' : species,
      'height' : height,
      'weight' : weight,
      'gender' : gender,
      'breeds' : breeds,
      'dateOfBirth' : dateOfBirth,
      'image' : image,
    };
  }

  factory PetModel.fromJson(Map<String, dynamic> json){
    return PetModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      species: json['species'] ?? '',
      height: json['height'] ?? 0.0,
      weight: json['weight'] ?? 0.0,
      gender: json['gender'] ?? '', 
      breeds: json['breeds'] ?? '',
      dateOfBirth: json['dateOfBirth'].toDate() ?? DateTime.now(),
      image: json['image'] ?? '',
    );
  }

  factory PetModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data();
    return PetModel(
      id: data?['id'] ?? '',
      name: data?['name'] ?? '',
      species: data?['species'] ?? '',
      height: data?['height'] ?? 0.0,
      weight: data?['weight'] ?? 0.0,
      gender: data?['gender'] ?? '',
      breeds: data?['breeds'] ?? '',
      dateOfBirth: data?['dateOfBirth'].toDate() ?? DateTime.now(),
      image: data?['image'] ?? '',
    );
  }
}