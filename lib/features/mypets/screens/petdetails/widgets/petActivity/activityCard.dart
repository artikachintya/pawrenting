// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pawrentingreborn/features/mypets/models/ActivityModel.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class ActivityCard extends StatelessWidget {
  final ActivityModel activity;
  const ActivityCard({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: 350,
        decoration: BoxDecoration(
            color: TColors.gray,
            border: Border.all(color: TColors.accent),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity.title,
                  style: TextStyle(
                      height: 1, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  DateFormat('d MMMM yyyy').format(activity.date),
                  style: TextStyle(
                      height: 1,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Color(0xff797272)),
                ),
                Text(
                  activity.location,
                  style: TextStyle(
                      height: 1,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Color(0xff797272)),
                ),
              ],
            )
          ]),
        ));
  }
}
