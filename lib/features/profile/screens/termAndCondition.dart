import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/features/profile/widgets/profilePictandUsername.dart';
import 'package:pawrentingreborn/features/profile/widgets/voucherCard.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/utils/helpers/file_helper.dart';

class TermsAndConditions extends StatelessWidget {
  TermsAndConditions({super.key});
  
  Future<String> _loadTnC() async {
    return await FileHelper.loadTextFile('assets/text/TnC.txt');
  }
  
  @override
  Widget build(BuildContext context) {
    NavBarController controller = Get.find();
    NavigationController navcontroller = Get.find();
    return Scaffold(
      appBar: const TAppBar2(
        title: "Terms and Conditions",
        subtitle: "Please read carefully",
      ),
      bottomNavigationBar: InsideNavBar(controller: controller, navcontroller: navcontroller),
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 25),
            width: 370,
            height: 3100,
            decoration: BoxDecoration(
              color: TColors.secondary,
              borderRadius: BorderRadius.circular(20), 
            ),
            child: FutureBuilder<String>(
              future: _loadTnC(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error loading terms and conditions'));
                } else {
                  return Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 20), 
                        child: Text(
                          "Terms and Conditions", 
                          style: TextStyle(
                            fontFamily: "Albert Sans", 
                            fontSize: 24, 
                            color: const Color.fromARGB(255, 0, 0, 0), 
                            fontWeight: FontWeight.bold, 
                          ),
                        ),
                      ), 
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                        width: 350,
                        height: 3000,
                        child: Text(
                          snapshot.data ?? '', 
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontFamily: "Albert Sans", 
                            fontSize: 16, 
                            color: Colors.black, 
                          ),
                        ),
                      )
                    ],
                  );
                }
              },
            ),
          ), 
        )
      )
    ); 
  } 
}