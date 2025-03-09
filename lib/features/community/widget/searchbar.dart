import 'package:flutter/material.dart';

class searchbar extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const searchbar({
    super.key,
    required this.title,
    required this.controller,
    required this.onChanged,
  });

  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 55,
      decoration: BoxDecoration(
        color: Color(0xFFF8F6FD),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Icon(Icons.search),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: controller,
                onChanged: onChanged,
                decoration: InputDecoration(
                  hintText: title,
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    fontFamily: 'alata',
                    fontSize: 16,
                    color: Color(0xff9B9BA0),
                  ),
                ),
                style: TextStyle(
                  fontFamily: 'alata',
                  fontSize: 16,
                  color: Color(0xff9B9BA0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}