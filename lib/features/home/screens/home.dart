import 'package:flutter/material.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/features/mypets/screens/addpet/addPet4.dart';
import 'package:pawrentingreborn/features/mypets/screens/addpet/classes/catBreeds.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    String? selectedBreed = catBreeds.first;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TAppBar2(title: TTexts.appBarFoodTitle, subtitle: TTexts.appBarFoodSub,),
            SizedBox(
                          height: 125,
                          child: DropdownButtonFormField(
                            value: selectedBreed,
                            items: catBreeds.map((String breed) {
                              return DropdownMenuItem(
                                value: breed,
                                child: Text(breed),
                              );
                            }).toList(),
                            onChanged: (value) {
                              selectedBreed = value;
                              print(selectedBreed);
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: TColors.gray
                            ),
                          ),
                        )
          ],
        ),
      ),
    );
  }
}