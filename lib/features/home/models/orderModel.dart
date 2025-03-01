import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pawrentingreborn/features/home/models/cartItemModel.dart';
import 'package:pawrentingreborn/features/home/models/deliveryModel.dart';
import 'package:pawrentingreborn/features/profile/models/LocationModel.dart';

class OrderModel {
  final String id;
  final String uid;
  final List<CartItemModel> items;
  final DateTime date;
  final String status;
  final double totalPrice;
  final String payment;
  final DeliveryModel delivery;
  final LocationModel location;

  OrderModel({
    required this.delivery,
    required this.id,
    required this.uid,
    required this.items,
    required this.date,
    required this.status,
    required this.totalPrice,
    required this.payment,
    required this.location,
  });

  toJson() {
    return {
      'id': id,
      'uid': uid,
      'items': items.map((item) => item.toJson()).toList(),
      'date': date.toIso8601String(),
      'status': status,
      'totalPrice': totalPrice,
      'payment': payment,
      'location': location.toJson(),
    };
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] ?? '',
      uid: json['uid'] ?? '',
      items: (json['items'] as List<dynamic>)
          .map((item) => CartItemModel.fromJson(item))
          .toList(),
      date: DateTime.parse(json['date'] ?? DateTime.now().toIso8601String()),
      status: json['status'] ?? '',
      totalPrice: (json['totalPrice'] ?? 0.0).toDouble(),
      payment: json['payment'] ?? '',
      delivery: DeliveryModel.fromJson(json['delivery'] ?? {}),
      location: LocationModel.fromJson(json['location'] ?? {}),
    );
  }

  factory OrderModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return OrderModel(
      id: data?['id'] ?? '',
      uid: data?['uid'] ?? '',
      items: (data?['items'] as List<dynamic>?)
              ?.map((item) => CartItemModel.fromJson(item))
              .toList() ??
          [],
      date: DateTime.parse(data?['date'] ?? DateTime.now().toIso8601String()),
      status: data?['status'] ?? '',
      totalPrice: (data?['totalPrice'] ?? 0.0).toDouble(),
      payment: data?['payment'] ?? '',
      delivery: DeliveryModel.fromJson(data?['delivery'] ?? {}),
      location: LocationModel.fromJson(data?['location'] ?? {}),
    );
  }
}
