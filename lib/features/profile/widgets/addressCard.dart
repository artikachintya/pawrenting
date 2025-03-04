import 'package:flutter/material.dart';
import 'package:pawrentingreborn/features/profile/screens/AddLocationDetail.dart';
import 'package:pawrentingreborn/features/profile/screens/voucherDetail.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/features/profile/screens/EditLocationDetail.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';

class AddressCard extends StatelessWidget {
  final String labelAddress;
  final String receiverName;
  final String addressDetail;
  final String phoneNumber;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AddressCard(
      {super.key,
      required this.labelAddress,
      required this.receiverName,
      required this.addressDetail,
      required this.phoneNumber});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 355,
      height: 100,
      decoration: BoxDecoration(
        color: TColors.secondary,
        border: Border.all(color: TColors.accent.withOpacity(0.6)),
        borderRadius: BorderRadius.circular(11),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            TImages.addressIcon,
            width: 35,
            height: 42,
          ),
          Container(
            width: 220,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  labelAddress,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontFamily: "Albert Sans",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                      receiverName +
                      ", " +
                      addressDetail +
                      "(" +
                      phoneNumber +
                      ")",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontFamily: "Alata",
                    fontSize: 14,
                    color: TColors.grayFont,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            TImages.arrowForwardIcon,
            width: 7,
            height: 12,
          ),
        ],
      ),
    );
  }
}
