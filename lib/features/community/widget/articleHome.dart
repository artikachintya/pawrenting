import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pawrentingreborn/features/community/models/article_models.dart';
import 'package:pawrentingreborn/features/community/screens/article.dart';
import 'package:pawrentingreborn/features/community/screens/articleDetail.dart';

class articleHome extends StatelessWidget {
  final ArticleModels article;
  const articleHome({
    super.key, 
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => articleDetail(article: article,)),
      child: Container(
      // color: Colors.red,
      margin: EdgeInsets.only(left: 10, right: 10, top: 10,),
      // padding: EdgeInsets.all(5),
      // height: 100,
      width: 350,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: AssetImage(article.imageUrl), height: 75, width: 120, fit: BoxFit.fill),
          SizedBox(width: 5,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(article.title, style: TextStyle(
                  fontFamily: 'albertsans',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  
                ),),
                SizedBox(height: 5,),
               Text(article.subtitle, style: TextStyle(
                  fontFamily: 'alata',
                  fontSize: 14,
                  color: Color(0xff4E4E4E)
               ),)
              ],
            ),
          )
        ],
        
      )
      
    ),
    );
    
  }
}

