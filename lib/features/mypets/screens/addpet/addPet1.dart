
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/mypets/controllers/addPet/petController.dart';

class addPet1 extends StatelessWidget {
  const addPet1({
    super.key,
    final form,
    required this.formGlobalKey
  });

  final formGlobalKey;
  @override
  Widget build(BuildContext context) {
    PetController petController = Get.find();
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
                   width: 200,
                   child: Text(
                     'What\'s your pet name?',
                     style: Theme.of(context).textTheme.headlineLarge,
                     textAlign: TextAlign.center,
                     ),
                 ),
                 Form(
                  key: formGlobalKey,
                   child: TextFormField(
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Please enter your pet name';
                      }
                      else{
                        petController.nameController.text = value;
                        return null;
                      }
                    },
                     textAlign: TextAlign.center,
                     decoration: const InputDecoration(
                       label: Center(
                         child: Text(
                           'Enter your pet name',
                         ),
                       )
                     )
                   )
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
