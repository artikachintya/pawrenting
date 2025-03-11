import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/ActivityController.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/features/mypets/models/ActivityModel.dart';
import 'package:pawrentingreborn/features/mypets/models/PetModel.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/petActivity/activityCategories.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/petActivity/activityCategory.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/petActivity/activitySection.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';
import 'package:popover/popover.dart';

class PetActivity extends StatelessWidget {
  final PetModel pet;
  const PetActivity({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuItem<String>> items = [
      DropdownMenuItem(value: 'Grooming', child: Text('Grooming')),
      DropdownMenuItem(value: 'Exercise', child: Text('Exercise')),
    ];

    NavBarController controller = Get.find();

    ActivityController activityController = Get.find();

    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/login/wallpaper-login.png"), // Replace with your wallpaper path
            fit: BoxFit.cover, // Ensures the image covers the entire screen
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButton: Container(
              width: 90,
              child: FloatingActionButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: TColors.gray,
                        title: Text('What did your pet do?'),
                        content: Container(
                          width: double.maxFinite,
                          height: 220,
                          child: Column(
                            spacing: 5,
                            children: [
                              DropdownButtonFormField(
                                hint: Text('Type'),
                                items: items,
                                onChanged: (value) => activityController
                                    .typeController.text = value!,
                              ),
                              TextFormField(
                                decoration: InputDecoration(hintText: 'Title'),
                                controller: activityController.titleController,
                                onChanged: (value) => activityController
                                    .titleController.text = value,
                              ),
                              TextFormField(
                                controller: activityController.timeController,
                                readOnly: true,
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101),
                                  );
                                  if (pickedDate != null) {
                                    activityController.timeController.text =
                                        DateFormat('dd MMMM yyyy')
                                            .format(pickedDate);
                                    activityController.timeController.value =
                                        TextEditingValue(
                                            text: DateFormat('dd MMMM yyyy')
                                                .format(pickedDate));
                                  }
                                },
                                decoration: InputDecoration(hintText: 'Time'),
                              ),
                              TextFormField(
                                controller: activityController.location,
                                onChanged: (value) =>
                                    activityController.location.text = value,
                                decoration:
                                    InputDecoration(hintText: 'Location'),
                              ),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                  activityController.resetControllers();
                                },
                                child: Container(
                                  width: 75,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Color(0xffAE4747),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  print(pet.id);
                                  activityController.addActivity(pet.id);

                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  width: 75,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: TColors.accent,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                    child: Text(
                                      'Add',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  );
                },
                backgroundColor: TColors.accent,
                foregroundColor: Colors.white,
                child: Text('+ Add',
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Alata',
                        color: Colors.white)),
              )),
          appBar: TAppBar2(
              title: TTexts.appBarActivitesTitle,
              subtitle: TTexts.appBarActivitesSub),
          bottomNavigationBar: InsideNavBar(),
          body: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                child: Column(children: [
                  Center(
                    child: Image(
                      image: AssetImage(TImages.tipsVaccine),
                      height: 190,
                    ),
                  ),
                  SizedBox(height: 20),
                  Obx(
                    () => ActivityCategories(
                      category: activityController.category.value,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ActivitySection(),
                ]),
              ),
            ),
          ),
        ));
  }
}
