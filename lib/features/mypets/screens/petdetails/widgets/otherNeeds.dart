
import 'package:flutter/material.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/needs.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class OtherNeeds extends StatelessWidget {
  const OtherNeeds({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
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
        Needs(icon: TImages.food, needs: 'Foodies',),
        SizedBox(height: 10),
        Needs(icon: TImages.vaccine, needs: 'Vaccine',),       
      ]
    );
  }
}