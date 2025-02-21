import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';

class OrderDetail extends StatelessWidget {
  const OrderDetail({super.key});
  
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
        child: Column(
          children: [
            Container(
              width: 370,
              height: 45,
              decoration: BoxDecoration(
                border: Border.all(
                  color:  Colors.black, 
                  width: 1
                ), 
                borderRadius: BorderRadius.circular(5),
              ),
              margin: EdgeInsets.only(top: 30, left: 20, right: 20),
              child: Row(
                children: [
                  SizedBox(width: 10,), 
                  Image.asset(
                    TImages.locationIcon, 
                    color: TColors.accent,
                    width: 20,
                    height: 25,
                  ), 
                  SizedBox(width: 10), 
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mansion 1", 
                          style: TextStyle(
                            fontFamily: "Albert Sans", 
                            fontSize: 12, 
                            color: Colors.black, 
                            fontWeight: FontWeight.bold,
                          ),
                        ), 
                        Text(
                          "Rumah Talenta BCA, Jalan Pakuan No 3, Kelurahan Sumur batu, Kecamatan Babakan Madang, Kabupaten Bogor", 
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ), 
            Container(
              margin: EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Order ID", 
                    style: TextStyle(
                      color: Colors.black, 
                      fontFamily: "Albert Sans", 
                      fontWeight: FontWeight.w500, 
                      fontSize: 14
                    )
                  ), 
                  Text(
                    "250112AJPWE8HNT1", 
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Colors.black, 
                      fontFamily: "Albert Sans", 
                      fontWeight: FontWeight.w500, 
                      fontSize: 14
                    )
                  ), 
                ],
              ),
            ), 
            Container(
              margin: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Order Date", 
                    style: TextStyle(
                      color: Colors.black, 
                      fontFamily: "Albert Sans", 
                      fontWeight: FontWeight.w500, 
                      fontSize: 14
                    )
                  ), 
                  Text(
                    "January 12, 2025", 
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Colors.black, 
                      fontFamily: "Albert Sans", 
                      fontWeight: FontWeight.w500, 
                      fontSize: 14
                    )
                  ), 
                ],
              ),
            )
          ]
        ),
      ) 
    );
  }

} 