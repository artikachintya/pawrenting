import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pawrentingreborn/features/mypets/models/PetModel.dart';
import 'package:pawrentingreborn/features/mypets/screens/petlist/widgets/cardBody2.dart';
import 'package:pawrentingreborn/features/mypets/screens/petlist/widgets/cardBodyTop.dart';
import 'package:pawrentingreborn/features/mypets/screens/petlist/widgets/cardHeader.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class PetCard extends StatelessWidget {
  final PetModel pet;
  const PetCard({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    Uint8List? imageBytes;
    try {
      imageBytes = base64Decode(pet.image);
    } catch (e) {
      debugPrint("Error decoding image: $e");
    }

    return SizedBox(
      height: 195,
      width: 360,
      child: Stack(
        children: [
          const Image(image: AssetImage(TImages.petCard)),
          cardHeader(isCat: pet.type.toLowerCase() == 'cat'),
          Positioned(
            top: 48,
            child: SizedBox(
              height: 126,
              width: 370,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        height: 100,
                        width: 75,
                        child: imageBytes != null
                            ? Image.memory(imageBytes, fit: BoxFit.fill)
                            : const Icon(Icons.image_not_supported),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      width: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          cardBodyTop(
                              name: pet.name,
                              breed: pet.breed,
                              age: pet.ageInYearsAndMonths),
                          CardBody2(
                            field1: 'DoB',
                            field2: 'Weight',
                            val1: DateFormat('dd/MM/yyyy').format(pet.dob),
                            val2: '${pet.weight} kg',
                          ),
                          CardBody2(
                            field1: 'Gender',
                            field2: 'Height',
                            val1: pet.gender,
                            val2: '${pet.height} cm',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
