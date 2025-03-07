
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/mypets/controllers/ActivityController.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/petActivity.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/petVaccine.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/petfoods.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/petDetails/needs.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

import '../../../../models/PetModel.dart';

class OtherNeeds extends StatelessWidget {
  final PetModel pet;
  const OtherNeeds({
    super.key, required this.pet
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Other Needs',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Alata',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5
                ),
                )
            ],
          ),
        ),
        SizedBox(height: 10),
        GestureDetector(
          child: Needs(icon: TImages.exercise, needs: 'Activity',),
          onTap: () {
    ActivityController activityController = Get.find();
    activityController.initActivityList(pet.id);
            Get.to(()=>PetActivity(pet: pet));
          }, 
          ),
        SizedBox(height: 10),
        GestureDetector(
          child: Needs(icon: TImages.food, needs: 'Foodies',),
          onTap: () {
            Get.to(()=>PetFood());
          }
        ),        
        SizedBox(height: 10),
        GestureDetector(
          child: Needs(icon: TImages.vaccine, needs: 'Vaccine',),
          onTap: () {
            Get.to(()=>PetVaccine());
          }
          ),       
      ]
    );
  }
}