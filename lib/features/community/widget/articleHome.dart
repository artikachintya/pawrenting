import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pawrentingreborn/features/community/screens/articleDetail.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class articleHome extends StatelessWidget {
  const articleHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => articleDetail()),
      child: Container(
      // color: Colors.red,
      margin: EdgeInsets.only(left: 10, right: 10, top: 10,),
      // padding: EdgeInsets.all(5),
      // height: 100,
      width: 350,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: AssetImage(TImages.article1), height: 75, fit: BoxFit.fill),
          SizedBox(width: 5,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('First-Year Kitten Vaccination Schedule Chart to Follow',
                
                style: TextStyle(
                  fontFamily: 'albertsans',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  
                ),),
                SizedBox(height: 5,),
               Text('By Pawrenting Teams', style: TextStyle(
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

