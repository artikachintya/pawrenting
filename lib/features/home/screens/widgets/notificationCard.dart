import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/home/screens/Notification/notificationDetail.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/size.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: ()=> Get.to(()=>NotificationDetail(notif: notif,)),
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: TSize.hPad, vertical: TSize.vPad),
        decoration: BoxDecoration(
            color: TColors.gray, borderRadius: BorderRadius.circular(10)),
        height: 105,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello Kimdash! Welcome to Pawrenting!',
              style: TextStyle(
                  fontSize: TSize.fontSizeL, fontWeight: FontWeight.w900),
            ),
            Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              'Welcome to Pawrenting! We\'re so excited to see you here!',
              style: TextStyle(
                fontSize: TSize.fontSizeS,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
