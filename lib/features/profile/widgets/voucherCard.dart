import 'package:flutter/material.dart';
import 'package:pawrentingreborn/features/profile/screens/voucherDetail.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';

class VoucherCard extends StatelessWidget {

  final String expDate; 
  final String imageVoucherPath;

  const VoucherCard({
    Key?key, 
    required this.expDate, 
    required this.imageVoucherPath
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => (VoucherDetail())));
        },
        child: Container(
          // margin: EdgeInsets.only(top: 25),
        width: 355,
        height: 168,
        decoration: BoxDecoration(
        color: TColors.secondary,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(
          color: TColors.accent.withOpacity(0.6),
        )
        ),
        child: Column(
            children: [
              Image.asset(
                imageVoucherPath,
                width: 354,
                height: 121,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "valid till " + expDate,
                      style: TextStyle(
                          fontFamily: "Alata",
                          fontSize: 12,
                          color: TColors.greenFont
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}