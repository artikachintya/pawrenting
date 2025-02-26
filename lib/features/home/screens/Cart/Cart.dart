import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
<<<<<<< HEAD
import 'package:pawrentingreborn/features/home/screens/Cart/Checkout.dart';
=======
import 'package:pawrentingreborn/features/home/controllers/CartController.dart';
import 'package:pawrentingreborn/features/home/controllers/CategoryController.dart';
import 'package:pawrentingreborn/features/home/models/cartItemModel.dart';
import 'package:pawrentingreborn/features/home/screens/Cart/Checkout.dart';
import 'package:pawrentingreborn/features/home/screens/Product/ProductDetail.dart';
>>>>>>> c460ae616d91ff4b9bd64bef72fa9de18f34120a
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
=======
    CartController cartController = Get.find();
>>>>>>> c460ae616d91ff4b9bd64bef72fa9de18f34120a
    return Scaffold(
      backgroundColor: TColors.primary,
      appBar: TAppBar2(title: 'My Cart', subtitle: 'Check your cart here!'),
      bottomNavigationBar: Container(
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
<<<<<<< HEAD
                    Text(
                      'Rp320.000',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: TColors.accent),
                    )
=======
                    Obx(() => Text(
                          'Rp${cartController.totalCartPrice.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: TColors.accent),
                        ))
>>>>>>> c460ae616d91ff4b9bd64bef72fa9de18f34120a
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Get.to(() => OrderDetails()),
                child: Container(
                  height: 40,
                  width: 125,
                  decoration: BoxDecoration(
                    color: TColors.accent,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      'Checkout',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
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
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: Center(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Container(
                      height: 17.5,
                      width: 17.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border:
                              Border.all(width: 1.5, color: TColors.grayFont)),
                      child: Icon(
                        Icons.check,
                        size: 16,
                        color: TColors.accent,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Select All',
                      style: TextStyle(
                          fontFamily: 'Alata', fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GridView.builder(
<<<<<<< HEAD
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 125,
                  ),
                  itemBuilder: (_, index) =>
                      GestureDetector(child: CartItem(), onTap: () {}))
=======
                itemCount: cartController.cartItems.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 125,
                ),
                itemBuilder: (_, index) => CartItem(
                  item: cartController.cartItems[index],
                  index: index,
                ),
              )
>>>>>>> c460ae616d91ff4b9bd64bef72fa9de18f34120a
            ]),
          ),
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
<<<<<<< HEAD
  const CartItem({
    super.key,
=======
  final CartItemModel item;
  final int index;
  const CartItem({
    super.key,
    required this.item,
    required this.index,
>>>>>>> c460ae616d91ff4b9bd64bef72fa9de18f34120a
  });

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
=======
    CartController cartController = Get.find();
    CategoryController categoryController = Get.find();
>>>>>>> c460ae616d91ff4b9bd64bef72fa9de18f34120a
    return Container(
      height: 125,
      decoration: BoxDecoration(
          border: Border.all(width: 0.8, color: TColors.accent),
          color: TColors.gray,
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        child: Row(
          children: [
<<<<<<< HEAD
            Container(
              height: 17.5,
              width: 17.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(width: 1.5, color: TColors.grayFont)),
              child: Icon(
                Icons.check,
                size: 16,
                color: TColors.accent,
=======
            GestureDetector(
              // onTap: () => Get.to(ProductDetail(product: item.productModel)),
              child: Container(
                height: 17.5,
                width: 17.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(width: 1.5, color: TColors.grayFont)),
                child: Icon(
                  Icons.check,
                  size: 16,
                  color: TColors.accent,
                ),
>>>>>>> c460ae616d91ff4b9bd64bef72fa9de18f34120a
              ),
            ),
            SizedBox(
              width: 12,
            ),
<<<<<<< HEAD
            Container(
              width: 90,
              height: 90,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Image.asset(TImages.catFood),
=======
            GestureDetector(
              onTap: () => Get.to(ProductDetail(product: item.productModel)),
              child: Container(
                width: 90,
                height: 90,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Image.asset(item.productModel.image),
              ),
>>>>>>> c460ae616d91ff4b9bd64bef72fa9de18f34120a
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
<<<<<<< HEAD
                    'Rawrawr Beef & Mackerel Freeze Dried Raw Diet',
=======
                    item.productModel.name,
>>>>>>> c460ae616d91ff4b9bd64bef72fa9de18f34120a
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
<<<<<<< HEAD
                    '7 kg',
=======
                    categoryController
                        .getCategoryName(item.productModel.categoryId),
>>>>>>> c460ae616d91ff4b9bd64bef72fa9de18f34120a
                    style: TextStyle(
                        fontFamily: 'Alata',
                        color: TColors.grayFont,
                        fontSize: 12),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
<<<<<<< HEAD
                        'Rp80.000',
=======
                        'Rp${item.productModel.salePrice.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
>>>>>>> c460ae616d91ff4b9bd64bef72fa9de18f34120a
                        style: TextStyle(
                            fontFamily: 'Alata',
                            color: Colors.black,
                            fontSize: 14),
                      ),
                      Container(
                        width: 75,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
<<<<<<< HEAD
                            Icon(
                              Icons.remove,
                              color: TColors.accent,
                            ),
                            Text(
                              '1',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.add,
                              color: TColors.accent,
=======
                            GestureDetector(
                              onTap: () => cartController.subItemQty(index),
                              child: Icon(
                                Icons.remove,
                                color: TColors.accent,
                              ),
                            ),
                            Obx(
                              () => Text(
                                cartController.cartItems[index].quantity.value
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => cartController.addItemQty(index),
                              child: Icon(
                                Icons.add,
                                color: TColors.accent,
                              ),
>>>>>>> c460ae616d91ff4b9bd64bef72fa9de18f34120a
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
