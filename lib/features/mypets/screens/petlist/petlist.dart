import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/ActivityController.dart';
import 'package:pawrentingreborn/features/mypets/controllers/AddPetController.dart';
import 'package:pawrentingreborn/features/mypets/controllers/PetController.dart';
import 'package:pawrentingreborn/features/mypets/controllers/VaccineController.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/features/mypets/controllers/PetFoodController.dart';
import 'package:pawrentingreborn/features/mypets/screens/addpet/addPet.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/petdetails.dart';
import 'package:pawrentingreborn/features/mypets/screens/petlist/widgets/petCard.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class PetList extends StatelessWidget {
  const PetList({super.key});

  @override
  Widget build(BuildContext context) {
    //
    ActivityController activityController = Get.find();
    NavBarController controller = Get.find();
    PetController petController = Get.find();
    VaccineController vaccineController = Get.find();
    PetFoodController foodController = Get.find();
    AddPetController addPetController = Get.put(AddPetController());

    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/login/wallpaper-login.png"), // Replace with your wallpaper path
            fit: BoxFit.cover, // Ensures the image covers the entire screen
          ),
        ),
        child: Scaffold(
          bottomNavigationBar: InsideNavBar(),
          backgroundColor: Colors.transparent,
          appBar: const TAppBar(onMain: true, onPetDetails: false),
          // bottomNavigationBar: NavBar(controller: controller),
          floatingActionButton: SizedBox(
            width: 90,
            child: FloatingActionButton(
              onPressed: () {
                Get.to(() => const AddPet());
              },
              backgroundColor: TColors.accent,
              foregroundColor: Colors.white,
              child: Text('+ Add',
                  style: TextStyle(
                      fontSize: 14, fontFamily: 'Alata', color: Colors.white)),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Obx(() => GridView.builder(
                    itemCount: petController.petList.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.all(20),
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 210,
                    ),
                    itemBuilder: (_, index) => GestureDetector(
                        child: PetCard(
                          pet: petController.petList[index],
                        ),
                        onTap: () {
                          vaccineController
                              .initVaccine(petController.petList[index].id);
                          activityController
                              .initActivities(petController.petList[index].id);
                          foodController
                              .initFood(petController.petList[index].id);
                          Get.to(() => PetDetails(
                                pet: petController.petList[index],
                              ));
                        }))),
              ],
            ),
          ),
        ));
  }
}
