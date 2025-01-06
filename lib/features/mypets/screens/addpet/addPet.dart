import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/addpetPageController.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/features/mypets/models/navbar.dart';
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
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/device/device_utility.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AddPet extends StatelessWidget {
  const AddPet({super.key});

  @override
  Widget build(BuildContext context) {
    NavBarController controller = Get.find();
    NavigationController navcontroller = Get.find();
    final pcontroller = Get.put(addpetPageController());
    final _formGlobalKey1 = GlobalKey<FormState>();
    final _formGlobalKey2 = GlobalKey<FormState>();
    final dobController = TextEditingController();
    final weightController = TextEditingController();
    final heightController = TextEditingController();
    final breedController = TextEditingController();
    final allergiesController = TextEditingController();
    return Scaffold(
      backgroundColor: TColors.primary,
      appBar: TAppBar(onMain: true, onPetDetails: false),
      bottomNavigationBar: InsideNavBar(controller: controller, navcontroller: navcontroller),
      body: Stack(  
        children: [
          DotIndicator(pcontroller: pcontroller),
          PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: pcontroller.pagecontroller,
            children: [
               addPet1(formGlobalKey: _formGlobalKey1),
               addPet2(),
               addPet3(),
               addPet4(formGlobalKey: _formGlobalKey2),
               addPet5(),
               addPet6()
            ],
          ),
          GetBuilder<addpetPageController>(builder: (_)
          {
            return AddPetButton(
              pcontroller: pcontroller, 
              confirmation: pcontroller.confirmation, 
              formGlobalKey1: _formGlobalKey1,
              formGlobalKey2: _formGlobalKey2,
              );
          })
        ],
      )
    );
  }
}
