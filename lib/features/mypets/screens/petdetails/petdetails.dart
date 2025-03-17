// ignore_for_file: prefer__constructors

import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/features/mypets/models/PetModel.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/petDetails/otherNeeds.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/petDetails/petDiary.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/petDetails/petInfo.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class PetDetails extends StatelessWidget {
  final PetModel pet;
  const PetDetails({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    Uint8List? imageBytes;
    try {
      imageBytes = base64Decode(pet.image);
    } catch (e) {
      debugPrint("Error decoding image: $e");
    }
    NavBarController controller = Get.find();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: TAppBar(onMain: false, onPetDetails: true),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 1200,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                height: 350,
                width: 420,
                child: imageBytes != null
                    ? Image.memory(imageBytes, fit: BoxFit.cover)
                    : const Icon(Icons.image_not_supported),
              ),
              Positioned(
                top: 290,
                child: Container(
                  height: 1000,
                  width: 380,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: TColors.primary,
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image:
                              AssetImage('assets/login/wallpaper-login.png'))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(pet.name,
                                        style: TextStyle(
                                            fontSize: 40,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Alata',
                                            letterSpacing: 1.75)),
                                    Text(
                                      pet.breed,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Alata',
                                          height: 0.9),
                                    )
                                  ]),
                              Text(
                                pet.ageInYearsAndMonths,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Alata'),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PetInfo(
                              type: 'Gender',
                              value: pet.gender,
                              color: Color(0xffFEF1A3),
                            ),
                            PetInfo(
                              type: 'Height',
                              value: '${pet.height} cm',
                              color: Color(0xffE5FC95),
                            ),
                            PetInfo(
                              type: 'Weight',
                              value: '${pet.weight} kg',
                              color: Color(0xffFEF1A3),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        PetDiary(
                          pet: pet,
                        ),
                        SizedBox(height: 15),
                        OtherNeeds(
                          pet: pet,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: InsideNavBar(),
    );
  }
}
