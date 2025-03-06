import 'package:cloud_firestore/cloud_firestore.dart';

class VoucherModel {
  final String image;
  final String code;
  final String title;
  final int discount;
  final String validUntil; 
  final int minPurchase;

  VoucherModel({
    required this.image,
    required this.code, 
    required this.title, 
    required this.discount, 
    required this.validUntil, 
    required this.minPurchase,
  });

  toJson() {
    return {
      'image':image,
      'code': code, 
      'title': title, 
      'discount': discount, 
      'validUntil': validUntil, 
      'minPurchase': minPurchase,
    };
  }

  factory VoucherModel.fromJson(Map<String, dynamic> json) {
    return VoucherModel(
      image : json['image'],
      code: json['code'], 
      title: json['title'], 
      discount: json['discount'], 
      validUntil: json['validUntil'], 
      minPurchase: json['minPurchase'],
    );
  }
  
  factory VoucherModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return VoucherModel(
      image: data?['image'] ?? '',
      code: data?['code'] ?? '',
      title: data?['title'] ?? '',
      discount: data?['discount'] ?? 0,
      validUntil: data?['validUntil'] ?? '',
      minPurchase: data?['minPurchase'] ?? 0,
    );
  }

} 