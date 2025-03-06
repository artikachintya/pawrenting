import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/features/profile/models/VoucherModel.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/size.dart';

class VoucherDetail extends StatelessWidget {
  final VoucherModel voucher;
  const VoucherDetail({super.key, required this.voucher});
  
  @override
  Widget build(BuildContext context) {
    NavBarController controller = Get.find();
    NavigationController navcontroller = Get.find();

    return Scaffold(
      appBar: const TAppBar2(
        title: "My Voucher",
        subtitle: "Enjoy special discounts just for you!",
      ),
      bottomNavigationBar: InsideNavBar(controller: controller, navcontroller: navcontroller),
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 25),
            width: 352,
            padding: EdgeInsets.symmetric(horizontal: TSize.hPad, vertical: TSize.vPad),
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
                    voucher.title, 
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
                  width: 300,
                  height: 44,
                  margin: EdgeInsets.symmetric(vertical: 15),
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
                        voucher.code, 
                        style: TextStyle(
                          letterSpacing: 4,
                          fontFamily: "Albert Sans", 
                          fontSize: 20, 
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
                Padding(
                  padding: EdgeInsets.only(top: 15), 
                  child: Text(
                    "Terms and Conditions:", 
                    style: TextStyle(
                      fontFamily: "Albert Sans", 
                      fontSize: 18, 
                      color: const Color.fromARGB(255, 0, 0, 0), 
                      fontWeight: FontWeight.w500, 
                    ),
                  ),
                ),
                _buildTermItem("This voucher is valid for registered users of the Pawrenting App only."),
                _buildTermItem("This voucher is valid with a minimum transaction of ${formatCurrency(voucher.minPurchase)}"),
                _buildTermItem("This voucher cannot be combined with other promotions, discounts, or offers."),
                _buildTermItem("This voucher is valid until "+ voucher.validUntil),
                _buildTermItem("This voucher is not applicable for delivery fees, taxes, or specific excluded products/services."),
                _buildTermItem("Each user may use this voucher only once."),
                _buildTermItem("Pawrenting reserves the right to modify or terminate this promotion at any time without prior notice."),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  String formatCurrency(int amount) {
  return 'Rp' + amount.toString().replaceAllMapped(
    RegExp(r'(\d)(?=(\d{3})+(?!\d))'), 
    (Match match) => '${match[1]}.'
  );
}


  Widget _buildTermItem(String term) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16), // Adjust padding for better alignment
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 6.0,
            width: 6.0,
            decoration: BoxDecoration(
              color: TColors.grayFont,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 10), // Space between bullet and text
          Expanded(
            child: Text(
              term, 
              style: TextStyle(
                fontFamily: "Alata", 
                fontSize: 16, 
                color: TColors.grayFont, 
                fontWeight: FontWeight.w500, 
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    ); 
  }
}

