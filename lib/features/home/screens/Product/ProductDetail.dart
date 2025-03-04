import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/home/controllers/CartController.dart';
import 'package:pawrentingreborn/features/home/controllers/CategoryController.dart';
import 'package:pawrentingreborn/features/home/models/productModel.dart';
import 'package:pawrentingreborn/features/home/screens/Cart/Checkout.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/features/profile/screens/orderDetail.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    CategoryController categoryController = Get.find();
    return Scaffold(
      appBar: TAppBar(onMain: true, onPetDetails: false),
      backgroundColor: TColors.primary,
      bottomNavigationBar: Container(
        width: double.maxFinite,
        height: 90,
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => _showBottomSheet(context, "cart", product),
                child: Container(
                  width: 70,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Color(0xffE7DFF6),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ImageIcon(
                      AssetImage(TImages.cart2),
                      color: TColors.accent,
                      size: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () => _showBottomSheet(context, "buy", product),
                child: Container(
                  height: 45,
                  width: 185,
                  decoration: BoxDecoration(
                    color: TColors.accent,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      'Buy Now',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'AlbertSans',
                          letterSpacing: 1),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: ImageIcon(AssetImage(TImages.arrowBackIcon)),
                onPressed: () {
                  Get.back();
                },
              ),
              Center(
                child: Container(
                    height: 270,
                    width: 360,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: TColors.primary.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                      color: TColors.secondary,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                      child: Image(
                        image: AssetImage(product.image),
                        fit: BoxFit.contain,
                      ),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'AlbertSans',
                            letterSpacing: 1)),
                    Text(categoryController.getCategoryName(product.categoryId),
                        style: TextStyle(
                            fontSize: 14,
                            color: TColors.grayFont,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'AlbertSans',
                            letterSpacing: 1)),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        'Rp${product.price.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                        style: TextStyle(
                            fontSize: 16,
                            color: TColors.accent.withOpacity(0.5),
                            fontWeight: FontWeight.w900,
                            fontFamily: 'AlbertSans',
                            letterSpacing: 1,
                            decoration: TextDecoration.lineThrough)),
                    Text(
                        'Rp${product.salePrice.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                        style: TextStyle(
                          fontSize: 20,
                          color: TColors.accent,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'AlbertSans',
                          letterSpacing: 1,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Description',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'AlbertSans',
                            letterSpacing: 1,
                            decoration: TextDecoration.underline)),
                    Text(product.description,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'AlbertSans',
                          letterSpacing: 1,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showBottomSheet(BuildContext context, String type, ProductModel product) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      if (type == "buy") {
        return _buildBuyNowSheet(context, product);
      } else {
        return _buildCartSheet(context, product);
      }
    },
  );
}

