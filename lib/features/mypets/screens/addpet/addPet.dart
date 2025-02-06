import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/addpetPageController.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/mypets/screens/addpet/addPet1.dart';
import 'package:pawrentingreborn/features/mypets/screens/addpet/addPet2.dart';
import 'package:pawrentingreborn/features/mypets/screens/addpet/addPet3.dart';
import 'package:pawrentingreborn/features/mypets/screens/addpet/addPet4.dart';
import 'package:pawrentingreborn/features/mypets/screens/addpet/addPet5.dart';
import 'package:pawrentingreborn/features/mypets/screens/addpet/addPet6.dart';
import 'package:pawrentingreborn/features/mypets/screens/addpet/widgets/addpetbutton.dart';
import 'package:pawrentingreborn/features/mypets/screens/addpet/widgets/dotindicator.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';

class AddPet extends StatelessWidget {
  const AddPet({super.key});

  @override
  Widget build(BuildContext context) {
    NavBarController controller = Get.find();
    NavigationController navcontroller = Get.find();
    final pcontroller = Get.put(addpetPageController());
    final formGlobalKey1 = GlobalKey<FormState>();
    final formGlobalKey2 = GlobalKey<FormState>();
    final dobController = TextEditingController();
    final weightController = TextEditingController();
    final heightController = TextEditingController();
    final breedController = TextEditingController();
    final allergiesController = TextEditingController();
    return Scaffold(
      backgroundColor: TColors.primary,
      appBar: const TAppBar(onMain: true, onPetDetails: false),
      bottomNavigationBar: InsideNavBar(controller: controller, navcontroller: navcontroller),
      body: Stack(  
        children: [
          DotIndicator(pcontroller: pcontroller),
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pcontroller.pagecontroller,
            children: [
               addPet1(formGlobalKey: formGlobalKey1),
               const addPet2(),
               const addPet3(),
               addPet4(formGlobalKey: formGlobalKey2),
               const addPet5(),
               const addPet6()
            ],
          ),
          GetBuilder<addpetPageController>(builder: (_)
          {
            return AddPetButton(
              pcontroller: pcontroller, 
              confirmation: pcontroller.confirmation, 
              formGlobalKey1: formGlobalKey1,
              formGlobalKey2: formGlobalKey2,
              );
          })
        ],
      )
    );
  }
}
