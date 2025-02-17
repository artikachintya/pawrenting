import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/features/mypets/controllers/petActivity/petActivityController.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/petActivity/activityCategories.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/petActivity/activityCategory.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/petActivity/activitySection.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';

class PetActivity extends StatelessWidget {
  const PetActivity({super.key});

  @override
  Widget build(BuildContext context) {
    NavBarController controller = Get.find();
    NavigationController navcontroller = Get.find();
    PetActivityController activityController = Get.put(PetActivityController());
    return Scaffold(
      floatingActionButton: Container(
          width: 90,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: TColors.accent,
            foregroundColor: Colors.white,
            child: Text('+ Add',
                style: TextStyle(
                    fontSize: 12, fontFamily: 'Alata', color: Colors.white)),
          )),
      backgroundColor: TColors.primary,
      appBar: TAppBar2(
          title: TTexts.appBarActivitesTitle,
          subtitle: TTexts.appBarActivitesSub),
      bottomNavigationBar:
          InsideNavBar(controller: controller, navcontroller: navcontroller),
      body: SingleChildScrollView(
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
            Obx(
              ()=> ActivityCategories(category: activityController.category.value,),
            ),
            SizedBox(
              height: 20,
            ),
            ActivitySection()
          ]),
        ),
      ),
    );
  }
}
