// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pawrentingreborn/features/mypets/models/VaccineModel.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/vaccineDetails.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class VaccineList extends StatelessWidget {
  const VaccineList(
      {super.key, required this.vaccine});

  final VaccineModel vaccine;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => VaccineDetails(
            vaccine: vaccine
          )),
      child: Container(
        height: 100,
        width: 350,
        decoration: BoxDecoration(
            color: TColors.gray,
            border: Border.all(width: 0.5, color: TColors.accent),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      vaccine.name,
                      style: TextStyle(
                          height: 1, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    vaccine.status == 'Taken'
                        ? Text(
                            'Taken on: ' + DateFormat('dd MMMM yyyy').format(vaccine.date),
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Color(0xff797272)),
                          )
                        : Text(
                            'Not taken yet...',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Color(0xff797272)),
                          ),
                    vaccine.status == 'Taken'
                        ? Image(
                            image: AssetImage(TImages.taken),
                            height: 20,
                          )
                        : Image(
                            image: AssetImage(TImages.nottaken),
                            height: 20,
                          )
                  ],
                ),
                ImageIcon(
                  AssetImage(TImages.arrowForwardIcon),
                  size: 14,
                ),
              ],
            )),
      ),
    );
  }
}
