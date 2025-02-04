
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/petVaccine.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/petfoods.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/petDetails/needs.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class OtherNeeds extends StatelessWidget {
  const OtherNeeds({
    super.key,
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
        Needs(icon: TImages.exercise, needs: 'Activity',),
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