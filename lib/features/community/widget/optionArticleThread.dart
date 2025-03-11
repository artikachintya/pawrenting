import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pawrentingreborn/features/community/screens/article.dart';
import 'package:pawrentingreborn/features/community/screens/community.dart';
import 'package:pawrentingreborn/navigationMenu.dart';

class optionArticleThread extends StatelessWidget {
  final dynamic article;

  const optionArticleThread({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Get.to(() => Article());
          },
          child: Container(
            width: 150,
            height: 35,
            decoration: BoxDecoration(
                color: article ? Color(0xff21165A) : Color(0XFF766CAA),
                borderRadius: BorderRadius.all(Radius.circular(40))),
            alignment: Alignment.center,
            child: Text(
              'Article',
              style: TextStyle(
                  fontFamily: 'alata', fontSize: 16, color: Colors.white),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => Get.to(() => Community()),
          child: Container(
            width: 150,
            height: 35,
            decoration: BoxDecoration(
                color: !article ? Color(0xff21165A) : Color(0XFF766CAA),
                borderRadius: BorderRadius.all(Radius.circular(40))),
            alignment: Alignment.center,
            child: Text(
              'Thread',
              style: TextStyle(
                  fontFamily: 'alata', fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
