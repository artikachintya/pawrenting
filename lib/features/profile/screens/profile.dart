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
            TAppBar(onMain: true, onPetDetails: false),
            Stack(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  margin: EdgeInsets.fromLTRB(0, 45, 0, 10),
                  decoration: BoxDecoration(
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

            Center(
              child: Text(
                'Kim Kardashian',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Albert Sans',
                  fontWeight: FontWeight.bold
                )
              ),
            ),

            Center(
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

            

          ] 
        ), 
      ),    
    );
  }
}
