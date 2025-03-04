import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/home/controllers/NotifController.dart';
import 'package:pawrentingreborn/features/home/models/notifModel.dart';
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
    final notifController = Get.put(Notifcontroller());

    return Scaffold(
      bottomNavigationBar:
          InsideNavBar(controller: controller, navcontroller: navcontroller),
      appBar: TAppBar2(title: 'Notification', subtitle: 'What\'s new?'),
      backgroundColor: TColors.primary,
      body: Obx(
        () => notifController.notifList.isEmpty
            ? Center(child: Text('No notifications available'))
            : Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                    horizontal: TSize.hPad, vertical: TSize.vPad),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(TImages.paws), fit: BoxFit.cover)),
                child: ListView.builder(
                  itemCount: notifController.notifList.length,
                  itemBuilder: (context, index) {
                    NotifModel notif = notifController.notifList[index];
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: ListTile(
                        leading: notif.image != null && notif.image!.isNotEmpty
                            ?Image.asset(notif.image!, width: 50, height: 50, fit: BoxFit.cover)
                            : Icon(Icons.notifications, size: 50),
                        title: Text(notif.title, style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(notif.content),
                        onTap: () {
                          print('Tapped on: ${notif.title}');
                        },
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
