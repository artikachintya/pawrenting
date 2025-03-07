import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/mypets/controllers/AddPetController.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class addPet5 extends StatelessWidget {
  const addPet5({super.key});

  @override
  Widget build(BuildContext context) {
    final addPetController = Get.find<AddPetController>();

    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 32, vertical: 100), // Reduced vertical padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Let's add your pet's picture",
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20), // Added spacing
          Obx(
            () => SizedBox(
              height: 140,
              width: 140,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: Colors.white,
                  elevation: 3,
                  padding: EdgeInsets.zero, // Ensure no extra padding
                ),
                onPressed: () => addPetController.pickImage(),
                child: addPetController.imageFile.value == null
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          TImages.picIcon,
                          color: TColors.accent,
                          fit: BoxFit.contain,
                          height: 60,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox.expand(
                          // Ensures image fills button
                          child: Image.file(
                            addPetController.imageFile.value!,
                            fit: BoxFit.cover, // Ensures better aspect ratio
                          ),
                        ),
                      ),
              ),
            ),
          ),
          const SizedBox(height: 20), // Added spacing
        ],
      ),
    );
  }
}
