import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/features/profile/widgets/addressCard.dart';
import 'package:pawrentingreborn/features/profile/widgets/profilePictandUsername.dart';
import 'package:pawrentingreborn/features/profile/widgets/voucherCard.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';

class Location extends StatelessWidget {
  const Location({super.key});
  
  @override
  Widget build(BuildContext context) {  
    NavBarController controller = Get.find();
    NavigationController navcontroller = Get.find();
    return Scaffold(
      appBar: const TAppBar2(
        title: "Address",
        subtitle: "Where your packages find you!", 
      ),
      bottomNavigationBar: InsideNavBar(controller: controller, navcontroller: navcontroller),
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          itemCount: 4,
          shrinkWrap: true,
          // padding: const EdgeInsets.all(20),
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, 
            mainAxisSpacing: 12, // Space between row
            mainAxisExtent: 120 
          ),
          itemBuilder: (BuildContext context, int index) {  
            return AddressCard(
              labelAddress: "Mansion 1", 
              receiverName: "Kelompok 5 AYE", 
              addressDetail: "Jl. Pakuan No 1", 
              phoneNumber: "081234567890"
            ); 
          },
        )
      ), 
    ); 
  }
}