import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/community/models/thread_message.dart';
import 'package:pawrentingreborn/features/community/screens/threadDetail.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';


class Thread extends StatelessWidget {
  const Thread({
    super.key, required this.message, 
  });

  final ThreadMessage message;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(()=>threadDetail()),
      child: Container(
      width: 355,
      // height: 170,
      padding: const EdgeInsets.all(10),
    
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white.withOpacity(0.5),
        border: Border.all(color: Color(0xff8B68CC).withOpacity(0.6))
      ),

      child: 
        Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 73,
                height: 18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xff8B68CC).withOpacity(0.4),
                  ),
    
                child: Text('Lost Pet', style: TextStyle(fontFamily: 'albertsans', fontSize: 10,fontWeight: FontWeight.bold),),
                alignment: Alignment.center,
                  ),
          Text('2 days ago',style: TextStyle(fontSize: 12,color: Color(0xFF4E4E4E),fontFamily: 'alata')),
    
              
            ],
            
          ),
    
          SizedBox(height: 8,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                 borderRadius: BorderRadius.circular(10),
                  child: Container(
                  height: 107,
                  width: 91,
                  child: Image(image: AssetImage(TImages.comm), fit: BoxFit.fill,),
                          ),
                        ),
              Container(
                // color: Colors.red,
                width: 240,
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image(image: AssetImage(TImages.user), height: 25),
                        Text('@pecintakucing', style: TextStyle(fontFamily: 'Alata', fontSize: 13, color: Color(0xff4E4E4E)),)
                      ],
                    ),
                    Text('Tolongggg kucing saya\nkaburrrr, tolonggg sayaaa...', style: TextStyle(fontFamily:'albertsans', fontSize: 16, fontWeight: FontWeight.bold ),),
                    Text('Bagi teman-teman yang bisa menemukan\nkucing saya, tolong hubungi saya di no ...', style: TextStyle(fontFamily: 'alata', fontSize: 11, color: Color(0xff4E4E4E)),),
    
                    SizedBox(height: 4,),
                    Container(
                      // color: Colors.amber,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image(image: AssetImage(TImages.lopek), height: 20, ),
                            SizedBox(width: 7,),
                            Text('10', style: TextStyle(fontSize: 16, fontFamily: 'albertsans', color: Color(0xff4E4E4E)),),
                            SizedBox(width: 15,),
                            Image(image: AssetImage(TImages.cett), height: 20,),
                            SizedBox(width: 7,),
                            Text('5', style: TextStyle(fontSize: 16, fontFamily: 'albertsans', color: Color(0xff4E4E4E)),)
                          ],
                      ),
                      
                    )
                    
                  ]
                  
                ),
                
              )
            ],
            
          ),
         
          
        ]
        
      ),
    ),

    
    
    );
    
  }
}
