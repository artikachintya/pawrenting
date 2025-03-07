import 'package:cloud_firestore/cloud_firestore.dart';

class VoucherModel {
  final String image;
  final String code;
  final String title;
  final int maxDiscount;
  final String validUntil; 
  final int minPurchase;
  final int percentage;

  VoucherModel({
    required this.image,
    required this.code, 
    required this.title, 
    required this.maxDiscount, 
    required this.validUntil, 
    required this.minPurchase,
    required this.percentage,
  });

  toJson() {
    return {
      'image':image,
      'code': code, 
      'title': title, 
      'maxDiscount': maxDiscount, 
      'validUntil': validUntil, 
      'minPurchase': minPurchase,
      'percentage': percentage,
    };
  }

  factory VoucherModel.fromJson(Map<String, dynamic> json) {
    return VoucherModel(
      image : json['image'],
      code: json['code'], 
      title: json['title'], 
      maxDiscount: json['discount'], 
      validUntil: json['validUntil'], 
      minPurchase: json['minPurchase'],
      percentage: json['percentage'],
    );
  }
  
  factory VoucherModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return VoucherModel(
      image: data?['image'] ?? '',
      code: data?['code'] ?? '',
      title: data?['title'] ?? '',
      maxDiscount: data?['maxDiscount'] ?? 0,
      validUntil: data?['validUntil'] ?? '',
      minPurchase: data?['minPurchase'] ?? 0,
      percentage: data?['percentage'] ?? 0,
    );
  }

} 