import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/features/profile/controllers/editLocationController.dart';
import 'package:pawrentingreborn/features/profile/models/LocationModel.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';
import 'package:pawrentingreborn/navigationMenu.dart';

class EditLocationDetail extends StatelessWidget {
  final EditLocationController editLocationController =
      Get.find<EditLocationController>();

  final int index;
  final GlobalKey<FormState> formGlobalKey;

  EditLocationDetail(
      {super.key, required this.index, required this.formGlobalKey});

  @override
  Widget build(BuildContext context) {
    NavBarController controller = Get.find();

    if (index >= editLocationController.userLocations.length) {
      return Center(child: Text("Invalid location index"));
    }
    var location = editLocationController.userLocations[index];

    // 🔹 Update controllers sesuai lokasi yang diedit
    editLocationController.labelController.text = location.label;
    editLocationController.receiverNameController.text = location.receiverName;
    editLocationController.phoneNumberController.text = location.phoneNum;
    editLocationController.fullAddressController.text = location.fullAddress;

    return Scaffold(
      appBar: const TAppBar2(
        title: "Edit Location",
        subtitle: "Enter your address details",
      ),
      bottomNavigationBar: InsideNavBar(),
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            width: 370,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: TColors.secondary,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Form(
              key: formGlobalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTextField("Label", location.label,
                      editLocationController.labelController),
                  buildTextField("Receiver's Name", location.receiverName,
                      editLocationController.receiverNameController),
                  buildPhoneNumberField(location.phoneNum),
                  buildTextField("Full Address", location.fullAddress,
                      editLocationController.fullAddressController,
                      maxLines: 3),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Get.back(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text("Cancel"),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            LocationModel updatedLocation = LocationModel(
                              label:
                                  editLocationController.labelController.text,
                              receiverName: editLocationController
                                  .receiverNameController.text,
                              phoneNum: editLocationController
                                  .phoneNumberController.text,
                              fullAddress: editLocationController
                                  .fullAddressController.text,
                            );
                            editLocationController.updateLocation(
                                index, updatedLocation);
                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: TColors.accent,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text("Save"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String label, String hintText, TextEditingController controller,
      {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 14, color: TColors.grayFont),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget buildPhoneNumberField(String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Phone Number",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Container(
              width: 60,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: const Center(
                child: Text(
                  "+62",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                controller: editLocationController.phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(fontSize: 14, color: TColors.grayFont),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
