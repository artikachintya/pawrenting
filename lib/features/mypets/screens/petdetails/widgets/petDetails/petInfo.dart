import 'package:flutter/material.dart';

class PetInfo extends StatelessWidget {
  const PetInfo({
    super.key, required this.value, required this.type, required this.color
  });

  final String value;
  final String type;
  final Color color;
  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 90,
      width: 105,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(type, 
            style: TextStyle(
                color: Color(0xff6A5E5E),
                fontSize: 18,
                fontWeight: FontWeight.normal,
                fontFamily: 'Alata'
              ),
            ),
            Text(value, 
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                fontFamily: 'Alata'
              ),
            ),
          ],
        ),
        ),
    );
  }
}