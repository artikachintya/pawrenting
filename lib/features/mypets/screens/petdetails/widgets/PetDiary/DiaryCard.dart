
import 'package:flutter/material.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/size.dart';

class DiaryCard extends StatelessWidget {
  const DiaryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSize.cardRadius),
        color: Colors.white,
        border: Border.all(color: TColors.accent),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 15, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Whiskey Vaccination',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Added 8.30 PM',
              style: TextStyle(
                  fontFamily: 'Alata',
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: TColors.grayFont),
            ),
            SizedBox(height: TSize.verticalSpacing,),
            Container(
              height: 150,
                child: Image(
                    image: AssetImage(TImages.whiskeyVaccine)
                    )
            ),
            SizedBox(height: TSize.verticalSpacing,),
            Text(
              'Today I took Whiskey to the vet for her feline vaccination. She refused to take it.'
              ' I had to hold her while the vet injected her. She was very angry at me afterwards.',
              style: TextStyle(
                  fontFamily: 'Alata',
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
