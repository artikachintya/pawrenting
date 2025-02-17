import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pawrentingreborn/features/mypets/controllers/addPet/petController.dart';
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
      padding: const EdgeInsetsDirectional.only(
          start: 32, end: 32, top: 80, bottom: 200),
      child: Container(
        decoration: BoxDecoration(
            color: TColors.gray, borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 12, vertical: 20),
          child: Form(
            key: formGlobalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'When was your pet born?',
                        style: TextStyle(
                            fontSize: 19,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text('Date of Birth',
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 138, 138, 138),
                              fontWeight: FontWeight.bold)),
                      TextFormField(
                        controller: petController.dateOfBirthController,
                        readOnly: true,
                        decoration: const InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal:
                                    8), // Adjust the vertical padding here
                            prefixIcon: Icon(
                              Icons.calendar_month,
                              size: 18,
                            ),
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: TColors.gray),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (pickedDate != null) {
                            petController.dateOfBirthController.text =
                                DateFormat('dd MMMM yyyy').format(pickedDate);
                            petController.dateOfBirthController.value =
                                TextEditingValue(
                                    text: DateFormat('dd MMMM yyyy')
                                        .format(pickedDate));
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your pet\'s date of birth';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'How\'s your pet now?',
                        style: TextStyle(
                            fontSize: 19,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Weight',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color:
                                            Color.fromARGB(255, 138, 138, 138),
                                        fontWeight: FontWeight.bold)),
                                Container(
                                  height: 60,
                                  child: TextFormField(
                                    controller: petController.weightController,
                                    decoration: const InputDecoration(
                                        suffix: Text('kg'),
                                        isDense: true,
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 4,
                                            horizontal:
                                                8), // Adjust the vertical padding here
                                        border: OutlineInputBorder(),
                                        filled: true,
                                        fillColor: TColors.gray),
                                    validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Must not be empty';
                                    }
                                    double? weight = double.tryParse(value);
                                    if (weight == null) {
                                      return 'Must be a number';
                                    } else {
                                      petController.weightController.text = weight.toString();
                                      return null;
                                    }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Height',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color:
                                            Color.fromARGB(255, 138, 138, 138),
                                        fontWeight: FontWeight.bold)),
                                Container(
                                  height: 60,
                                  child: TextFormField(
                                    controller: petController.heightController,
                                    decoration: const InputDecoration(
                                      suffix: Text('cm'),
                                      isDense: true,
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 4,
                                        horizontal:
                                          8), // Adjust the vertical padding here
                                      border: OutlineInputBorder(),
                                      filled: true,
                                      fillColor: TColors.gray),
                                    validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Must not be empty';
                                    }
                                    double? height = double.tryParse(value);
                                    if (height == null) {
                                      return 'Must be a number';
                                    } else {
                                      petController.heightController.text = height.toString();
                                      return null;
                                    }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'What breed is your pet?',
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text('Breeds',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 138, 138, 138),
                                    fontWeight: FontWeight.bold)),
                                               Container(
                      height: 70,
                      width: 400,
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
                          petController.breedController.text = selectedBreed!;
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: TColors.gray),
                      ),
                    )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Container(
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                // //       const Text(
                //         'When was your pet born?',
                //         style: TextStyle(
                //             fontSize: 19,
                //             color: Colors.black,
                //             fontWeight: FontWeight.bold),
                //       ),
                //       const Text('Date of Birth',
                //           style: TextStyle(
                //               fontSize: 12,
                //               color: Color.fromARGB(255, 138, 138, 138),
                //               fontWeight: FontWeight.bold)),
                //       // Container(
                //       //   child: _buildTextField(controller: petController.dateOfBirthController, label: '', onTap: () async {
                //       //     DateTime? pickedDate = await showDatePicker(
                //       //       context: context,
                //       //       initialDate: DateTime.now(),
                //       //       firstDate: DateTime(2000),
                //       //       lastDate: DateTime(2101),
                //       //     );
                //       //     if (pickedDate != null) {
                //       //       petController.updatePet(dateOfBirth: pickedDate);
                //       //       date.text = DateFormat('dd MMMM yyyy').format(pickedDate);
                //       //     }
                //       //   }, validator: (value) {
                //       //     if (value == null || value.isEmpty) {
                //       //       return 'Please enter your pet\'s date of birth';
                //       //     } else {
                //       //       return null;
                //       //     }
                //       //   },),
                //       // ),
                //       TextFormField(
                //         controller: date,
                //         readOnly: true,
                //         decoration: const InputDecoration(
                //           isDense: true,
                //             contentPadding: EdgeInsets.symmetric(
                //                 vertical: 0, horizontal: 0),
                //             prefixIcon: Icon(
                //               Icons.calendar_month,
                //               size: 18,
                //             ),
                //             border: OutlineInputBorder(),
                //             filled: true,
                //             fillColor: TColors.gray),
                //         onTap: () async {
                //           DateTime? pickedDate = await showDatePicker(
                //             context: context,
                //             initialDate: DateTime.now(),
                //             firstDate: DateTime(2000),
                //             lastDate: DateTime(2101),
                //           );
                //           if (pickedDate != null) {
                //             petController.updatePet(dateOfBirth: pickedDate);
                //             date.text =
                //                 DateFormat('dd MMMM yyyy').format(pickedDate);
                //           }
                //         },
                //         validator: (value) {
                //           if (value == null || value.isEmpty) {
                //             return 'Please enter your pet\'s date of birth';
                //           } else {
                //             return null;
                //           }
                //         },
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // SizedBox(
                //   width: double.maxFinite,
                //   height: 70,
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       const Text(
                //         'How\'s your pet now?',
                //         style: TextStyle(
                //             fontSize: 18,
                //             color: Colors.black,
                //             fontWeight: FontWeight.bold),
                //       ),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           SizedBox(
                //             width: 160,
                //             child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   const Text('Weight',
                //                       style: TextStyle(
                //                           fontSize: 12,
                //                           color: Color.fromARGB(
                //                               255, 138, 138, 138),
                //                           fontWeight: FontWeight.bold)),
                //                   TextFormField(
                //                     keyboardType:
                //                         const TextInputType.numberWithOptions(),
                //                     textAlignVertical:
                //                         const TextAlignVertical(y: -0.5),
                //                     decoration: InputDecoration(
                //                       isDense: true,
                //                         suffixIconConstraints:
                //                             const BoxConstraints(),
                //                         suffixIcon: const Padding(
                //                           padding: EdgeInsets.symmetric(
                //                               horizontal: 12),
                //                           child: Text(
                //                             'kg',
                //                             style: TextStyle(
                //                                 fontSize: 12,
                //                                 fontWeight: FontWeight.bold,
                //                                 fontFamily: 'Alata'),
                //                           ),
                //                         ),
                //                         border: OutlineInputBorder(
                //                           borderRadius:
                //                               BorderRadius.circular(8),
                //                         ),
                //                         contentPadding:
                //                             const EdgeInsets.symmetric(
                //                                 vertical: 0, horizontal: 0),
                //                         errorStyle: TextStyle(
                //                             height: 0.8, fontSize: 12),
                //                         errorBorder: OutlineInputBorder(
                //                           borderSide: BorderSide(
                //                               color: Colors.red.shade700),
                //                         ),
                //                         focusedErrorBorder: OutlineInputBorder(
                //                           borderSide: BorderSide(
                //                               color: Colors.red.shade700),
                //                         ),
                //                         filled: true,
                //                         fillColor: TColors.gray),
                //                     validator: (value) {
                //                       if (value == null || value.isEmpty) {
                //                         return 'Please enter your pet\'s weight';
                //                       }
                //                       double? weight = double.tryParse(value);
                //                       if (weight == null) {
                //                         return 'Please enter a valid number';
                //                       } else {
                //                         petController.updatePet(weight: weight);
                //                         return null;
                //                       }
                //                     },
                //                   ),
                //                 ]),
                //           ),
                //           SizedBox(
                //             width: 160,
                //             child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   const Text('Height',
                //                       style: TextStyle(
                //                           fontSize: 12,
                //                           color: Color.fromARGB(
                //                               255, 138, 138, 138),
                //                           fontWeight: FontWeight.bold)),
                //                   SizedBox(
                //                     height: 25,
                //                     child: TextFormField(
                //                       keyboardType: const TextInputType
                //                           .numberWithOptions(),
                //                       textAlignVertical:
                //                           const TextAlignVertical(y: -0.5),
                //                       decoration: InputDecoration(
                //                           suffixIconConstraints:
                //                               const BoxConstraints(),
                //                           suffixIcon: const Padding(
                //                             padding: EdgeInsets.symmetric(
                //                                 horizontal: 12),
                //                             child: Text(
                //                               'kg',
                //                               style: TextStyle(
                //                                   fontSize: 12,
                //                                   fontWeight: FontWeight.bold,
                //                                   fontFamily: 'Alata'),
                //                             ),
                //                           ),
                //                           border: OutlineInputBorder(
                //                             borderRadius:
                //                                 BorderRadius.circular(8),
                //                           ),
                //                           contentPadding:
                //                               const EdgeInsets.symmetric(
                //                                   vertical: 15, horizontal: 7),
                //                           errorStyle: TextStyle(
                //                               height: 0.8, fontSize: 12),
                //                           errorBorder: OutlineInputBorder(
                //                             borderSide: BorderSide(
                //                                 color: Colors.red.shade700),
                //                           ),
                //                           focusedErrorBorder:
                //                               OutlineInputBorder(
                //                             borderSide: BorderSide(
                //                                 color: Colors.red.shade700),
                //                           ),
                //                           filled: true,
                //                           fillColor: TColors.gray),
                //                       validator: (value) {
                //                         if (value == null || value.isEmpty) {
                //                           return 'Please enter your pet\'s weight';
                //                         }
                //                         double? weight = double.tryParse(value);
                //                         if (weight == null) {
                //                           return 'Please enter a valid number';
                //                         } else {
                //                           petController.updatePet(
                //                               weight: weight);
                //                           return null;
                //                         }
                //                       },
                //                     ),
                //                   )
                //                 ]),
                //           ),
                //         ],
                //       )
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     const Text(
                //       'What is your pet\'s breed?',
                //       style: TextStyle(
                //           fontSize: 18,
                //           color: Colors.black,
                //           fontWeight: FontWeight.bold),
                //     ),
                //     const Text('Breed',
                //         style: TextStyle(
                //             fontSize: 12,
                //             color: Color.fromARGB(255, 138, 138, 138),
                //             fontWeight: FontWeight.bold)),
                    // Container(
                    //   height: 70,
                    //   width: 400,
                    //   child: DropdownButtonFormField(
                    //     isDense: true,
                    //     value: selectedBreed,
                    //     items: catBreeds.map((String breed) {
                    //       return DropdownMenuItem(
                    //         value: breed,
                    //         child: Text(breed),
                    //       );
                    //     }).toList(),
                    //     onChanged: (value) {
                    //       selectedBreed = value;
                    //       petController.updatePet(breed: selectedBreed);
                    //     },
                    //     decoration: const InputDecoration(
                    //         border: OutlineInputBorder(),
                    //         filled: true,
                    //         fillColor: TColors.gray),
                    //   ),
                    // )
                //   ],
                // ),
                // SizedBox(
                //   width: double.maxFinite,
                //   height: 70,
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       const Text(
                //         'Any allergies?',
                //         style: TextStyle(
                //             fontSize: 18,
                //             color: Colors.black,
                //             fontWeight: FontWeight.bold),
                //       ),
                //       const Text('Allergies',
                //           style: TextStyle(
                //               fontSize: 12,
                //               color: Color.fromARGB(255, 138, 138, 138),
                //               fontWeight: FontWeight.bold)),
                //       SizedBox(
                //         height: 25,
                //         child: TextFormField(
                //           textAlignVertical: const TextAlignVertical(y: -0.5),
                //           decoration: const InputDecoration(
                //               border: OutlineInputBorder(),
                //               filled: true,
                //               fillColor: TColors.gray),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    bool isPassword = false,
    bool obscure = false,
    VoidCallback? toggleVisibility,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
    bool readOnly = false,
    VoidCallback? onTap,
    Widget? icon,
    Widget? prefix,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword && obscure,
      keyboardType: keyboardType,
      readOnly: readOnly,
      onTap: onTap,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: label,
        prefix: prefix,
        suffixIcon: icon ??
            (isPassword
                ? IconButton(
                    icon: Icon(
                      obscure ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: toggleVisibility,
                  )
                : null),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        errorStyle: const TextStyle(height: 0.8, fontSize: 12),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade700),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade700),
        ),
      ),
    );
  }
}
