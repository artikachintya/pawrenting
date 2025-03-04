import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pawrentingreborn/features/mypets/controllers/AddPetController.dart';
import 'package:pawrentingreborn/features/mypets/screens/addpet/classes/breeds.dart';
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
    AddPetController addPetController = Get.find();
    String? selectedBreed =
        addPetController.type == 'Cat' ? catBreeds.first : dogBreeds.first;
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
                        controller: addPetController.dobController,
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
                            addPetController.dobController.text =
                                DateFormat('dd MMMM yyyy').format(pickedDate);
                            addPetController.dobController.value =
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
                                    controller:
                                        addPetController.weightController,
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
                                        addPetController.weightController.text =
                                            weight.toString();
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
                                    controller:
                                        addPetController.heightController,
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
                                        addPetController.heightController.text =
                                            height.toString();
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
                                items: addPetController.type == 'Cat'
                                    ? catBreeds.map((String breed) {
                                        return DropdownMenuItem(
                                          value: breed,
                                          child: Text(breed),
                                        );
                                      }).toList()
                                    : dogBreeds.map((String breed) {
                                        return DropdownMenuItem(
                                          value: breed,
                                          child: Text(breed),
                                        );
                                      }).toList(),
                                onChanged: (value) {
                                  selectedBreed = value;
                                  addPetController.breedController.text =
                                      selectedBreed!;
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
