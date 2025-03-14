import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/addPet/addpetPageController.dart';
import 'package:pawrentingreborn/features/mypets/controllers/AddPetController.dart';
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
    addpetPageController pcontroller = Get.put(addpetPageController());
    final formGlobalKey1 = GlobalKey<FormState>();
    final formGlobalKey2 = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: TColors.primary,
      resizeToAvoidBottomInset:
          false, // Prevents screen resizing when keyboard appears
      appBar: const TAppBar(onMain: true, onPetDetails: false),
      bottomNavigationBar: InsideNavBar(),
      body: Column(
        children: [
          Container(
            height: 500,
            child: Stack(
              children: [
                GetBuilder<addpetPageController>(builder: (controller) {
                  return DotIndicator(pcontroller: pcontroller);
                }),
                PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: pcontroller.pagecontroller,
                  children: [
                    addPet1(formGlobalKey: formGlobalKey1),
                    const addPet2(),
                    const addPet3(),
                    addPet4(formGlobalKey: formGlobalKey2),
                    const addPet5(),
                    addPet6()
                  ],
                ),
              ],
            ),
          ),
          GetBuilder<addpetPageController>(builder: (_) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              child: AddPetButton(
                formGlobalKey1: formGlobalKey1,
                formGlobalKey2: formGlobalKey2,
              ),
            );
          }),
        ],
      ),
    );
  }
}
