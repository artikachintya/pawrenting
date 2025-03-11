import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/features/home/controllers/OrderController.dart';
import 'package:pawrentingreborn/features/home/models/orderModel.dart';
import 'package:pawrentingreborn/features/home/screens/Cart/Cart.dart';
import 'package:pawrentingreborn/features/home/screens/home.dart';
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

    OrderController orderController = Get.find();
    print(orderController.orderList.length);
    return Scaffold(
      appBar: TAppBar2(
        title: "My Order",
        subtitle: "Woof! Meow! Your Order is on Its Way!",
      ),
      bottomNavigationBar: InsideNavBar(),
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: orderController.orderList.length != 0
                ? ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                    shrinkWrap: true,
                    itemCount: orderController.orderList.length,
                    itemBuilder: (context, index) {
                      // return Container(
                      //   height: 10,
                      //   width: 10,
                      //   color: Colors.red,
                      // );
                      return OrderCard(order: orderController.orderList[index]);
                    })
                : ShopNow()),
      ),
    );
  }
}

class ShopNow extends StatelessWidget {
  const ShopNow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 150, // Ensures full height
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          children: [
            Container(
              height: 125,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: TColors.gray,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10,
                children: [
                  Text(
                    'You don\'t have any order!',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(Home());
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          color: TColors.accent,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          'Shop Now',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Alata'),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final OrderModel order;
  const OrderCard({
    required this.order,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
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
                  fontSize: 16,
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
                  order.status,
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
            productImage: order.items.first.productModel.image,
            productName: order.items.first.productModel.name,
            productQuantity: order.items.first.quantity.value,
            price: order.items.first.productModel.salePrice,
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
              'Total Price: Rp${order.totalPrice.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OrderDetail(
                              order: order,
                            )));
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
    );
  }
}
