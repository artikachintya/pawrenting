import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/features/home/controllers/LocationController.dart';
import 'package:pawrentingreborn/features/home/screens/widgets/AddressCard2.dart';
import 'package:pawrentingreborn/features/profile/controllers/editLocationController.dart';
import 'package:pawrentingreborn/features/profile/screens/AddLocationDetail.dart';
import 'package:pawrentingreborn/features/profile/widgets/addressCard.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class ChooseAddress extends StatelessWidget {
  const ChooseAddress({super.key});

  @override
  Widget build(BuildContext context) {
    LocationController locationController = Get.find();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Get.to(() => AddLocationDetail());
          if (result == false) {
            print('anjay');
            locationController
                .fetchLocations(); // 🔄 Refresh the list after returning
          }
        },
        backgroundColor: TColors.accent,
        foregroundColor: Colors.white,
        child: const Text(
          '+ Add',
          style: TextStyle(
            fontFamily: 'Alata',
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              margin: EdgeInsets.only(bottom: 15),
              width: 240,
              height: 50,
              decoration: BoxDecoration(
                  color: TColors.accent,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  'Confirm',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: TColors.primary,
      appBar:
          TAppBar2(title: 'Choose Address', subtitle: 'Make sure it\'s right!'),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(TImages.paws), fit: BoxFit.cover)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 13),
                child: Text(
                  'Address',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Obx(() => locationController.locationsList.isEmpty
                  ? Center(child: Text("No addresses added."))
                  : ListView.separated(
                      shrinkWrap: true,
                      physics:
                          NeverScrollableScrollPhysics(), // Prevents nested scrolling
                      itemBuilder: (context, index) {
                        return AddressCard2(
                          location: locationController.locationsList[index],
                          index: index,
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10),
                      itemCount: locationController.locationsList.length,
                    )),
            ],
          ),
        ),
      ),
    );
  }
}
