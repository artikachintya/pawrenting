import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/features/profile/widgets/profilePictandUsername.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';
import 'package:pawrentingreborn/navigationMenu.dart';

 
class PersonalData extends StatelessWidget {
  const PersonalData({super.key});
  
  @override
  Widget build(BuildContext context) {
    NavBarController controller = Get.find();
    NavigationController navcontroller = Get.find();
    return Scaffold(
      appBar: const TAppBar2(
        title: "Personal Data",
        subtitle: "Your Personal Information", 
      ),
      bottomNavigationBar: InsideNavBar(controller: controller, navcontroller: navcontroller),
      backgroundColor: TColors.primary,
      body: Container(
        width: 365, 
        height: 700, 
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        decoration: BoxDecoration(
          color: TColors.secondary,  
          borderRadius:BorderRadius.circular(15) //ini gtw knp ga muncul di screen 
        ),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Profilepictandusername(
                  profilePicture: TImages.userProfilePic, 
                ), 
                 Positioned( //circle for edit icon bg 
                  top: 122,
                  left: 85,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: TColors.accent,
                      shape: BoxShape.circle, 
                    ),
                  ),
                ),
                Positioned( //edit icon 
                  top: 124,
                  left: 87,
                  child: Image.asset(
                    TImages.editIcon, 
                    height: 26,
                    width: 26,
                  ),                    
                ),
              ],
            ), 
            Form(
              child: Padding(
                padding: EdgeInsets.only(right: 250, top: 15, bottom: 10),
                child:  Text(
                  "First Name",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: "Alata",
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ), 
              ),

              // TextFormField(
              //   key: ,
              //   decoration: InputDecoration(
              //     hintText: "Kelompok 5 AYE",
              //     hintStyle: TextStyle(
              //       fontFamily: "Alata",
              //       fontSize: 14,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.black,
              //     ),
              //   ),
              // ),

            ),
            
          ],
        ),
      ),
    );
  }

  
} 