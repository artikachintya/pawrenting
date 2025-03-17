import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pawrentingreborn/data/services/StorageService.dart';
import 'package:pawrentingreborn/features/home/controllers/OrderController.dart';
import 'package:pawrentingreborn/features/home/models/cartItemModel.dart';
import 'package:pawrentingreborn/features/home/models/productModel.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();
  RxInt quantity = 1.obs;
  RxInt noOfCartItems = 0.obs;
  RxInt noOfCheckedItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  var scaleFactor = 1.0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  RxBool get isAllChecked => RxBool(
      cartItems.isNotEmpty && cartItems.every((item) => item.isChecked.value));

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
    cartItems.forEach((item) {
      print(
          'Product: ${item.productModel.name}, Quantity: ${item.quantity.value}');
    });
    scaleFactor.value = 1.2;
    Future.delayed(Duration(milliseconds: 200), () {
      scaleFactor.value = 1.0;
    });
    updateCartTotal();
    resetQty();
  }

  void countCheckedItems() {
    noOfCheckedItems.value =
        cartItems.where((item) => item.isChecked.value).length;
  }

  void toggleSelectAll() {
    bool newValue = !isAllChecked.value;
    for (var item in cartItems) {
      item.isChecked.value = newValue;
    }
    updateCartTotal();
  }

  void toggleCheck(int index) {
    cartItems[index].isChecked.value = !cartItems[index].isChecked.value;
    updateCartTotal();
  }

  void addItemQty(int index) {
    cartItems[index].quantity.value += 1;
    updateCartTotal();
  }

  void subItemQty(int index) {
    if (cartItems[index].quantity.value == 1) {
      Get.dialog(
        Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Remove item from cart?",
                  style: TextStyle(
                    fontFamily: 'Albert Sans',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Cancel Button
                    ElevatedButton(
                      onPressed: () {
                        Get.back(); // Close the dialog
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: TColors.gray,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          fontFamily: 'Alata',
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    // Confirm Button
                    ElevatedButton(
                      onPressed: () {
                        cartItems.removeAt(index);
                        updateCartTotal();
                        Get.back(); // Close the dialog
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: TColors.accent, // Purple color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      child: Text(
                        "Remove",
                        style: TextStyle(
                          fontFamily: 'Alata',
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
      return;
    }

    cartItems[index].quantity.value -= 1;
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
        productModel: product,
        quantity: RxInt(quantity.value),
        isChecked: RxBool(true));
  }

  void updateCartTotal() {
    double calculatedTotalPrice = 0.0;
    int calculateNoOfItems = 0;

    for (var item in cartItems) {
      if (item.isChecked.value) {
        calculatedTotalPrice +=
            (item.productModel.salePrice) * item.quantity.value;
      }
      calculateNoOfItems++;
    }
    countCheckedItems();
    noOfCartItems.value = calculateNoOfItems;
    totalCartPrice.value = calculatedTotalPrice;
    print(totalCartPrice.toString());
    print(noOfCartItems.value.toInt());
    // orderController.updateTotalPrice();
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

  List<CartItemModel> getCheckedItems() {
    return cartItems.where((item) => item.isChecked.value).toList();
  }

  void removeCheckedItems() {
    cartItems.removeWhere((item) => item.isChecked.value);
    updateCartTotal();
  }
}
