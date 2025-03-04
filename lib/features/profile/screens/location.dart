import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/features/profile/controllers/editLocationController.dart';
import 'package:pawrentingreborn/features/profile/models/LocationModel.dart';
import 'package:pawrentingreborn/features/profile/screens/AddLocationDetail.dart';
import 'package:pawrentingreborn/features/profile/screens/EditLocationDetail.dart';
import 'package:pawrentingreborn/features/profile/widgets/addressCard.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';

class Location extends StatelessWidget {
  Location({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final EditLocationController editLocationController =
      Get.put(EditLocationController());

  @override
  Widget build(BuildContext context) {
    NavBarController controller = Get.find();
    NavigationController navcontroller = Get.find();

    // 🔹 Fetch locations when widget is built
    Future.delayed(Duration.zero, () => editLocationController.fetchUserLocations());

    return Scaffold(
      appBar: const TAppBar2(
        title: "Locations",
        subtitle: "Where your packages find you!",
      ),
      bottomNavigationBar:
          InsideNavBar(controller: controller, navcontroller: navcontroller),
      backgroundColor: TColors.primary,
      body: Obx(() {
        if (editLocationController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        print("🔹 Number of locations: ${editLocationController.userLocations.length}");

        if (editLocationController.userLocations.isEmpty) {
          return Column(
            children: [
              Center(
                child: Text("No locations found!")            
              ),
              FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddLocationDetail(),
                        ),
                      );
                    },
                    backgroundColor: const Color(0xff4749AE),
                    child: const Text(
                      '+ Add',
                      style: TextStyle(
                        fontFamily: 'Alata',
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
            ],
          );
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              GridView.builder(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                itemCount: editLocationController.userLocations.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 12,
                  mainAxisExtent: 120,
                ),
                itemBuilder: (BuildContext context, int index) {
                  LocationModel location =
                      editLocationController.userLocations[index];

                  print("📍 Location: ${location.label}");

                  return GestureDetector(
                    onTap: () {
                      Get.to(() => EditLocationDetail(
                            index: index,
                            formGlobalKey: _formKey,
                          ));
                    },
                    child: AddressCard(
                      labelAddress: location.label,
                      receiverName: location.receiverName,
                      addressDetail: location.fullAddress,
                      phoneNumber: location.phoneNum,
                    ),
                  );
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
                          builder: (context) => AddLocationDetail(),
                        ),
                      );
                    },
                    backgroundColor: const Color(0xff4749AE),
                    child: const Text(
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
          ),
        );
      }),
    );
  }
}
