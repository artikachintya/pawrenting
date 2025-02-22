import 'package:flutter/material.dart';
import 'package:pawrentingreborn/features/profile/screens/locationDetail.dart';
import 'package:pawrentingreborn/features/profile/screens/voucherDetail.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';

class AddressCard extends StatelessWidget {
  final String labelAddress; 
  final String receiverName;
  final String addressDetail;
  final String phoneNumber;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AddressCard({
    super.key, 
    required this.labelAddress, 
    required this.receiverName, 
    required this.addressDetail, 
    required this.phoneNumber
  }); 
  @override
  Widget build(BuildContext context) {
    return 
      Container(
        width: 355,
        height: 100,
        decoration: BoxDecoration(
          color: TColors.secondary, 
          border: Border.all(
            color: TColors.accent.withOpacity(0.6)
          ), 
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
                    style: TextStyle(
                      fontFamily: "Albert Sans", 
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ), 
                  Text(
                    labelAddress + ", " + addressDetail + ", " + receiverName + "(" + phoneNumber + ")", 
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
           
            GestureDetector(
             onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LocationDetail(formGlobalKey: _formKey)));
              },
              child: Image.asset(
                TImages.arrowForwardIcon, 
                width: 7,
                height: 12,
              ),
            )

          ],

        ),
      );
  }
}

