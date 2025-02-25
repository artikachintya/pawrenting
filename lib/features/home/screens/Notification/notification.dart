import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/home/screens/widgets/notificationCard.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/size.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    NavBarController controller = Get.find();
    NavigationController navcontroller = Get.find();
    return Scaffold(
      bottomNavigationBar:
          InsideNavBar(controller: controller, navcontroller: navcontroller),
      appBar: TAppBar2(title: 'Notification', subtitle: 'What\'s new?'),
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
              horizontal: TSize.hPad, vertical: TSize.vPad),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(TImages.paws), fit: BoxFit.cover)),
          child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, mainAxisSpacing: 10, mainAxisExtent: 105),
              itemBuilder: (_, index) {
                return NotificationCard();
              }),
        ),
      ),
    );
  }
}
