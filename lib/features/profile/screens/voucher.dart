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

class Voucher extends StatelessWidget {
  const Voucher({super.key});

  @override
  Widget build(BuildContext context) {
    NavBarController controller = Get.find();
    NavigationController navcontroller = Get.find();
    TextEditingController searchController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: const TAppBar2(
        title: "My Voucher",
        subtitle: "Enjoy special discounts just for you!",
      ),
      bottomNavigationBar: InsideNavBar(controller: controller, navcontroller: navcontroller),
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search bar with validation
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Enter voucher code...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a voucher code';
                    }
                    // Add your validation logic here
                    // For example, check if the voucher code exists in your database
                    if (!isValidVoucherCode(value)) {
                      return 'Invalid voucher code';
                    }
                    return null;
                  },
                ),
              ),
            ),
            // Voucher card section
            GridView.builder(
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
                return VoucherCard(
                  expDate: "02 January 2025", 
                  imageVoucherPath: TImages.voucher
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  bool isValidVoucherCode(String code) {
    // Replace this with your actual validation logic
    // For example, check if the code exists in your database
    List<String> validCodes = ['VOUCHER123', 'DISCOUNT2025', 'SAVE10'];
    return validCodes.contains(code);
  }
}