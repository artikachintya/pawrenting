// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pawrentingreborn/features/mypets/controllers/VaccineController.dart';
import 'package:pawrentingreborn/features/mypets/models/PetModel.dart';
import 'package:pawrentingreborn/features/mypets/models/VaccineModel.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class VaccineStatus extends StatelessWidget {
  final VaccineModel vaccine;
  const VaccineStatus({
    Key? key,
    required this.vaccine,
    required this.pet,
  }) : super(key: key);
  final PetModel pet;

  @override
  Widget build(BuildContext context) {
    VaccineController vaccineController = Get.find();
    return Obx(() => Container(
        width: 350,
        height: 120,
        decoration: BoxDecoration(
            color: TColors.gray,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: TColors.accent, width: 0.5)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Status',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () =>
                        vaccineController.updateVaccine(pet.id, vaccine.id),
                    child: Text(
                      'Taken',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Alata',
                          color: Color(0XFF555050)),
                    ),
                  ),
                  ImageIcon(
                    AssetImage(TImages.check),
                    color: vaccineController.petVaccines
                                .where((vac) => vac.id == vaccine.id)
                                .first
                                .status ==
                            'Taken'
                        ? TColors.accent
                        : Colors.transparent,
                    size: 16,
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () =>
                        vaccineController.updateVaccine(pet.id, vaccine.id),
                    child: Text(
                      'Not Taken',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Alata',
                          color: Color(0XFF555050)),
                    ),
                  ),
                  ImageIcon(
                    AssetImage(TImages.check),
                    color: vaccineController.petVaccines
                                .where((vac) => vac.id == vaccine.id)
                                .first
                                .status ==
                            'Taken'
                        ? Colors.transparent
                        : TColors.accent,
                    size: 16,
                  ),
                ],
              ),
            ],
          ),
        )));
  }
}
