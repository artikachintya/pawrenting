import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/mypets/controllers/PetFoodController.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/petFoods/foodCard.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/petVaccine/vaccineList.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';

class FoodSection extends StatelessWidget {
  const FoodSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PetFoodController foodController = Get.find();

    return Obx(() {
      if (foodController.petFoods.isEmpty) {
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
                        'This section is empty!',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        return GridView.builder(
            itemCount: foodController.petFoods.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, mainAxisSpacing: 10, mainAxisExtent: 90),
            itemBuilder: (_, index) => FoodCard(
                  food: foodController.petFoods[index],
                ));
      }
    });
  }
}
