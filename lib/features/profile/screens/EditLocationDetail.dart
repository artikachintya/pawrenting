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
  // Controller for managing edit location state
  final EditLocationController editLocationController =
      Get.find<EditLocationController>(); // ✅ Use existing instance

  final int index;
  final GlobalKey<FormState> formGlobalKey;

  EditLocationDetail(
      {super.key, required this.index, required this.formGlobalKey});

  @override
  Widget build(BuildContext context) {
    // Finding existing controllers for navigation
    NavBarController controller = Get.find();
    NavigationController navcontroller = Get.find();
    if (index >= editLocationController.userLocations.length) {
      return Center(child: Text("Invalid location index")); // ✅ Prevent crash
    }
    var location = editLocationController.userLocations[index];

    // Populate fields with existing data
    editLocationController.labelController.text = location.label;
    editLocationController.receiverNameController.text = location.receiverName;
    editLocationController.phoneNumberController.text = location.phoneNum;
    editLocationController.fullAddressController.text = location.fullAddress;

    return Scaffold(
      appBar: const TAppBar2(
        title: "Edit Location",
        subtitle: "Enter your address details",
      ),
      bottomNavigationBar:
          InsideNavBar(controller: controller, navcontroller: navcontroller),
      backgroundColor: TColors.primary,
      body: Center(
        child: Container(
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
                buildTextField("Label", "Mansion 1",
                    controller: editLocationController.labelController),
                buildTextField("Receiver’s Name", "Kardashian",
                    controller: editLocationController.receiverNameController),
                buildPhoneNumberField(),
                buildTextField("Full Address", "123 Street, 11x",
                    maxLines: 3,
                    controller: editLocationController.fullAddressController),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Get.back(), // Cancel button action
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
                            label: editLocationController.labelController.text,
                            receiverName: editLocationController
                                .receiverNameController.text,
                            phoneNum: editLocationController
                                .phoneNumberController.text,
                            fullAddress: editLocationController
                                .fullAddressController.text,
                          );

                          editLocationController.updateLocation(
                              index, updatedLocation); // Save action triggered
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
    );
  }

  // Generalized text field widget for form input
  Widget buildTextField(String label, String hint,
      {int maxLines = 1, TextEditingController? controller}) {
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
            hintText: hint,
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

  // Phone number field widget with predefined country code
  Widget buildPhoneNumberField() {
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
            // Country code box
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
            // Phone number input field
            Expanded(
              child: TextFormField(
                controller: editLocationController.phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "89123456789",
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
