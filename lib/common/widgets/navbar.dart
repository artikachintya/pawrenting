import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/community/screens/community.dart';
import 'package:pawrentingreborn/features/home/screens/home.dart';
import 'package:pawrentingreborn/features/home/translatePet/translatePet.dart';
import 'package:pawrentingreborn/features/mypets/controllers/addPet/addpetPageController.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/features/mypets/screens/petlist/petlist.dart';
import 'package:pawrentingreborn/features/profile/screens/profile.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/device/device_utility.dart';

class InsideNavBar extends StatelessWidget {
  const InsideNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    NavBarController controller = Get.find();
    return Obx(() => Stack(clipBehavior: Clip.none, children: [
          NavigationBar(
              selectedIndex: controller.curIndex.value,
              onDestinationSelected: (index) {
                controller.curIndex.value = index;
                if (index == 0) {
                  Get.to(() => const Home());
                } else if (index == 1) {
                  Get.to(() => const PetList());
                } else if (index == 3) {
                  Get.to(() => const Community());
                } else if (index == 4) {
                  Get.to(() => Profile());
                }
              },
              height: 80,
              destinations: [
                NavigationDestination(
                    icon: ImageIcon(
                      AssetImage(TImages.homeIcon),
                      color: TColors.accent,
                      size: 28,
                    ),
                    label: 'Home'),
                NavigationDestination(
                    icon: ImageIcon(AssetImage(TImages.myPetIcon),
                        color: TColors.accent, size: 28),
                    label: 'My Pets'),
                NavigationDestination(
                  icon: SizedBox
                      .shrink(), // Invisible placeholder to maintain correct indices
                  label: '',
                ),
                NavigationDestination(
                    icon: ImageIcon(AssetImage(TImages.communityIcon),
                        color: TColors.accent, size: 28),
                    label: 'Community'),
                NavigationDestination(
                    icon: ImageIcon(AssetImage(TImages.profileIcon),
                        color: TColors.accent, size: 28),
                    label: 'Profile'),
              ]),
          Positioned(
              left: TDeviceUtil.getViewWidth(context) / 2 - 50,
              bottom: TDeviceUtil.getAppBarHeight() - 15,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: GestureDetector(
                  onTap: () {
                    Get.to(TranslatePet());
                    controller.curIndex.value = 2;
                  },
                  child: Container(
                      padding: EdgeInsets.all(12),
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(color: TColors.accent),
                      child: ImageIcon(
                        AssetImage(TImages.translateIcon),
                        size: 72,
                        color: Colors.white,
                      )),
                ),
              ))
        ]));
  }
}
