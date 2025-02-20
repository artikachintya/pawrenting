import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';

class ListOrderPage extends StatelessWidget {
  const ListOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    NavBarController controller = Get.find();
    NavigationController navcontroller = Get.find();
    return Scaffold(
      appBar: TAppBar2(
        title: "My Order",
        subtitle: "Woof! Meow! Your Order is on Its Way!",
      ),
      bottomNavigationBar: InsideNavBar(controller: controller, navcontroller: navcontroller),
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Container(
          width: 375,
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: TColors.secondary,
            borderRadius: BorderRadius.circular(11),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Store Name & Status
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: TColors.yellow,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: TColors.oliveFont),
                    ),
                    child: Text(
                      "In Delivery",
                      style: TextStyle(
                        fontFamily: "Alata",
                        fontSize: 12,
                        color: TColors.oliveFont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10), // Spacing

              // 🔹 Product Details
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 🖼 Product Image
                    Container(
                      width: 100,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(11),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(11),
                        child: Image.asset(
                          TImages.catMilk,
                          width: 100,
                          height: 90,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    SizedBox(width: 10), // Spacing

                    // 📄 Product Name & Quantity
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Product Name
                          Expanded(
                            child: Text(
                              "Whiskas KatzenMilch 6 Pcs X 125 mL (Vanilla Flavor)",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          SizedBox(width: 8), // Space between name & quantity
                          
                          // Quantity
                          Text(
                            "x1",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15), // Spacing

              // 🔹 Prices
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rp. 125.400",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Total Price: Rp. 140.400",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15), // Spacing

              // 🔹 Button
              Container(
                width: 80,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: TColors.accent,
                ),
                child: Text(
                  "View Detail", 
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
