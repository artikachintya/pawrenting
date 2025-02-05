import 'package:flutter/material.dart';
import 'package:pawrentingreborn/features/mypets/screens/petlist/widgets/cardBody2.dart';
import 'package:pawrentingreborn/features/mypets/screens/petlist/widgets/cardBodyTop.dart';
import 'package:pawrentingreborn/features/mypets/screens/petlist/widgets/cardHeader.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class PetCard extends StatelessWidget {
  const PetCard({super.key,
    required this.isCat,
    required this.imgstr,
  });

  final isCat;
  final String imgstr;
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 195,
      width: 360,
      child: Stack(
        children: [
          const Image(image: AssetImage(TImages.petCard)),
          cardHeader(isCat: isCat),
          Positioned(
            top: 55,
            child: SizedBox(
              // color: Colors.red.withAlpha(100),
              height: 126,
              width: 370,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        height: 100,
                        width: 75,
                        child: Image(image: AssetImage(imgstr), fit: BoxFit.fill,),
                      ),
                    ),

                    const SizedBox(
                      height: 100,
                      width: 250,
                      // color: Colors.red.withAlpha(100),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          cardBodyTop(name: 'Whiskey', breed: 'European Shorthair', age: '15 y.o'),
                          CardBody2(field1: 'DoB', field2: 'Weight', val1: '04-01-2009', val2: '3 kg',),
                          CardBody2(field1: 'Gender', field2: 'Height', val1: 'Female', val2: '15 cm',),
                        ],
                      ),
                    )
                  ],
                ),
              ),
           )
          )
        ],
      ),
    );
  }
}
