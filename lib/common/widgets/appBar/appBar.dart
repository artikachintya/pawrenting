import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/home/controllers/CartController.dart';
import 'package:pawrentingreborn/features/home/screens/Cart/Cart.dart';
import 'package:pawrentingreborn/features/home/screens/Notification/notification.dart';
import 'package:pawrentingreborn/features/mypets/screens/editpet/editPet.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/device/device_utility.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar(
      {super.key,
      this.title,
      required this.onMain,
      required this.onPetDetails});

  final Widget? title;
  final bool onMain;
  final bool onPetDetails;

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.find();
    return Padding(
      padding: const EdgeInsets.all(0),
      child: AppBar(
          toolbarHeight: 60,
          elevation: onPetDetails ? 0 : 5,
          backgroundColor: onPetDetails ? Colors.transparent : Colors.white,
          foregroundColor: onPetDetails ? Colors.white : Colors.black,
          surfaceTintColor: Colors.white,
          title: onMain ? null : title,
          titleSpacing: 0,
          leadingWidth: onMain ? 175 : 50,
          leading: onMain
              ? Container(
                  margin: const EdgeInsets.only(left: 16),
                  child: const ImageIcon(AssetImage(TImages.pawrentingLogo),
                      color: TColors.accent),
                )
              : IconButton(
                  onPressed: () => Get.back(),
                  icon: const ImageIcon(
                    AssetImage(TImages.arrowBackIcon),
                    size: 20,
                  )),
          actions: onMain
              ? [
                  Stack(children: [
                    IconButton(
                        onPressed: () {
                          Get.to(() => NotificationPage());
                        },
                        icon: const ImageIcon(AssetImage(TImages.notifIcon),
                            size: 28, color: TColors.accent)),
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
                              fontSize: 10),
                        ),
                      ),
                    )
                  ]),
                  Obx(() => AnimatedScale(
                        duration: const Duration(milliseconds: 200),
                        scale: cartController.scaleFactor.value,
                        child: Container(
                          margin: const EdgeInsets.only(right: 16),
                          child: Stack(children: [
                            IconButton(
                                onPressed: () {
                                  Get.to(() => MyCart());
                                },
                                icon: const ImageIcon(
                                  AssetImage(TImages.cartIcon),
                                  size: 28,
                                  color: TColors.accent,
                                )),
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
                                  child: Obx(
                                    () => Text(
                                      cartController.noOfCartItems.value
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Alata',
                                          fontSize: 10),
                                    ),
                                  )),
                            )
                          ]),
                        ),
                      )),
                ]
              : [
                  GestureDetector(
                    child: ImageIcon(
                      AssetImage(TImages.more),
                      size: 32,
                      color: Colors.transparent,
                    ),
                    onTap: () => showMenu(
                      color: Colors.white,
                      context: context,
                      shape: ShapeBorder.lerp(
                          const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          0.5),
                      position: RelativeRect.fromLTRB(100, 75, 0, 0),
                      items: [
                        PopupMenuItem(
                          value: 'edit',
                          child: Row(
                            children: [
                              ImageIcon(
                                AssetImage(TImages.pencil),
                                size: 14,
                                color: TColors.accent,
                              ),
                              SizedBox(width: 5),
                              Text('Edit',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Albert Sans',
                                      color: TColors.accent,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          onTap: () {
                            Get.to(() => EditPet());
                          },
                          height: 25,
                        ),
                        PopupMenuItem(
                          value: 'Delete',
                          child: Row(
                            children: [
                              ImageIcon(
                                AssetImage(TImages.trash),
                                size: 14,
                                color: Colors.red,
                              ),
                              SizedBox(width: 5),
                              Text('Delete',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Albert Sans',
                                      color: Colors.red,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          height: 25,
                        ),
                      ],
                    ).then((value) {
                      if (value == 'edit') {
                        // Handle edit action
                      } else if (value == 'delete') {
                        // Handle delete action
                      }
                    }),
                  )
                ]),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtil.getAppBarHeight());
}
