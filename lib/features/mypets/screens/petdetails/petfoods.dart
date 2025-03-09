import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/features/mypets/controllers/PetFoodController.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/petFoods/foodSection.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';

class PetFood extends StatelessWidget {
  const PetFood({super.key});

  @override
  Widget build(BuildContext context) {
    PetFoodController foodController = Get.put(PetFoodController());
    NavBarController controller = Get.find();
    NavigationController navcontroller = Get.find();
    return Scaffold(
      backgroundColor: TColors.primary,
      appBar: TAppBar2(
          title: TTexts.appBarFoodTitle, subtitle: TTexts.appBarFoodSub),
      floatingActionButton: Container(
        width: 90,
        child: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: TColors.gray,
                  title: Text('What did your pet eat?'),
                  content: Container(
                    width: double.maxFinite,
                    height: 180,
                    child: Column(
                      spacing: 5,
                      children: [
                        TextFormField(
                          controller: foodController.nameController,
                          decoration: InputDecoration(hintText: 'Food'),
                        ),
                        TextFormField(
                          controller: foodController.nameController,
                          decoration: InputDecoration(
                              suffixText: 'gr', hintText: 'Amount'),
                        ),
                        TextFormField(
                          controller: foodController.timeController,
                          readOnly: true,
                          onTap: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (pickedTime != null) {
                              foodController.timeController.text =
                                  pickedTime.format(context);
                            }
                          },
                          decoration: InputDecoration(hintText: 'Time'),
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
                          onTap: () => Navigator.of(context).pop(),
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
                  fontSize: 12, fontFamily: 'Alata', color: Colors.white)),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/login/wallpaper-login.png'))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Image(
                image: AssetImage(TImages.tipsFood),
                height: 190,
              )),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white),
                width: 120,
                height: 40,
                child: GestureDetector(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ImageIcon(AssetImage(TImages.calendar)),
                      SizedBox(width: 5),
                      Text(
                        'Today',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Alata',
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {}
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FoodSection()
            ],
          ),
        ),
      )),
      bottomNavigationBar:
          InsideNavBar(controller: controller, navcontroller: navcontroller),
    );
  }
}
