import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/home/controllers/CategoryController.dart';
import 'package:pawrentingreborn/features/home/models/cartItemModel.dart';
import 'package:pawrentingreborn/features/home/screens/Product/ProductDetail.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class COItem extends StatelessWidget {
  final CartItemModel item;
  const COItem({
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CategoryController categoryController = Get.find();
    final double totalPrice = item.productModel.salePrice * item.quantity.value;
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetail(product: item.productModel)),
      child: Container(
        height: 125,
        decoration: BoxDecoration(
            // border: Border.all(width: 0.8, color: TColors.accent),
            color: TColors.gray,
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
          child: Row(
            children: [
              Container(
                width: 90,
                height: 90,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Image.asset(item.productModel.image),
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
                      item.productModel.name,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      categoryController
                          .getCategoryName(item.productModel.categoryId - 1),
                      style: TextStyle(
                          fontFamily: 'Alata',
                          color: TColors.grayFont,
                          fontSize: 12),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rp${item.productModel.salePrice.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                          style: TextStyle(
                              fontFamily: 'Alata',
                              color: Colors.black,
                              fontSize: 14),
                        ),
                        Text(
                          'x ${item.quantity.value}',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
