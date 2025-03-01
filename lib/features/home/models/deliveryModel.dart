import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:intl/intl.dart'; // For date formatting

class DeliveryModel {
  final String name;
  final DateTime eta; // Store estimated delivery date
  final double price;

  DeliveryModel({
    required this.name,
    required this.eta,
    required this.price,
  });

  static List<DeliveryModel> getDeliveryOptions() {
    DateTime now = DateTime.now(); // Get current date

    return [
      DeliveryModel(name: 'Regular', eta: now.add(Duration(days: 5)), price: 15000),
      DeliveryModel(name: 'Cargo', eta: now.add(Duration(days: 3)), price: 30000),
      DeliveryModel(name: 'Next Day', eta: now.add(Duration(days: 1)), price: 50000),
    ];
  }
  factory DeliveryModel.fromJson(Map<String, dynamic> json) {
    return DeliveryModel(
      name: json['name'],
      eta: (json['eta'] as Timestamp).toDate(),
      price: json['price'],
    );
  }
}
