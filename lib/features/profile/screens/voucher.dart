import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/features/profile/widgets/profilePictandUsername.dart';
import 'package:pawrentingreborn/features/profile/widgets/voucherCard.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';

class Voucher extends StatelessWidget {
  const Voucher({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // NavBarController controller = Get.find();
      // NavigationController navcontroller = Get.find();
      appBar: const TAppBar2(
        title: "My Voucher",
        subtitle: "Enjoy special discounts just for you!",
      ),
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: GridView.builder(
          itemCount: 4,
          shrinkWrap: true,
          // padding: const EdgeInsets.all(20),
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, 
            mainAxisSpacing: 0, // Space between row
            mainAxisExtent: 180 
          ),

          itemBuilder: (BuildContext context, int index) {  
            return  VoucherCard(
            expDate: "02 January 2025", 
            imageVoucherPath: TImages.voucher
            );
          },
        )
      )
    );
  }
}
