import 'package:flutter/material.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';

class ProfileOption extends StatelessWidget {
  final String text;
  final String imagePath;

  ProfileOption({Key? key, required this.text, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Image.asset(
                imagePath,
                width: 19,
                height: 19,
                matchTextDirection: true,
                color: TColors.grayFont,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Alata',
                  fontWeight: FontWeight.bold,
                  color: TColors.grayFont, 

                ),
              ),
            ),
          ],
        ),
        Divider(
          color: Color.fromARGB(158, 170, 166, 166),
          thickness: 1.5,
          indent: 40,
          endIndent: 20,
        ),
      ],
    );
  }
}
