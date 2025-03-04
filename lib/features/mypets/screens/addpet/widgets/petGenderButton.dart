
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/mypets/controllers/addPet/AddPetController.dart';
import 'package:pawrentingreborn/features/mypets/controllers/addPet/petGender.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class PetGenderButton extends StatelessWidget {
  const PetGenderButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PetGenderButtonController controller = Get.find();
    final PetController petController = Get.find();
    return Container(
     child: GetBuilder<PetGenderButtonController>(
       builder: (context) {
         return Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             SizedBox(
               height: 100,
               width: 100,
                 child: ElevatedButton(
                   style: ButtonStyle(
                     shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                       RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(15),
                        side: controller.male
                         ? const BorderSide(
                          color: TColors.accent,
                         )
                         : BorderSide.none
                       )
                     )
                   ),
                   onPressed: (){
                    controller.selectmale();
                    petController.genderController.text = 'Male';
                   }, 
                   child: const Padding(
                     padding: EdgeInsets.symmetric(vertical: 12),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Image(
                           image: AssetImage(TImages.maleIcon),
                           color: TColors.accent,
                           fit: BoxFit.fill,
                           height: 55,
                         ),
                         Text(
                           'Male',
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
             SizedBox(
               height: 100,
               width: 100,
                 child: ElevatedButton(
                   style: ButtonStyle(
                     shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                       RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(15),
                        side: controller.female
                         ? const BorderSide(
                          color: TColors.accent,
                         )
                         : BorderSide.none
                       )
                     )
                   ),
                   onPressed: (){
                    controller.selectfemale();
                    petController.genderController.text = 'Female';
                   }, 
                   child: const Padding(
                     padding: EdgeInsets.symmetric(vertical: 12),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Image(
                           image: AssetImage(TImages.femaleIcon),
                           color: TColors.accent,
                           fit: BoxFit.fill,
                           height: 55,
                         ),
                         Text(
                           'Female',
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