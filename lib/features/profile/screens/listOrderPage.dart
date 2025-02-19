import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/features/profile/widgets/profilePictandUsername.dart';
import 'package:pawrentingreborn/features/profile/widgets/voucherCard.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';

class ListOrderPage extends StatelessWidget {
  const ListOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    NavBarController controller = Get.find();
    NavigationController navcontroller = Get.find();
    return Scaffold(
      appBar: const TAppBar2(
        title: "My Order",
        subtitle: "Woof! Meow! Your Order is on Its Way!",
      ),
      bottomNavigationBar: InsideNavBar(controller: controller, navcontroller: navcontroller),
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Container(
          width: 375,
          height: 200,
          margin: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            color: TColors.secondary,
            borderRadius: BorderRadius.circular(11),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
                child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "pawrenting officialstore",
                        style: TextStyle(
                          fontFamily: "Albert Sans",
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ), 
                      Stack(
                        children: [
                          Container(
                            width: 70,
                            height: 20,
                            decoration: BoxDecoration(
                              color: TColors.yellow, 
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: TColors.oliveFont,
                              )
                            ),
                          ), 
                          Positioned(
                            left: 7, 
                            child: Text(
                              "In Delivery", 
                              style: TextStyle(
                                fontFamily: "Alata", 
                                fontSize: 12, 
                                color: TColors.oliveFont, 
                                fontWeight: FontWeight.bold, 
                              ),  
                            ),
                          )
                        ],
                      )
                    ],
                  ),
              ),
              Expanded(
                child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.white, 
                          borderRadius: BorderRadius.circular(11), 
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2), // Shadow color
                              blurRadius: 10, // Softness of the shadow
                              spreadRadius: 2, // How much the shadow spreads
                              offset: Offset(0, 2), // Position (x, y)
                            ),
                          ],
                        ),  
                      ), 
                      Positioned(
                        child: Image.asset(
                          TImages.catMilk, 
                          width: 100,
                          height: 90,
                        )
                      ), 
                    ],
                  ),
                  Text(
                    "Whiskas KatzenMilch 6 Pcs X 125 mL (Vanilla Flavor)", 
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  )
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