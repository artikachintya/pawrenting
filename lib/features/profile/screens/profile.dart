import 'package:flutter/material.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: TColors.primary,
        child: Column(
          children: [
            const TAppBar(onMain: true, onPetDetails: false),
            Stack(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  margin: const EdgeInsets.fromLTRB(0, 45, 0, 10),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: TColors.gray,
                  ),
                ),
                Positioned(
                  top: 30, 
                  right: 1,
                  left: 1,
                  child: Image.asset(
                    TImages.userProfilePic,
                    width: 150,
                    height: 150,
                  ),
                ),
              ],
            ),

            const Center(
              child: Text(
                'Kim Kardashian',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Albert Sans',
                  fontWeight: FontWeight.bold
                )
              ),
            ),

            const Center(
              child: Text(
                '@kimdash',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Albert Sans',
                  fontWeight: FontWeight.bold, 
                  color: TColors.grayFont
                )
              ),
            ),

            Container(
              margin: const EdgeInsets.only(top: 20),
              width: 365, 
              height: 455,
              decoration: BoxDecoration(
                color: TColors.gray,  
                borderRadius:BorderRadius.circular(15) //ini gtw knp ga muncul di screen 
              ),

              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 250, top: 15, bottom: 10),
                    child: Text(
                      "Your account", 
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Albert Sans',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Image.asset(
                          TImages.personalDataIcon,
                          width: 19,
                          height: 19,
                          matchTextDirection: true,
                       ),
                      ),

                      Container(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                        "Personal Data", 
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Alata',
                            fontWeight: FontWeight.bold, 
                            color: TColors.grayFont
                          ),
                        )
                        
                      )
                     
                    ],
                  ), 
                ],


              ),
            ),

          ] 
        ), 
      ),    
    );
  }
}
