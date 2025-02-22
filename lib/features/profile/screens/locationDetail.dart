import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';
import 'package:pawrentingreborn/navigationMenu.dart';

class LocationDetail extends StatelessWidget {
  final GlobalKey<FormState> formGlobalKey;

  const LocationDetail({
    super.key,
    required this.formGlobalKey,
  });

  @override
  Widget build(BuildContext context) {
    NavBarController controller = Get.find();
    NavigationController navcontroller = Get.find();

    return Scaffold(
      appBar: const TAppBar2(
        title: "Edit/Add Address",
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
            borderRadius: BorderRadius.circular(15), // Adjusts the box rounding
          ),
          child: Form(
            key: formGlobalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTextField("Label", "Mansion 1"),
                buildTextField("Receiver’s Name", "Kardashian"),
                buildPhoneNumberField(),
                buildTextField("Full Address", "123 Street, 11x", maxLines: 3),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Cancel",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: TColors.accent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Save",
                        style: TextStyle(fontSize: 16, color: Colors.white),
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

  // Text field widget
  Widget buildTextField(String label, String hint, {int maxLines = 1}) {
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
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(fontSize: 14, color: TColors.grayFont),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10), // Adjust border rounding
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  // Phone number field with country code
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
