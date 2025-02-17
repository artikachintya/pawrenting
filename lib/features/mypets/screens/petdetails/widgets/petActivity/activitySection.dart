import 'package:flutter/material.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/petActivity/activityCard.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/petFoods/foodCard.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/petVaccine/vaccineList.dart';

class ActivitySection extends StatelessWidget {
  const ActivitySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return 
          GridView.builder(
          itemCount: 4,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 10,
          mainAxisExtent: 90
          ),
          itemBuilder: (_, index) => ActivityCard(name: 'Monthly Grooming', time: '07 February 2025', location: 'BCA Learning Institute',)
        );
  }
}