
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/mypets/controllers/petActivity/petActivityController.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/petActivity/activityCategory.dart';

class ActivityCategories extends StatelessWidget {
  final dynamic category;

  const ActivityCategories({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final PetActivityController controller = Get.find();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          child: ActivityCategory(
            category: "Grooming",
            selected: category == 0? true : false,
          ),
          onTap: () => controller.selectCategory(0),
        ),
        GestureDetector(
          child: ActivityCategory(
            category: 'Exercise',
            selected: category == 1? true : false,
          ),
          onTap: () => controller.selectCategory(1),
        ),
        GestureDetector(
          child: ActivityCategory(
            category: 'Other',
            selected: category == 2? true : false,
          ),
          onTap: () => controller.selectCategory(2),
        ),
      ],
    );
  }
}
