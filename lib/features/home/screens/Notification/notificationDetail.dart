import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/size.dart';
import 'package:pawrentingreborn/utils/helpers/file_helper.dart';

class NotificationDetail extends StatelessWidget {
  const NotificationDetail({super.key});

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
            child: Container(
              decoration: BoxDecoration(
                  color: TColors.gray, borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: TSize.verticalSpacing,
                children: [
                  Image(
                    image: AssetImage(TImages.welcomeNotif),
                    fit: BoxFit.fitWidth,
                  ),
                  Text(
                    'Hello Kimdash! Welcome to Pawrenting!',
                    style: TextStyle(
                        fontSize: TSize.fontSizeL, fontWeight: FontWeight.w900),
                  ),
                  FutureBuilder<String>(
                    future:
                        FileHelper.loadTextFile('assets/text/welcomeNotif.txt'),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text(
                          'Error: ${snapshot.error}',
                          style: TextStyle(color: TColors.grayFont),
                        );
                      } else {
                        return Text(snapshot.data ?? '');
                      }
                    },
                  )
                ],
              ),
            )),
      ),
    );
  }
}
