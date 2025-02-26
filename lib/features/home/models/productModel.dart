import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final int id;
  final String name;
  final double price;
  final int categoryId;
  final String description;
  final String image;
  final double salePrice;
  final double discount;
  final int stock;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.categoryId,
    required this.description,
    required this.image,
    required this.salePrice,
    required this.discount,
    required this.stock,
  });

  toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'categoryId': categoryId,
      'description': description,
      'image': image,
      'salePrice': salePrice,
      'discount': discount,
      'stock': stock,
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      price: json['price'] ?? 0.0,
      categoryId: json['categoryId'] ?? 0,
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      salePrice: json['salePrice'] ?? 0.0,
      discount: json['discount'] ?? 0.0,
      stock: json['stock'] ?? 0,
    );
  }
  
  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return ProductModel(
      id: data?['id'] ?? 0,
      name: data?['name'] ?? '',
      price: data?['price'] ?? 0.0,
      categoryId: data?['categoryId'] ?? 0,
      description: data?['description'] ?? '',
      image: data?['image'] ?? '',
      salePrice: data?['salePrice'] ?? 0.0,
      discount: data?['discount'] ?? 0.0,
      stock: data?['stock'] ?? 0,
    );
  }
}
