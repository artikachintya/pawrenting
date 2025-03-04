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
    required this.location,
    required this.id,
    required this.uid,
    required this.items,
    required this.date,
    required this.status,
    required this.totalPrice,
    required this.payment,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uid': uid,
      'items': items.map((item) => item.toJson()).toList(),
      'date': date.toIso8601String(),
      'status': status,
      'totalPrice': totalPrice,
      'payment': payment,
      'delivery': delivery.toJson(),
      'location': location.toJson(),
    };
  }

factory OrderModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document) {
  final data = document.data();
  try {
    return OrderModel(
      id: data?['id'] ?? '',
      uid: data?['uid'] ?? '',
      items: (data?['items'] as List<dynamic>?)
              ?.map((item) => CartItemModel.fromJson(item))
              .toList() ??
          [],
      date: _parseDate(data?['date']), // Use helper function
      status: data?['status'] ?? '',
      totalPrice: (data?['totalPrice'] ?? 0.0).toDouble(),
      payment: data?['payment'] ?? '',
      delivery: DeliveryModel.fromJson(data?['delivery'] ?? {}),
      location: LocationModel.fromJson(data?['location'] ?? {}),
    );
  } catch (e) {
    throw Exception('Error parsing order data: $e');
  }
}

// Helper function to handle different date formats
static DateTime _parseDate(dynamic date) {
  if (date == null) return DateTime.now(); // Default if null
  try {
    if (date is String) {
      return DateTime.parse(date); // Parse from string
    } else if (date is Timestamp) {
      return date.toDate(); // Convert Firestore timestamp to DateTime
    }
  } catch (e) {
    print("Failed to parse date: $date, Error: $e");
  }
  return DateTime.now(); // Fallback in case of error
}
}
