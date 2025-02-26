import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/features/shoppingCart/widgets/productCard.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    NavBarController controller = Get.find();
    NavigationController navcontroller = Get.find();
    return Scaffold(
      backgroundColor: TColors.primary,
      appBar: TAppBar2(
        title: TTexts.appBarMyCartTitle,
        subtitle: TTexts.appBarMyCartSub,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                margin: const EdgeInsets.only(left: 18, top: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: TColors.bluePrim, width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Container(
                child: const Text(
                  'Select All',
                  style: TextStyle(fontFamily: 'Alata', fontSize: 16),
                ),
                margin: const EdgeInsets.only(top: 20, left: 10),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 10, // Space between rows
                mainAxisExtent: 115, // Set a fixed height for each item
              ),
              itemBuilder: (BuildContext context, int index) {
                return ProductCard(); // Return the ProductCard widget
              },
            ),
          ),
          Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: TColors.bluePrim, width: 1),
                ),
              ),
              child: Row(children: [
                Padding(
                  padding: EdgeInsets.only(left: 25, top: 8, ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Price',
                          style: TextStyle(
                            fontFamily: 'Albert Sans',
                            fontSize: 12,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        Text(
                          'Rp 143.000',
                          style: TextStyle(
                            fontFamily: 'Albert Sans',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ]),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 200),
                    child: 
                    Container(
                      width:100,
                      height:30,
    
                      decoration: BoxDecoration(
                        color: TColors.purplebutton,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text('Checkout',
                          style: TextStyle(
                            fontFamily: 'Alata',
                            fontSize: 13,
                            fontWeight: FontWeight.w200,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                          textAlign: TextAlign.center),
                      ))
                )
          ]))
        ],
      ),
      // bottomNavigationBar: InsideNavBar(
      //   controller: controller,
      //   navcontroller: navcontroller,
      // ),
    );
  }
}
