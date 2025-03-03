import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/home/controllers/LocationController.dart';
import 'package:pawrentingreborn/features/home/screens/Cart/Address.dart';
import 'package:pawrentingreborn/features/profile/models/LocationModel.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class AddressSection extends StatelessWidget {
  final LocationModel location;
  const AddressSection({
    super.key,
    required this.location,
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
                  location.label,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  location.fullAddress,
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
