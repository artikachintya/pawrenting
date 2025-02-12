import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/shoppingCart/mycart.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/device/device_utility.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget{
  const TAppBar({
    super.key,
    this.title,
    required this.onMain,
    required this.onPetDetails
    });

  final Widget? title;
  final bool onMain;
  final bool onPetDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: AppBar(
        toolbarHeight: 60,
        elevation: onPetDetails
        ? 0
        : 5,

        backgroundColor: onPetDetails
        ? Colors.transparent
        : Colors.white,
        foregroundColor: onPetDetails
        ? Colors.white
        : Colors.black,
        surfaceTintColor: Colors.white,
        title: onMain
        ? null
        : title,
        titleSpacing: 0,
        leadingWidth: onMain
        ? 175
        : 50,
        leading: onMain
        ? Container(
          margin: const EdgeInsets.only(left: 16),
          child: const ImageIcon(AssetImage(TImages.pawrentingLogo), color: TColors.accent),
        )
        : IconButton(onPressed: () => Get.back(), icon: const ImageIcon(AssetImage(TImages.arrowBackIcon), size: 20,)),
        actions: onMain
        ? [
          Stack(
            children: [
              IconButton(onPressed: () {}, icon: const ImageIcon(AssetImage(TImages.notifIcon), size: 28, color: TColors.accent)),
              Positioned(
                top: 5,
                right: 5,
                child: Container(
                  alignment: const Alignment(0, 0),
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: TColors.accent,
                  ),
                  child: Text(
                    '12',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Alata',
                      fontSize: 10
                    ),
                  ),
                ),
              )
            ]
          ),
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: Stack(
              children: [
                IconButton(onPressed: () {
                  Get.to(()=>MyCart());
                }, icon: const ImageIcon(AssetImage(TImages.cartIcon), size: 28, color: TColors.accent,)),
                Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                    alignment: const Alignment(0, 0),
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: TColors.accent,
                    ),
                    child: Text(
                      '1',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Alata',
                      fontSize: 10
                    ),
                    ),
                  ),
                )
              ]
            ),
          ),
        ]
        : [const ImageIcon(AssetImage(TImages.more), size: 32,)]
      ),
      );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtil.getAppBarHeight());
}