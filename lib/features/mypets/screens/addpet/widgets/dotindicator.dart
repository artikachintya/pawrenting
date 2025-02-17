
import 'package:flutter/material.dart';
import 'package:pawrentingreborn/features/mypets/controllers/addPet/addpetPageController.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/device/device_utility.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    required this.pcontroller,
  });

  final addpetPageController pcontroller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30,
      left: TDeviceUtil.getViewWidth(context)/2 - 70,
      child: SizedBox(
        // color: TColors.accent.withAlpha(100),
        width: 140,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SmoothPageIndicator(
                controller: pcontroller.pagecontroller, 
                count: 6,
                effect: const ScaleEffect(
                  spacing: 16,
                  dotWidth: 8,
                  dotHeight: 8,
                  scale: 1.9,
                  activeDotColor: TColors.accent
                )
                ),
            ),
          ],
        )
        )
      );
  }
}
