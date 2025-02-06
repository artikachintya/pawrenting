
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pawrentingreborn/features/mypets/controllers/petController.dart';
import 'package:pawrentingreborn/features/mypets/screens/addpet/classes/catBreeds.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:get/get.dart';

class addPet4 extends StatelessWidget {
  const addPet4({
    super.key,
    required this.formGlobalKey,
  });

  final formGlobalKey;
  @override
  Widget build(BuildContext context) {
    final date = TextEditingController();
    PetController petController = Get.find();
    String? selectedBreed = catBreeds.first;
    return Padding(
       padding: const EdgeInsetsDirectional.symmetric(horizontal: 32, vertical: 125),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           SizedBox(
            // color: TColors.accent.withAlpha(100),
            height: 300,
            width: double.maxFinite,
            child: Form(
              key: formGlobalKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    height: 70,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('When was your pet born?', style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),),
                        const Text('Date of Birth',style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 138, 138, 138), fontWeight: FontWeight.bold) ),
                        SizedBox(
                          height: 25,
                          child: TextFormField(
                            textAlignVertical: const TextAlignVertical(y: -0.5),
                            controller: date,
                            readOnly: true,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.calendar_month,
                                  size: 18,
                                ),
                                border: OutlineInputBorder(),
                                filled: true,
                                fillColor: TColors.gray
                            ),
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2101),
                              );
                              if (pickedDate != null) {
                                petController.updatePet(dateOfBirth: pickedDate);
                                date.text = DateFormat('dd MMMM yyyy').format(pickedDate);
                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your pet\'s date of birth';
                              }
                              else{          
                                return null;
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    height: 70,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('How\'s your pet now?', style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 160,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Weight',style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 138, 138, 138), fontWeight: FontWeight.bold) ),
                                  SizedBox(
                                    height: 25,
                                    child: TextFormField(
                                      keyboardType: const TextInputType.numberWithOptions(),
                                      textAlignVertical: const TextAlignVertical(y: -0.5),
                                      decoration: const InputDecoration(
                                        suffixIconConstraints: BoxConstraints(),
                                        suffixIcon: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 12),
                                          child: Text(
                                            'kg',
                                            style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Alata'
                                          ), 
                                          ),
                                        ),                     
                                        border: OutlineInputBorder(),
                                        filled: true,
                                        fillColor: TColors.gray
                                      ),
                                      validator: (value) {
                                        if(value == null || value.isEmpty){
                                          return 'Please enter your pet\'s weight';
                                        }
                                        double? weight = double.tryParse(value);
                                        if (weight == null) {
                                          return 'Please enter a valid number';
                                        } else {
                                          petController.updatePet(weight: weight);
                                          return null;
                                        }
                                      },
                                    ),
                                  )
                                ]
                              ),
                            ),
                            SizedBox(
                              width: 160,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Height',style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 138, 138, 138), fontWeight: FontWeight.bold) ),
                                  SizedBox(
                                    height: 25,
                                    child: TextFormField(
                                      keyboardType: const TextInputType.numberWithOptions(),
                                      textAlignVertical: const TextAlignVertical(y: -0.5),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        filled: true,
                                        suffixIconConstraints: BoxConstraints(),
                                        suffixIcon: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 12),
                                          child: Text(
                                            'cm',
                                            style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Alata'
                                          ), 
                                          ),
                                        ),                                    
                                        fillColor: TColors.gray,
                                      ),
                                        validator: (value) {
                                        if(value == null || value.isEmpty){
                                          return 'Please enter your pet\'s height';
                                        }
                                        double? height = double.tryParse(value);
                                        if (height == null) {
                                          return 'Please enter a valid number';
                                        } else {
                                          petController.updatePet(height: height);
                                          return null;
                                        }
                                      },
                                    ),
                                  )
                                ]
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    height: 85,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('What is your pet\'s breed?', style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),),
                        const Text('Breed',style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 138, 138, 138), fontWeight: FontWeight.bold) ),
                        SizedBox(
                          height: 40,
                          child: DropdownButtonFormField(
                            isDense: true,
                            value: selectedBreed,
                            items: catBreeds.map((String breed) {
                              return DropdownMenuItem(
                                value: breed,
                                child: Text(breed),
                              );
                            }).toList(),
                            onChanged: (value) {
                              selectedBreed = value;
                              petController.updatePet(breed: selectedBreed);
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: TColors.gray
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    height: 70,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Any allergies?', style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),),
                        const Text('Allergies',style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 138, 138, 138), fontWeight: FontWeight.bold) ),
                        SizedBox(
                          height: 25,
                          child: TextFormField(
                            textAlignVertical: const TextAlignVertical(y: -0.5),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: TColors.gray
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
           ),
         ],
       ),
     );
  }
}
