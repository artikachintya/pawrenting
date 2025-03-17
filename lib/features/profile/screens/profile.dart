import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/data/repositories/UserRepo.dart';
import 'package:pawrentingreborn/features/authentication/screens/landingPage.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/features/profile/controllers/editDataController.dart';
import 'package:pawrentingreborn/features/profile/screens/faqPage.dart';
import 'package:pawrentingreborn/features/profile/screens/listOrderPage.dart';
import 'package:pawrentingreborn/features/profile/screens/location.dart';
import 'package:pawrentingreborn/features/profile/screens/personalData.dart';
import 'package:pawrentingreborn/features/profile/screens/privacyPolicy.dart';
import 'package:pawrentingreborn/features/profile/screens/termAndCondition.dart';
import 'package:pawrentingreborn/features/profile/screens/voucher.dart';
import 'package:pawrentingreborn/features/profile/widgets/profileOption.dart';
import 'package:pawrentingreborn/features/profile/widgets/profilePictandUsername.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final UserRepo userRepo = UserRepo();

  NavBarController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    final editDataController = Get.put(EditDataController());
    Future.delayed(Duration.zero, () => editDataController.fetchUserData());

    return Scaffold(
      bottomNavigationBar: InsideNavBar(),
      // background and App Bar
      appBar: const TAppBar(onMain: true, onPetDetails: false),
      backgroundColor: TColors.primary,
      body: GetBuilder<EditDataController>(
        // future: userRepo.fetchUserByEmail(FirebaseAuth.instance.currentUser!.email!),
        builder: (editDataController) {
          // if (snapshot.connectionState == ConnectionState.waiting) {
          //   return Center(child: CircularProgressIndicator());
          // }

          // if (snapshot.hasError) {
          //   return Center(child: Text('Error: ${snapshot.error}'));
          // }
          // final userData = snapshot.data!;
          // final String name = userData.firstName;
          // final String username = userData.username;
          return SingleChildScrollView(
            child: Column(children: [
              //profile account section
              //box for the profile option
              Profilepictandusername(
                  profilePicture: MemoryImage(
                      base64Decode(editDataController.profilePic ?? "")),
                  name: editDataController.firstNameController.text,
                  username: editDataController.usernameController.text),

              //box for the profile option
              Column(
                children: [
                  Text('PawPay',
                      style: TextStyle(
                          color: TColors.accent,
                          fontSize: 14,
                          fontFamily: 'Alata',
                          fontWeight: FontWeight.bold)),
                  Text(
                      'Rp${editDataController.pawpay.value.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Albert Sans',
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 30),
                width: 365,
                height: 500,
                decoration: BoxDecoration(
                    color: TColors.gray,
                    borderRadius: BorderRadius.circular(
                        15) //ini gtw knp ga muncul di screen
                    ),
                child: Column(
                  children: [
                    //profile section 1
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
                    // section 1.1
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PersonalData(formGlobalKey: _formKey)));
                      },
                      child: ProfileOption(
                        text: "Personal Data",
                        imagePath: TImages.personalDataIcon,
                      ),
                    ),
                    //section 1.2
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Location()));
                      },
                      child: ProfileOption(
                        text: "Location",
                        imagePath: TImages.locationIcon,
                      ),
                    ),

                    //section 1.3
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListOrderPage()));
                      },
                      child: ProfileOption(
                        text: "My Order",
                        imagePath: TImages.shippingIcon,
                      ),
                    ),
                    //section 1.4
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Voucher()));
                      },
                      child: ProfileOption(
                        text: "My Voucher",
                        imagePath: TImages.voucherIcon,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(right: 190, top: 15, bottom: 10),
                      child: Text(
                        "More info and support",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Albert Sans',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => FAQPage()));
                      },
                      child: ProfileOption(
                        text: "FAQ",
                        imagePath: TImages.faqIcon,
                      ),
                    ),

                    // section 2.2
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TermsAndConditions()));
                      },
                      child: ProfileOption(
                        text: "Terms and Conditions",
                        imagePath: TImages.termsIcon,
                      ),
                    ),

                    // section 2.3
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PrivacyPolicyPage()));
                      },
                      child: ProfileOption(
                        text: "Privacy Policy",
                        imagePath: TImages.privacyIcon,
                      ),
                    ),
                    //Section 3
                    Padding(
                      padding: EdgeInsets.only(right: 260, top: 15, bottom: 10),
                      child: Text(
                        "Contact us",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Albert Sans',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    ProfileOption(
                      text: "+6281234356789",
                      imagePath: TImages.phoneIcon,
                    ),
                    // section 3.2
                    ProfileOption(
                      text: "pawrenting@gmail.com",
                      imagePath: TImages.emailIcon,
                    ),
                    //section 3.3
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Image.asset(
                            TImages.logoutIcon,
                            width: 19,
                            height: 19,
                            matchTextDirection: true,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _showSignOutConfirmation();
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              'Logout',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Alata',
                                fontWeight: FontWeight.bold,
                                color: TColors
                                    .redLogout, // Assuming TColors.grayFont is a gray color
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: TColors.redLogout,
                      thickness: 1.5,
                      indent: 40,
                      endIndent: 20,
                    ),
                  ],
                ),
              ),
            ]),
          );
        },
        //   // Extract data safely
      ),
    );
  }
}

void _showSignOutConfirmation() {
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Confirm Sign Out",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Are you sure you want to sign out?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Get.back(); // Close dialog
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                        color: Colors.redAccent, fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Get.offAll(() => Landingpage());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: TColors.accent,
                  ),
                  child: const Text(
                    "Sign Out",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
