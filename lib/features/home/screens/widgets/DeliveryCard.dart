import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/home/controllers/DeliveryController.dart';
import 'package:pawrentingreborn/features/home/models/deliveryModel.dart';
import 'package:pawrentingreborn/features/home/screens/Cart/Delivery.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class DeliveryCard extends StatelessWidget {
  final DeliveryModel delivery;
  const DeliveryCard({
    super.key,
    required this.delivery,
  });

  @override
  Widget build(BuildContext context) {
    DeliveryController deliveryController = Get.find();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      height: 60,
      decoration: BoxDecoration(
          // border: Border.all(color: TColors.accent, width: 0.8),
          borderRadius: BorderRadius.circular(10),
          color: TColors.gray),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(TImages.truck),
            color: TColors.accent,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  delivery.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rp${delivery.price.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () => Get.to(() =>
                ChooseDelivery(deliveryList: deliveryController.deliveryList)),
            child: Text(
              'Change',
              style: TextStyle(
                  fontFamily: 'Alata',
                  fontWeight: FontWeight.w900,
                  fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
