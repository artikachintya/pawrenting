import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/features/profile/screens/AddLocationDetail.dart';
import 'package:pawrentingreborn/features/profile/widgets/addressCard.dart';
import 'package:pawrentingreborn/features/profile/widgets/profilePictandUsername.dart';
import 'package:pawrentingreborn/features/profile/widgets/voucherCard.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';

class Location extends StatelessWidget {
  Location({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    NavBarController controller = Get.find();
    NavigationController navcontroller = Get.find();
    return Scaffold(
      appBar: const TAppBar2(
        title: "Locations",
        subtitle: "Where your packages find you!",
      ),
      bottomNavigationBar:
          InsideNavBar(controller: controller, navcontroller: navcontroller),
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
          child: Column(
        children: [
          GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            itemCount: 4,
            shrinkWrap: true,
            // padding: const EdgeInsets.all(20),
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 12, // Space between row
                mainAxisExtent: 120),
            itemBuilder: (BuildContext context, int index) {
              return AddressCard(
                  labelAddress: "Mansion 1",
                  receiverName: "Kelompok 5 AYE",
                  addressDetail: "Jl. Pakuan No 1",
                  phoneNumber: "081234567890");
            },
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AddLocationDetail(),
                    ),
                  );
                },
                backgroundColor: Color(0xff4749AE),
                child: Text(
                  '+ Add',
                  style: TextStyle(
                    fontFamily: 'Alata',
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
