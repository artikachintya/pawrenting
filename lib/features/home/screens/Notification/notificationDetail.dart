import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/home/controllers/NotifController.dart';
import 'package:pawrentingreborn/features/home/models/notifModel.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/size.dart';
import 'package:pawrentingreborn/utils/helpers/file_helper.dart';

class NotificationDetail extends StatelessWidget {
  final NotifModel notif;
  const NotificationDetail({super.key, required this.notif});

  @override
  Widget build(BuildContext context) {
    NavBarController controller = Get.find();

    return Scaffold(
      bottomNavigationBar: InsideNavBar(),
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
            child: Container(
              decoration: BoxDecoration(
                  color: TColors.gray, borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: TSize.verticalSpacing,
                children: [
                  Container(
                    child: notif.image != null && notif.image!.isNotEmpty
                        ? Image.asset(notif.image!,
                            width: 311, height: 126, fit: BoxFit.cover)
                        : Icon(Icons.notifications, size: 50),
                  ),
                  Text(
                    notif.title,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Albert Sans'),
                  ),
                  Text(
                    notif.content,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Alata',
                        color: TColors.grayPrice),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
