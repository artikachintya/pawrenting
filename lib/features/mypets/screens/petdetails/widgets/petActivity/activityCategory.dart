
import 'package:flutter/material.dart';

class ActivityCategory extends StatelessWidget {
  final dynamic category;
  final dynamic selected;

  const ActivityCategory({
    super.key, required this.category, required this.selected
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: selected? Color(0xFF21165A) : Color(0xFF766CAA),
      ),
      width: 100,
      height: 25,
      child: Center(
        child: Text(
          category,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            fontFamily: 'Alata',
            color: Colors.white
          ),
        ),
      ),
    );
  }
}