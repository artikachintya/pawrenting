import 'package:flutter/material.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/petFoods/foodCard.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/petVaccine/vaccineList.dart';

class FoodSection extends StatelessWidget {
  const FoodSection({
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
          itemBuilder: (_, index) => FoodCard(food: 'Ati Ayam', time: '08.30 PM', amount: 150,)
        );
  }
}