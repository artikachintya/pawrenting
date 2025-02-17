import 'package:flutter/material.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/features/profile/widgets/profilePictandUsername.dart';
import 'package:pawrentingreborn/features/profile/widgets/voucherCard.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';

class VoucherDetail extends StatelessWidget {
  const VoucherDetail({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar2(
        title: "My Voucher",
        subtitle: "Enjoy special discounts just for you!",
      ),
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 25),
            width: 352,
            height: 700,
            decoration: BoxDecoration(
              color: TColors.secondary, 
              borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              children: [
                Image.asset(
                  TImages.voucher, 
                  width: 352,
                  height: 121,
                ), 
                Padding(
                  padding: EdgeInsets.only(top: 15), 
                  child: Text(
                    "Enjoy Up to 50% Off!", 
                    style: TextStyle(
                      fontFamily: "Albert Sans", 
                      fontSize: 24, 
                      color: const Color.fromARGB(255, 0, 0, 0), 
                      fontWeight: FontWeight.bold, 
                    ),
                  )
                ), 
                Padding(
                  padding: EdgeInsets.only(top: 15), 
                  child: Text(
                    "Voucher Code:", 
                    style: TextStyle(
                      fontFamily: "Albert Sans", 
                      fontSize: 16, 
                      color: const Color.fromARGB(255, 0, 0, 0), 
                      fontWeight: FontWeight.w500, 
                    ),
                  )
                ), 
                Container(
                  width: 225,
                  height: 44,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: TColors.accent, 
                    ),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "S M N G T C U Y", 
                        style: TextStyle(
                          fontFamily: "Albert Sans", 
                          fontSize: 24, 
                          color: TColors.accent,  
                          fontWeight: FontWeight.bold, 
                        ),
                      ), 
                      Image.asset(
                        TImages.copyIcon, 
                        width: 28,
                        height: 28,
                      )
                      
                    ],
                  ),
                ), 
                Text(
                  "Terms and Conditions: ", 
                    style: TextStyle(
                      fontFamily: "Albert Sans", 
                      fontSize: 18, 
                      color: const Color.fromARGB(255, 0, 0, 0), 
                      fontWeight: FontWeight.w500, 
                    ),
                ), 
                Text(
                  "This voucher is valid for registered users of the Pawrenting app only.", 
                  style: TextStyle(
                    fontFamily: "Alata", 
                    fontSize: 16, 
                    color: const Color.fromARGB(255, 0, 0, 0), 
                    fontWeight: FontWeight.w500, 
                  ),
                ),               
              ],
            ),
          )
        )
       
      )
    );
  }

} 