import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/mypets/controllers/ActivityController.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/petActivity/activityCard.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';

class ActivitySection extends StatelessWidget {
  const ActivitySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ActivityController activityController = Get.find();
    return Obx(() {
      List activitiesToShow;
      switch (activityController.category.value) {
        case 1:
          activitiesToShow = activityController.grooming;
          break;
        case 2:
          activitiesToShow = activityController.exercise;
          break;
        default:
          activitiesToShow = activityController.activities;
      }

      if (activitiesToShow.isEmpty) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 70),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center vertically
              children: [
                Container(
                  height: 125,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: TColors.gray,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Text(
                        'This category is empty!',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }

      return GridView.builder(
        itemCount: activitiesToShow.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 10,
          mainAxisExtent: 90,
        ),
        itemBuilder: (_, index) => ActivityCard(
          activity: activitiesToShow[index],
        ),
      );
    });
  }
}
