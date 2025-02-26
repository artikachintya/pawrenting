import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/home/translatePet/views/camera_view.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/navigationMenu.dart';

class TranslatePet extends StatelessWidget {
  const TranslatePet({super.key});

  @override
  Widget build(BuildContext context) {
    NavBarController controller = Get.find();
    NavigationController navcontroller = Get.find();
    return Scaffold(
      appBar: TAppBar2(title: 'Translate Pet', subtitle: 'Detect and translate your pet\'s language'),
      bottomNavigationBar: InsideNavBar(controller: controller, navcontroller: navcontroller),
      body: CameraView(),
    );
  }
}