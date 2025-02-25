import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class CategoryModel {
  final String name;
  final String image;
  final int id;

  CategoryModel({
    required this.name,
    required this.image,
    required this.id,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'],
      image: json['image'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'id': id,
    };
  }

  factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return CategoryModel(
      name: data?['name'] ?? '',
      image: data?['image'] ?? '',
      id: data?['id'],
    );
  }
}
