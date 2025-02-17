
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/mypets/controllers/addPet/petController.dart';
import 'package:pawrentingreborn/features/mypets/controllers/addPet/petTypeButtonCont.dart';
import 'package:pawrentingreborn/features/mypets/screens/addpet/widgets/petTypeButton.dart';

class addPet2 extends StatelessWidget {
  const addPet2({
    super.key,
  });

  @override

  Widget build(BuildContext context) {
  PetController petController = Get.find();
  PetTypeButtonController controller = Get.find();
    return Padding(
       padding: const EdgeInsetsDirectional.symmetric(horizontal: 32, vertical: 125),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           SizedBox(
             // color: Colors.red.withAlpha(100),
             height: 250,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 SizedBox(
                   // color: Colors.red.withAlpha(100),
                   width: 250,
                   child: Text(
                     'What kind of pet do you have?',
                     style: Theme.of(context).textTheme.headlineLarge,
                     textAlign: TextAlign.center,
                     ),
                 ),
                 Form(
                   child: PetTypeButton(controller: controller,),
                   
                 ),
                 const SizedBox(height: 10,)
               ],
             ),
           ),
          
         ],
       ),
     );
  }
}