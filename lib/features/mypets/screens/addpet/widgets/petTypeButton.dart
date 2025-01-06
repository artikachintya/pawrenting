
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/mypets/controllers/petController.dart';
import 'package:pawrentingreborn/features/mypets/controllers/petTypeButtonCont.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class PetTypeButton extends StatelessWidget {
  const PetTypeButton({
    super.key,
    required this.controller
  });

  final controller;
  @override
  Widget build(BuildContext context) {
    return Container(
     child: GetBuilder<PetTypeButtonController>(
       builder: (context) {
         return Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             Container(
               height: 100,
               width: 100,
                 child: ElevatedButton(
                   style: ButtonStyle(
                     elevation: MaterialStateProperty.all<double>(1),
                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                       RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(15),
                         side: controller.dog
                         ? BorderSide(
                          color: TColors.accent,
                         )
                         : BorderSide.none
                       )
                     )
                   ),
                   onPressed: (){
                    controller.selectDog();
                   }, 
                   child: Padding(
                     padding: EdgeInsets.symmetric(vertical: 12),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Image(
                           image: AssetImage(TImages.dogIcon),
                           color: TColors.accent,
                           fit: BoxFit.fill,
                           height: 55,
                         ),
                         Text(
                           'Dog',
                           style: TextStyle(
                             fontFamily: 'Alata',
                             fontSize: 12,
                             fontWeight: FontWeight.bold,
                             color: Colors.black
                           )
                           )
                       ],
                     ),
                   ),
                 ),
               ),
             Container(
               height: 100,
               width: 100,
                 child: ElevatedButton(
                   style: ButtonStyle(
                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                       RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(15),
                        side: controller.cat
                         ? BorderSide(
                          color: TColors.accent,
                         )
                         : BorderSide.none
                       ),                 
                     )
                   ),
                   onPressed: (){
                    controller.selectCat();
                   }, 
                   child: Padding(
                     padding: EdgeInsets.symmetric(vertical: 12),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Image(
                           image: AssetImage(TImages.catIcon),
                           color: TColors.accent,
                           fit: BoxFit.fill,
                           height: 55,
                         ),
                         Text(
                           'Cat',
                           style: TextStyle(
                             fontFamily: 'Alata',
                             fontSize: 12,
                             fontWeight: FontWeight.bold,
                             color: Colors.black
                           )
                           )
                       ],
                     ),
                   ),
                 ),
               )
         
           ],
         );
       }
     ),
    );
  }
}
