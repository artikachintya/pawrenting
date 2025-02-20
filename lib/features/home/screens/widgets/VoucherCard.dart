
import 'package:flutter/material.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class VoucherCard extends StatelessWidget {
  const VoucherCard({
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
          color: Color(0xffECFFF9)),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(TImages.voucher2),
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
                  '3 available vouchers',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          ImageIcon(
            AssetImage(TImages.arrowForwardIcon),
            size: 12,
          )
        ],
      ),
    );
  }
}
