import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/home/controllers/LocationController.dart';
import 'package:pawrentingreborn/features/profile/models/LocationModel.dart';
import 'package:pawrentingreborn/features/profile/screens/voucherDetail.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';

class AddressCard2 extends StatelessWidget {
  final LocationModel location;
  final int index;

  const AddressCard2({super.key, required this.location, required this.index});
  @override
  Widget build(Object context) {
    LocationController locationController = Get.find();
    return GestureDetector(
        onTap: () => locationController.selectedIndex.value = index,
        child: Obx(
          () => Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            height: 100,
            decoration: BoxDecoration(
                color: TColors.secondary,
                borderRadius: BorderRadius.circular(10),
                border: index == locationController.selectedIndex.value
                    ? Border.all(color: TColors.accent, width: 1.5)
                    : null),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      TImages.addressIcon,
                      width: 35,
                      height: 42,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 220,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            location.label,
                            style: TextStyle(
                              fontFamily: "Albert Sans",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            location.receiverName +
                                "(" +
                                location.phoneNum +
                                ")" +
                                ",\n" +
                                location.fullAddress +
                                ", ",
                            style: TextStyle(
                              height: 1,
                              fontFamily: "Alata",
                              fontSize: 14,
                              color: TColors.grayFont,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  TImages.arrowForwardIcon,
                  width: 7,
                  height: 12,
                )
              ],
            ),
          ),
        ));
  }
}
