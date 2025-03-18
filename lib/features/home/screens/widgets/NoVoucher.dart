import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/home/controllers/VoucherController.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class NoVoucher extends StatelessWidget {
  const NoVoucher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        height: 80,
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: Color(0xffDBE2E9),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Discount 50%',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Minimum Order Rp10.000.000'),
                  ]),
              ImageIcon(
                AssetImage(TImages.discount),
                color: TColors.accent,
                size: 32,
              )
            ]));
  }
}
