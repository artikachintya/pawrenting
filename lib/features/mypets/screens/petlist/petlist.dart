import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/ActivityController.dart';
import 'package:pawrentingreborn/features/mypets/controllers/AddPetController.dart';
import 'package:pawrentingreborn/features/mypets/controllers/PetController.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/features/mypets/controllers/petFoodController.dart';
import 'package:pawrentingreborn/features/mypets/screens/addpet/addPet.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/petdetails.dart';
import 'package:pawrentingreborn/features/mypets/screens/petlist/widgets/petCard.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class PetList extends StatelessWidget {
  const PetList({super.key});

  @override
  Widget build(BuildContext context) {
    // NavigationController controller = Get.find();
    ActivityController activityController = Get.find();
    NavBarController controller = Get.find();
    PetController petController = Get.find();
    PetFoodController foodController = Get.find();
    AddPetController addPetController = Get.put(AddPetController());
    return Scaffold(
      appBar: const TAppBar(onMain: true, onPetDetails: false),
      // bottomNavigationBar: NavBar(controller: controller),
      floatingActionButton: SizedBox(
        width: 90,
        child: FloatingActionButton(
          onPressed: () {
            controller.setCurIndex(1);
            Get.to(() => const AddPet());
          },
          backgroundColor: TColors.accent,
          foregroundColor: Colors.white,
          child: Text('+ Add',
              style: TextStyle(
                  fontSize: 12, fontFamily: 'Alata', color: Colors.white)),
        ),
      ),
      backgroundColor: TColors.primary,
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
                      print(
                          'amount of activities: ${petController.petList[index].activities.length}');
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
    );
  }
}
