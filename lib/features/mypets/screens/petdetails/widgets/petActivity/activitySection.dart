import 'package:flutter/material.dart';
import 'package:pawrentingreborn/features/mypets/models/ActivityModel.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/petActivity/activityCard.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/petFoods/foodCard.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/petVaccine/vaccineList.dart';

class ActivitySection extends StatelessWidget {
  final List<ActivityModel> activities;
  const ActivitySection({
    super.key,
    required this.activities,
  });

  @override
  Widget build(BuildContext context) {
    return 
          GridView.builder(
          itemCount: activities.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 10,
          mainAxisExtent: 90
          ),
          itemBuilder: (_, index) => ActivityCard(activity: activities[index],)
        );
  }
}