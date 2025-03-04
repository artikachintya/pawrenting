// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/home/models/productModel.dart';

class CartItemModel {
  final ProductModel productModel;
  RxInt quantity = 0.obs;
  RxBool isChecked;

  CartItemModel({
    required this.productModel,
    required this.quantity,
    required this.isChecked,
  });

  List<CartItemModel> toList() {
    return [this];
  }

  factory CartItemModel.empty() {
    return CartItemModel(
      productModel: ProductModel.empty(),
      quantity: 0.obs,
      isChecked: false.obs,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'productModel': productModel.toJson(),
      'quantity': quantity.value, // Extract int value
      'isChecked': isChecked.value, // Extract bool value
    };
  }

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productModel: ProductModel.fromJson(json['productModel']),
      quantity: RxInt(json['quantity']), // Ensure quantity remains reactive
      isChecked:
          RxBool(json['isChecked'] ?? true), // Wrap isChecked inside RxBool
    );
  }
}
