import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class PetDetails extends StatelessWidget {
  const PetDetails({super.key});
  
  @override
  Widget build(BuildContext context) {
    NavBarController controller = Get.find();
    NavigationController navcontroller = Get.find();
    return Scaffold(
      appBar: TAppBar(onMain: false, onPetDetails: true),
      body: SingleChildScrollView(
        child: Container(
          height: 1000,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 350,
                width: 420,
                child: Image.asset(TImages.whiskey, fit: BoxFit.cover,)
              ),
              Positioned(
                top: 290,
                child: Container(
                  height: 1000,
                  width: 412,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: TColors.primary,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: InsideNavBar(controller: controller, navcontroller: navcontroller),
    );
  }
}