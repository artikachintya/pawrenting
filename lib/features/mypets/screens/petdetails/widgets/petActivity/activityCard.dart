// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key, required this.name, required this.time, required this.location});

  final String name;
  final String location;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 350,
      decoration: BoxDecoration(
        color: TColors.gray,
        border: Border.all(
          color: TColors.accent
        ),
        borderRadius: BorderRadius.circular(10)        
      ),
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
                  name,
                  style: TextStyle(
                    height: 1,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  time,
                    style: TextStyle(
                    height: 1,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff797272)
                  ),
                ),
                Text(
                  location,
                    style: TextStyle(
                    height: 1,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff797272)
                  ),
                ),
            ],
            )
          ]
        ),
      )
    );
  
  }
}