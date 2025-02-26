
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/home/screens/Cart/Delivery.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class DeliveryCard extends StatelessWidget {
  const DeliveryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                  'Regular',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rp63.000',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () => Get.to(() => ChooseDelivery()),
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
