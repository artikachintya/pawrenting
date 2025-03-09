import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/mypets/controllers/VaccineController.dart';
import 'package:pawrentingreborn/features/mypets/models/VaccineModel.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class VaccineStatus extends StatelessWidget {
  final VaccineModel vaccine;
  const VaccineStatus({super.key, required this.vaccine});

  @override
  Widget build(BuildContext context) {
    VaccineController vaccineController = Get.find();
    return Container(
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
                  Text(
                    'Taken',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Alata',
                        color: Color(0XFF555050)),
                  ),
                  ImageIcon(
                    AssetImage(TImages.check),
                    color: vaccine.status == 'Taken' ? TColors.accent : Colors.transparent,
                    size: 16,
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Not Taken',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Alata',
                        color: Color(0XFF555050)),
                  ),
                  ImageIcon(
                    AssetImage(TImages.check),
                    color: vaccine.status == 'Not Taken' ? Colors.transparent : TColors.accent,
                    size: 16,
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
