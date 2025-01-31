// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/otherNeeds.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/petDiary.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/petInfo.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class PetDetails extends StatelessWidget {
  const PetDetails({super.key});
  
  @override
  Widget build(BuildContext context) {
    NavBarController controller = Get.find();
    NavigationController navcontroller = Get.find();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: TAppBar(onMain: false, onPetDetails: true),
      body: SingleChildScrollView(
        child: Container(
          height: 1200,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 350,
                width: 420,
                child: Image.asset(TImages.whiskey, fit: BoxFit.cover,)
              ),
              Positioned(
                top: 290,
                child: Container(
                  height: 1000,
                  width: 412,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: TColors.primary,
                  ),
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
                                  Text('Whiskey', style: TextStyle(fontSize: 40, color: Colors.black, fontWeight: FontWeight.w600, fontFamily: 'Alata', letterSpacing: 1.75)),
                                  Text(' Persian', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.normal, fontFamily: 'Alata', height: 0.9),)
                                ]
                              ),
                              Text('5 Months', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.normal, fontFamily: 'Alata'),)
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PetInfo(type: 'Gender', value: 'Female', color: Color(0xffFEF1A3),),
                            PetInfo(type: 'Height', value: '20 cm', color: Color(0xffE5FC95),),
                            PetInfo(type: 'Weight', value: '5 kg', color: Color(0xffFEF1A3),),
                          ],
                        ),
                        SizedBox(height: 15),
                        PetDiary(),
                        SizedBox(height: 15),
                        OtherNeeds()
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: InsideNavBar(controller: controller, navcontroller: navcontroller),
    );
  }
}
