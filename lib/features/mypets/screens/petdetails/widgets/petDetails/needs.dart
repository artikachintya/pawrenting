
import 'package:flutter/material.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class Needs extends StatelessWidget {
  const Needs({
    super.key, required this.icon, required this.needs
  });
  final String icon;
  final String needs;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(icon, height: 55, width: 55),
                SizedBox(width: 15,),
                Text(needs, style: TextStyle(fontFamily: 'Alata', fontSize: 18),)
              ],
            ),
            ImageIcon(AssetImage(TImages.arrowForwardIcon), size: 16,)
          ]
        ),
      ),
    );
  }
}
