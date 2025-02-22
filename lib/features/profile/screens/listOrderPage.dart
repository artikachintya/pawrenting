import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/features/profile/screens/orderDetail.dart';
import 'package:pawrentingreborn/features/profile/widgets/productDisplay.dart';
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
      bottomNavigationBar:
          InsideNavBar(controller: controller, navcontroller: navcontroller),
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
              ProductDisplay(
                productImage: TImages.catMilk,
                productName:
                    "Whiskas KatzenMilch 6 Pcs X 125 mL (Vanilla Flavor)",
                productQuantity: 1,
                price: 125400,
              ),
              SizedBox(height: 15),
              Divider(
                color: const Color.fromARGB(255, 124, 120, 120),
                thickness: 1,
              ),
              SizedBox(height: 5), // Spacing

              // 🔹 Prices
              Container(
                width: 370,
                child: Text(
                  "Total Price: Rp. 140.400",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 10), //

              // 🔹 Button
              Container(
                width: 375,
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OrderDetail()));
                  },
                  child: Container(
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
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
