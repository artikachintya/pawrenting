import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
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
    NavBarController controller = Get.find();
    return Scaffold(
      appBar: const TAppBar(onMain: true, onPetDetails: false),
      // bottomNavigationBar: NavBar(controller: controller),
      floatingActionButton: SizedBox(
        width: 90,
        child: FloatingActionButton(
          onPressed: () {
            controller.setCurIndex(1);
            Get.to(()=>const AddPet());
          },
          backgroundColor: TColors.accent,
          foregroundColor: Colors.white,
          child: Text('+ Add',
          style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      )
      ,
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              itemCount: 4,
              shrinkWrap: true,
              padding: const EdgeInsets.all(20),
              physics: const NeverScrollableScrollPhysics(),
             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 10,
              mainAxisExtent: 210,
              ),
             itemBuilder: (_, index) => GestureDetector(
              child: const PetCard(isCat: true, imgstr: TImages.whiskey) ,
              onTap: (){
                Get.to(()=>const PetDetails());
              }
             ) 
             )
          ],
        ),
      ),
    );
  }
}

