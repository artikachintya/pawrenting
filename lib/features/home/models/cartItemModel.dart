// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/home/models/productModel.dart';

class CartItemModel {
  final ProductModel productModel;
  RxInt quantity = 0.obs;
  final bool isChecked;

  CartItemModel({
    required this.productModel,
    required this.quantity,
    required this.isChecked,
  });

    Map<String, dynamic> toJson() {
    return {
      'productModel': productModel.toJson(),
      'quantity': quantity,
      'isChecked': isChecked,
    };
  }
  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productModel: ProductModel.fromJson(json['productModel']),
      quantity: json['quantity'],
      isChecked: json['isChecked'],
    );
  }
}
