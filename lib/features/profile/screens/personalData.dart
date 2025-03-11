import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/editPet/editPetController.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/features/profile/controllers/editDataController.dart';
import 'package:pawrentingreborn/features/profile/screens/profile.dart';
import 'package:pawrentingreborn/features/profile/widgets/profilePictandUsername.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';
import 'package:image_picker/image_picker.dart';

class PersonalData extends StatelessWidget {
  final GlobalKey<FormState> formGlobalKey;

  const PersonalData({
    super.key,
    required this.formGlobalKey,
  });

  @override
  Widget build(BuildContext context) {
    final editDataController = Get.put(EditDataController());
    NavBarController controller = Get.find();

    // Ensure data is fetched after the widget is built
    Future.delayed(Duration.zero, () => editDataController.fetchUserData());
    return Scaffold(
      appBar: const TAppBar2(
        title: "Personal Data",
        subtitle: "Your Personal Information",
      ),
      bottomNavigationBar: InsideNavBar(),
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 370,
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: TColors.secondary,
              borderRadius: BorderRadius.circular(15),
            ),
            child: GetBuilder<EditDataController>(
              builder: (controller) {
                return Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Profilepictandusername(
                          profilePicture: MemoryImage(base64Decode(
                              editDataController.profilePic ?? "")),
                        ),
                        Positioned(
                          top: 122,
                          left: 85,
                          child: GestureDetector(
                            onTap: editDataController.updateProfilePicture,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: TColors.accent,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Image.asset(
                                  TImages.editIcon,
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Form(
                      key: formGlobalKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildTextField(
                              "First Name", controller.firstNameController),
                          buildTextField(
                              "Last Name", controller.lastNameController),
                          buildTextField(
                              "Username", controller.usernameController),
                          buildTextField(
                              "Date Of Birth", controller.dobController,
                              suffixIcon: Icons.calendar_today),
                          buildTextField(
                              "Phone Number", controller.phonenumController,
                              prefixText: "+62 "),
                          buildTextField("Email", controller.emailController,
                              enabled: false), // Email should not be editable
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
                                    controller.updateUserData();
                                    controller.update();
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
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller,
      {String? prefixText, IconData? suffixIcon, bool enabled = true}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: "Alata",
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          TextFormField(
            controller: controller,
            enabled: enabled,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixText: prefixText,
              suffixIcon: suffixIcon != null
                  ? Icon(suffixIcon, color: Colors.grey)
                  : null,
            ),
          ),
        ],
      ),
    );
  }

  void onProfileTapped() {}

  Future<Uint8List?> pickImage(ImageSource source) async {
    try {
      final ImagePicker _imagePicker = ImagePicker();
      XFile? profilePic = await _imagePicker.pickImage(source: source);
      if (profilePic != null) {
        return await profilePic.readAsBytes();
      }
    } catch (e) {
      print("Error picking image: $e");
    }
    return null; // Return null if no image was picked
  }
}
