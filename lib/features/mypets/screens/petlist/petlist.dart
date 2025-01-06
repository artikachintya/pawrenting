import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/features/mypets/screens/addpet/addPet.dart';
import 'package:pawrentingreborn/features/mypets/screens/petlist/widgets/petCard.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';

class PetList extends StatelessWidget {
  const PetList({super.key});

  @override
  Widget build(BuildContext context) {
    // NavigationController controller = Get.find();
    NavBarController controller = Get.find();
    return Scaffold(
      appBar: TAppBar(onMain: true, onPetDetails: false),
      // bottomNavigationBar: NavBar(controller: controller),
      floatingActionButton: Container(
        width: 90,
        child: FloatingActionButton(
          onPressed: () {
            controller.setCurIndex(1);
            Get.to(()=>AddPet());
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
              padding: EdgeInsets.all(20),
              physics: NeverScrollableScrollPhysics(),
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 10,
              mainAxisExtent: 210,
              ),
             itemBuilder: (_, index) => PetCard(isCat: true, imgstr: TImages.whiskey) 
             )
          ],
        ),
      ),
    );
  }
}

