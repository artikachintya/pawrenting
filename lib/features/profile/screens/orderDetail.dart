import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/features/home/models/cartItemModel.dart';
import 'package:pawrentingreborn/features/home/models/orderModel.dart';
import 'package:pawrentingreborn/features/home/screens/widgets/cartItem.dart';
import 'package:pawrentingreborn/features/profile/models/LocationModel.dart';
import 'package:pawrentingreborn/features/profile/widgets/productDisplay.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';

class OrderDetail extends StatelessWidget {
  final OrderModel order;
  const OrderDetail({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    LocationModel location = order.location;
    List<CartItemModel> items = order.items;
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
          child: Column(children: [
            Container(
              width: 370,
              height: 45,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              margin: EdgeInsets.only(top: 30, left: 20, right: 20),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
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
                          location.label,
                          style: TextStyle(
                            fontFamily: "Albert Sans",
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          location.fullAddress,
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
            _orderIdDateTemplate("ID", "${order.id}"),
            _orderIdDateTemplate("Date",
                "${DateFormat('EEEE, MMMM d, yyyy').format(order.date)}"),
            Container(
              width: 370,
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: TColors.secondary,
                borderRadius: BorderRadius.circular(11),
              ),
              child: Column(
                children: [
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                  SizedBox(height: 10),
                  GridView.builder(
                      itemCount: items.length,
                      shrinkWrap: true,
                      // padding: const EdgeInsets.all(20),
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 25, // Space between row
                          mainAxisExtent: 90),
                      itemBuilder: (BuildContext context, int index) {
                        return ProductDisplay(
                          productImage: items[index].productModel.image,
                          productName: items[index].productModel.name,
                          productQuantity: items[index].quantity.value,
                          price: items[index].productModel.salePrice,
                        );
                      }),
                  SizedBox(height: 15),
                  Divider(
                    color: const Color.fromARGB(255, 124, 120, 120),
                    thickness: 1,
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 370,
                    child: Text(
                      'Total Price: Rp${order.totalPrice.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 5), // S
                ],
              ),
            )
          ]),
        ));
  }

  Container _orderIdDateTemplate(String info, String detail) {
    return Container(
      width: 369,
      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Order " + info + ":",
            style: TextStyle(
              fontFamily: "Albert Sans",
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            detail,
            style: TextStyle(
              fontFamily: "Albert Sans",
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
