import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/features/mypets/models/PetModel.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/petVaccine/coreVaccine.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/petVaccine/noncoreVaccine.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/petVaccine/vaccineList.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';

class PetVaccine extends StatelessWidget {
  final PetModel pet;
  const PetVaccine({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    NavBarController controller = Get.find();
    NavigationController navcontroller = Get.find();
    return Scaffold(
      backgroundColor: TColors.primary,
      appBar: TAppBar2(
          title: TTexts.appBarVaccineTitle, subtitle: TTexts.appBarVaccineSub),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage('assets/login/wallpaper-login.png'))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            child: Column(children: [
              Center(
                child: Image(
                  image: AssetImage(TImages.tipsVaccine),
                  height: 190,
                ),
              ),
              SizedBox(height: 20),
              CoreVaccine(),
              SizedBox(height: 20),
              NonCoreVaccine()
            ]),
          ),
        ),
      ),
      bottomNavigationBar:
          InsideNavBar(controller: controller, navcontroller: navcontroller),
    );
  }
}
