import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/features/home/controllers/CartController.dart';
import 'package:pawrentingreborn/features/home/controllers/CategoryController.dart';
import 'package:pawrentingreborn/features/home/controllers/OrderController.dart';
import 'package:pawrentingreborn/features/home/models/cartItemModel.dart';
import 'package:pawrentingreborn/features/home/screens/Cart/Checkout.dart';
import 'package:pawrentingreborn/features/home/screens/Product/ProductDetail.dart';
import 'package:pawrentingreborn/features/home/screens/widgets/cartItem.dart';
import 'package:pawrentingreborn/navigationMenu.dart';

import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.find();
    OrderController orderController = Get.find();
    return Obx(() => Scaffold(
          backgroundColor: TColors.primary,
          appBar: TAppBar2(title: 'My Cart', subtitle: 'Check your cart here!'),
          bottomNavigationBar: cartController.noOfCartItems.value != 0
              ? Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          child: Row(
                            children: [
                              Text(
                                'Total Price: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Obx(() => Text(
                                    'Rp${cartController.totalCartPrice.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: TColors.accent),
                                  ))
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Get.to(() => OrderDetails(
                                buyNow: false,
                                items: cartController.getCheckedItems(),
                              )),
                          child: Container(
                            height: 40,
                            width: 140,
                            decoration: BoxDecoration(
                              color: TColors.accent,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                                child: Obx(
                              () => Text(
                                textAlign: TextAlign.center,
                                'Checkout (${cartController.noOfCheckedItems.value})',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'AlbertSans',
                                    letterSpacing: 1),
                              ),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : null,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              child: Center(
                  child: cartController.noOfCartItems.value != 0
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                        onTap: () =>
                                            cartController.toggleSelectAll(),
                                        child: Obx(
                                          () => Container(
                                            height: 17.5,
                                            width: 17.5,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                border: Border.all(
                                                    width: 1.5,
                                                    color: TColors.grayFont)),
                                            child: cartController
                                                    .isAllChecked.value
                                                ? Icon(Icons.check,
                                                    size: 16,
                                                    color: TColors.grayFont)
                                                : null,
                                          ),
                                        )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Select All',
                                      style: TextStyle(
                                          fontFamily: 'Alata',
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GridView.builder(
                                itemCount: cartController.cartItems.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  mainAxisSpacing: 10,
                                  mainAxisExtent: 125,
                                ),
                                itemBuilder: (_, index) => CartItem(
                                  item: cartController.cartItems[index],
                                  index: index,
                                ),
                              )
                            ])
                      : ShopNow()),
            ),
          ),
        ));
  }
}

class ShopNow extends StatelessWidget {
  const ShopNow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height -
            150, // Ensures full height
        child: Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center vertically
            children: [
              Container(
                height: 125,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: TColors.gray,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment:
                      CrossAxisAlignment.center,
                  spacing: 10,
                  children: [
                    Text(
                      'Your cart is empty!',
                      style: TextStyle(
                          fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () => Get.to(NavigationMenu()),
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                            color: TColors.accent,
                            borderRadius:
                                BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            'Shop Now',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Alata'),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}
