

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/home/screens/Cart/Address.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      height: 80,
      decoration: BoxDecoration(
          // border: Border.all(color: TColors.accent, width: 0.8),
          borderRadius: BorderRadius.circular(10),
          color: TColors.gray),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(TImages.locationIcon),
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
                  'Home',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rumah Talenta BCA, Jalan Pakuan No.3, Sumur Batu, Bogor, Babakan Madang, Anjay mabarrrrrr',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () => Get.to(() => ChooseAddress()),
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
