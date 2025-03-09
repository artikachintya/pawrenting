import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/mypets/controllers/addPet/addpetPageController.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/device/device_utility.dart';

class InsideNavBar extends StatelessWidget {
  const InsideNavBar({
    super.key,
    required this.controller,
    required this.navcontroller,
  });

  final NavBarController controller;
  final NavigationController navcontroller;

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      NavigationBar(
          selectedIndex: controller.curIndex,
          // onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: Colors.white,
          onDestinationSelected: (index) => {
                if (navcontroller.selectedIndex.value == 1)
                  {
                    // addpetPageController.instance.reset(),
                    navcontroller.selectedIndex.value = index,
                    print('anjay'),
                    Get.to(() => const NavigationMenu())
                  }
                else
                  {
                    navcontroller.selectedIndex.value = index,
                    Get.to(() => const NavigationMenu())
                  }
              },
          height: 80,
          destinations: const [
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
            SizedBox(
              width: 100,
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
          bottom: TDeviceUtil.getAppBarHeight() - 50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
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
          ))
    ]);
  }
}