Widget _buildBuyNowSheet(BuildContext context, ProductModel product) {
  CategoryController categoryController = Get.find();
  CartController cartController = Get.find();
  return Padding(
    padding: EdgeInsets.only(
      bottom: MediaQuery.of(context).viewInsets.bottom, // Adjusts for keyboard
    ),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      height: 300, // Adjust height as needed
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                  cartController.resetQty();
                },
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                width: 150,
                height: 100,
                child: Image(
                  image: AssetImage(product.image),
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'AlbertSans',
                            letterSpacing: 1)),
                    Text(categoryController.getCategoryName(product.categoryId),
                        style: TextStyle(
                            fontSize: 10,
                            color: TColors.grayFont,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'AlbertSans',
                            letterSpacing: 1)),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        'Rp${product.price.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                        style: TextStyle(
                            fontSize: 14,
                            color: TColors.accent.withOpacity(0.5),
                            fontWeight: FontWeight.w900,
                            fontFamily: 'AlbertSans',
                            letterSpacing: 1,
                            decoration: TextDecoration.lineThrough)),
                    Text(
                        'Rp${product.salePrice.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                        style: TextStyle(
                          fontSize: 16,
                          color: TColors.accent,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'AlbertSans',
                          letterSpacing: 1,
                        )),
                    Text('Stock: ${product.stock}',
                        style: TextStyle(
                          fontSize: 12,
                          color: TColors.grayFont,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'AlbertSans',
                          letterSpacing: 1,
                        )),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.maxFinite,
            height: 1,
            decoration: BoxDecoration(border: Border.all()),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => cartController.subQty(),
                        child: Container(
                          width: 26,
                          height: 23,
                          decoration: BoxDecoration(
                              color: TColors.primary,
                              borderRadius: BorderRadius.circular(5)),
                          child: Icon(
                            Icons.remove,
                            color: TColors.accent,
                          ),
                        ),
                      ),
                      Obx(() => Container(
                          width: 40,
                          height: 30,
                          child: Center(
                            child: Text(
                              cartController.quantity.value.toString(),
                            ),
                          ))),
                      GestureDetector(
                        onTap: () => cartController.addQty(),
                        child: Container(
                          width: 26,
                          height: 23,
                          decoration: BoxDecoration(
                              color: TColors.primary,
                              borderRadius: BorderRadius.circular(5)),
                          child: Icon(
                            Icons.add,
                            color: TColors.accent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.to(OrderDetails(items: cartController.convertToCartItem(product, cartController.quantity).toList(), buyNow: true,)),
                  child: Container(
                    height: 35,
                    width: 150,
                    decoration: BoxDecoration(
                      color: TColors.accent,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        'Buy Now',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'AlbertSans',
                            letterSpacing: 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildCartSheet(BuildContext context, ProductModel product) {
  CartController cartController = Get.find();
  CategoryController categoryController = Get.find();
  return Padding(
    padding: EdgeInsets.only(
      bottom: MediaQuery.of(context).viewInsets.bottom, // Adjusts for keyboard
    ),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      height: 300, // Adjust height as needed
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                  cartController.resetQty();
                },
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                width: 150,
                height: 100,
                child: Image(
                  image: AssetImage(product.image),
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'AlbertSans',
                            letterSpacing: 1)),
                    Text(categoryController.getCategoryName(product.categoryId),
                        style: TextStyle(
                            fontSize: 10,
                            color: TColors.grayFont,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'AlbertSans',
                            letterSpacing: 1)),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        'Rp${product.price.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                        style: TextStyle(
                            fontSize: 14,
                            color: TColors.accent.withOpacity(0.5),
                            fontWeight: FontWeight.w900,
                            fontFamily: 'AlbertSans',
                            letterSpacing: 1,
                            decoration: TextDecoration.lineThrough)),
                    Text(
                        'Rp${product.salePrice.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                        style: TextStyle(
                          fontSize: 16,
                          color: TColors.accent,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'AlbertSans',
                          letterSpacing: 1,
                        )),
                    Text('Stock: ${product.stock}',
                        style: TextStyle(
                          fontSize: 12,
                          color: TColors.grayFont,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'AlbertSans',
                          letterSpacing: 1,
                        )),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.maxFinite,
            height: 1,
            decoration: BoxDecoration(border: Border.all()),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => cartController.subQty(),
                        child: Container(
                          width: 26,
                          height: 23,
                          decoration: BoxDecoration(
                              color: TColors.primary,
                              borderRadius: BorderRadius.circular(5)),
                          child: Icon(
                            Icons.remove,
                            color: TColors.accent,
                          ),
                        ),
                      ),
                      Obx(() => Container(
                          width: 40,
                          height: 30,
                          child: Center(
                            child: Text(
                              cartController.quantity.value.toString(),
                            ),
                          ))),
                      GestureDetector(
                        onTap: () => cartController.addQty(),
                        child: Container(
                          width: 26,
                          height: 23,
                          decoration: BoxDecoration(
                              color: TColors.primary,
                              borderRadius: BorderRadius.circular(5)),
                          child: Icon(
                            Icons.add,
                            color: TColors.accent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    cartController.addToCart(product, cartController.quantity);
                  },
                  child: Container(
                    height: 35,
                    width: 150,
                    decoration: BoxDecoration(
                      color: TColors.primary,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                        child: ImageIcon(
                      AssetImage(TImages.cart2),
                      color: TColors.accent,
                    )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
