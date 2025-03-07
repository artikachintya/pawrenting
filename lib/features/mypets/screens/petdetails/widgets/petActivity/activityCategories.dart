
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/mypets/controllers/ActivityController.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/petActivity/activityCategory.dart';

class ActivityCategories extends StatelessWidget {
  final dynamic category;

  const ActivityCategories({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    ActivityController activityController = Get.find();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          child: ActivityCategory(
            category: "All",
            selected: category == 0? true : false,
          ),
          onTap: () => activityController.selectCategory(0),
        ),
        GestureDetector(
          child: ActivityCategory(
            category: 'Grooming',
            selected: category == 1? true : false,
          ),
          onTap: () => activityController.selectCategory(1),
        ),
        GestureDetector(
          child: ActivityCategory(
            category: 'Exercise',
            selected: category == 2? true : false,
          ),
          onTap: () => activityController.selectCategory(2),
        ),
      ],
    );
  }
}
