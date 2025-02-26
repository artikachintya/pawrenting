import 'package:flutter/material.dart';
import 'package:pawrentingreborn/features/profile/screens/voucherDetail.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';

class AddressCard2 extends StatelessWidget {
  final String labelAddress;
  final String receiverName;
  final String addressDetail;
  final String phoneNumber;
  final bool selected;

  const AddressCard2(
      {super.key,
      required this.labelAddress,
      required this.receiverName,
      required this.addressDetail,
      required this.phoneNumber,
      required this.selected});
  @override
  Widget build(Object context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      height: 100,
      decoration: BoxDecoration(
          color: TColors.secondary,
          borderRadius: BorderRadius.circular(11),
          border:
              selected ? Border.all(color: TColors.accent, width: 1.5) : null),
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
                      labelAddress,
                      style: TextStyle(
                        fontFamily: "Albert Sans",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      labelAddress +
                          ", " +
                          addressDetail +
                          ", " +
                          receiverName +
                          "(" +
                          phoneNumber +
                          ")",
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
    );
  }
}
