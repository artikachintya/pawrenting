import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/editPet/editPetController.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/features/mypets/screens/addpet/classes/breeds.dart';
import 'package:pawrentingreborn/features/mypets/screens/editpet/widgets/genderSelector.dart';
import 'package:pawrentingreborn/features/mypets/screens/editpet/widgets/speciesSelector.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/size.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';

class EditPet extends StatelessWidget {
  const EditPet({super.key});

  @override
  Widget build(BuildContext context) {
    EditPetController editPetController = Get.put(EditPetController());
    NavBarController controller = Get.find();
    NavigationController navcontroller = Get.find();
    String? selectedBreed = catBreeds.first;
    return Scaffold(
      backgroundColor: TColors.primary,
      appBar:
          TAppBar2(title: 'Edit Pet', subtitle: 'Edit your pet\'s information'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: Stack(clipBehavior: Clip.none, children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(
                    image: AssetImage(TImages.whiskey),
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: -20,
                  left: 50,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: TColors.accent,
                        borderRadius: BorderRadius.circular(50)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ImageIcon(
                        AssetImage(TImages.picIcon),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: TSize.verticalSpacing,
            ),
            Text('Overview',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Albert Sans',
                    fontWeight: FontWeight.w400)),
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.5),
              ),
            ),
            Text('Name',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Albert Sans',
                    fontWeight: FontWeight.w400)),
            FormField(
              controller: editPetController.nameController,
              height: 60,
              vertPad: 12,
            ),
            Text('Species',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Albert Sans',
                    fontWeight: FontWeight.w400)),
            SpeciesSelector(),
            Text('Gender',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Albert Sans',
                    fontWeight: FontWeight.w400)),
            GenderSelector(),
            Text('Breeds',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Albert Sans',
                    fontWeight: FontWeight.w400)),
            DropdownButtonFormField(
              isDense: true,
              value: selectedBreed,
              items: catBreeds.map((String breed) {
                return DropdownMenuItem(
                  value: breed,
                  child: Text(breed),
                );
              }).toList(),
              onChanged: (value) {
                selectedBreed = value;
                editPetController.breedController.text = selectedBreed!;
              },
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    borderSide: BorderSide(color: TColors.accent),
                  ),
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 8), // Adjust the vertical padding here
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  filled: true,
                  fillColor: TColors.gray),
            ),
            Text('Date of Birth',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Albert Sans',
                    fontWeight: FontWeight.w400)),
            TextFormField(
              controller: editPetController.birthdateController,
              readOnly: true,
              decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 8), // Adjust the vertical padding here
                  prefixIcon: Icon(
                    Icons.calendar_month,
                    size: 18,
                  ),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: TColors.gray),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  editPetController.birthdateController.text =
                      DateFormat('dd MMMM yyyy').format(pickedDate);
                  editPetController.birthdateController.value = TextEditingValue(
                      text: DateFormat('dd MMMM yyyy').format(pickedDate));
                }
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your pet\'s date of birth';
                } else {
                  return null;
                }
              },
            ),
          ]),
        ),
      ),
      bottomNavigationBar:
          InsideNavBar(controller: controller, navcontroller: navcontroller),
    );
  }
}

class FormField extends StatelessWidget {
  const FormField({
    super.key,
    required this.controller,
    required this.height,
    required this.vertPad,
  });

  final TextEditingController controller;
  final dynamic height;
  final dynamic vertPad;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: TextFormField(
        controller: controller,
        decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              borderSide: BorderSide(color: TColors.accent),
            ),
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 8), // Adjust the vertical padding here
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            filled: true,
            fillColor: TColors.gray),
        validator: (value) {},
      ),
    );
  }
}
