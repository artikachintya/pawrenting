import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pawrentingreborn/features/mypets/models/DiaryModel.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/size.dart';

class DiaryCard extends StatelessWidget {
  final DiaryModel diary;
  const DiaryCard({super.key, required this.diary});

  @override
  Widget build(BuildContext context) {
    Uint8List? imageBytes;
    try {
      imageBytes = base64Decode(diary.image);
    } catch (e) {
      debugPrint("Error decoding image: $e");
    }
    return Container(
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSize.cardRadius),
        color: Colors.white,
        border: Border.all(color: TColors.accent),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              diary.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Added at ${DateFormat('HH.mm a').format(diary.time)}',
              style: TextStyle(
                  fontFamily: 'Alata',
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: TColors.grayFont),
            ),
            SizedBox(
              height: TSize.verticalSpacing,
            ),
            Container(
              height: 150,
              child: imageBytes != null
                  ? Image.memory(imageBytes, fit: BoxFit.fill)
                  : const Icon(Icons.image_not_supported),
            ),
            SizedBox(
              height: TSize.verticalSpacing,
            ),
            Text(
              diary.content,
              style: TextStyle(
                fontFamily: 'Alata',
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
      ),
    );
  }
}
