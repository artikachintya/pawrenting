import 'package:flutter/material.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/features/community/widget/chooseTopic.dart';
import 'package:pawrentingreborn/features/community/widget/selectedSpecies.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';

class Addthreads extends StatelessWidget {
  const Addthreads ({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: TAppBar2(title: TTexts.appBarAddThreadTitle, subtitle: TTexts.appBarAddThreadSub,),
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            children: [  
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Add Picture',style: TextStyle(fontFamily: 'albertsans', fontSize: 18, fontWeight: FontWeight.bold),),
                  ]
                ),
              ),

              Container(
                width: 180, 
                height: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffF8F6FD),
                  border: Border.all(color: Color(0xff8B68CC).withOpacity(0.6))
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Image(image: AssetImage(TImages.Plus),height: 60,),
                  ],
                )
              ),

              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Topic', style: TextStyle(fontFamily: 'albertsans', fontSize: 16, fontWeight: FontWeight.bold),),
                        Text('sfbhdfugvs'),
                        Text('whbfw'),
                        // SpeciesSelection()
                      ]
                      
                      
                    )
                  ],
                )
                
              ),

                    
            ],


          
          ),

          
        ),
      ) 
            
    );
  }
}

