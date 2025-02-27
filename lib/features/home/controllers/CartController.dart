import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pawrentingreborn/data/services/StorageService.dart';
import 'package:pawrentingreborn/features/home/models/cartItemModel.dart';
import 'package:pawrentingreborn/features/home/models/productModel.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  RxInt quantity = 1.obs;
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;

  final storage = LocalStorage.instance();

  void addToCart(ProductModel product, RxInt quantity) {
    productQuantityInCart.value = cartItems
        .where((item) => item.productModel == product)
        .fold(0, (sum, item) => sum + item.quantity.value);
    if (productQuantityInCart.value < 1) {
      cartItems.add(convertToCartItem(product, quantity));
    } else {
      cartItems
          .where((item) => item.productModel == product)
          .first
          .quantity
          .value += quantity.value;
    }
    print('terakhir: ${cartItems.last.quantity.value}');
    updateCartTotal();
    resetQty();
  }

  void addItemQty(int index) {
    print('anjay');
    cartItems[index].quantity += 1;
    updateCartTotal();
  }

  void subItemQty(int index) {
    if (cartItems[index].quantity.value == 1) {
      return;
    }
    cartItems[index].quantity -= 1;
    updateCartTotal();
  }

  void addQty() {
    quantity.value += 1;
  }

  void subQty() {
    if (quantity.value == 1) return;
    quantity.value -= 1;
  }

  void resetQty() {
    quantity.value = 1;
  }

  CartItemModel convertToCartItem(ProductModel product, RxInt quantity) {
    return CartItemModel(
        productModel: product, quantity: quantity, isChecked: true);
  }

  void updateCartTotal() {
    double calculatedTotalPrice = 0.0;
    int calculateNoOfItems = 0;

    for (var item in cartItems) {
      if (item.isChecked) {
        calculatedTotalPrice +=
            (item.productModel.salePrice) * item.quantity.value;
      }
      calculateNoOfItems += item.quantity.value;
    }
    noOfCartItems.value = calculateNoOfItems;
    totalCartPrice.value = calculatedTotalPrice;
    print(totalCartPrice.toString());
    print(noOfCartItems.value.toInt());
  }

  void saveCartItems() {
    final cartItemStrings = cartItems.map((item) => item.toJson()).toList();
    storage.writeData('cartItems', cartItemStrings);
  }

  void loadCartItems() {
    final cartItemStrings = storage.readData<List<dynamic>>('cartItems');
    if (cartItemStrings != null) {
      cartItems.assignAll(cartItemStrings
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
      updateCartTotal();
    }
  }
}
