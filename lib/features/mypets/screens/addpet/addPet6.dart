import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/mypets/controllers/AddPetController.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class addPet6 extends StatelessWidget {
  addPet6({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AddPetController addPetController = Get.find();
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 32, end: 32, top: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            //  color: Colors.red.withAlpha(100),
            height: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  // color: Colors.red.withAlpha(100),
                  width: 250,
                  child: Text(
                    'Overview',
                    style: Theme.of(context).textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 295,
                  width: 340,
                  // color: Colors.amber,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 215,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.white)),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(18, 0, 18, 24),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(height: 60),
                              Container(
                                decoration: BoxDecoration(
                                    // color: Colors.red.withAlpha(100),
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Color(0xff9B9B9B)))),
                                height: 25,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 4),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Name',
                                        style: TextStyle(
                                          fontFamily: 'Alata',
                                          color: Color(0xaa575757),
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Text(
                                        addPetController.nameController.text,
                                        style: TextStyle(
                                            fontFamily: 'Alata',
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    // color: Colors.red.withAlpha(100),
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Color(0xff9B9B9B)))),
                                height: 25,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 4),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Type',
                                        style: TextStyle(
                                          fontFamily: 'Alata',
                                          color: Color(0xaa575757),
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Text(
                                        '${addPetController.type}, ${addPetController.breedController.value.text}',
                                        style: TextStyle(
                                            fontFamily: 'Alata',
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    // color: Colors.red.withAlpha(100),
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Color(0xff9B9B9B)))),
                                height: 25,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 4),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Gender',
                                        style: TextStyle(
                                          fontFamily: 'Alata',
                                          color: Color(0xaa575757),
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Text(
                                        addPetController.gender,
                                        style: TextStyle(
                                            fontFamily: 'Alata',
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    // color: Colors.red.withAlpha(100),
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Color(0xff9B9B9B)))),
                                height: 25,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 4),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Date of Birth',
                                        style: TextStyle(
                                          fontFamily: 'Alata',
                                          color: Color(0xaa575757),
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Text(
                                        addPetController.dobController.text,
                                        style: TextStyle(
                                            fontFamily: 'Alata',
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    // color: Colors.red.withAlpha(100),
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Color(0xff9B9B9B)))),
                                height: 25,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 4),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Height',
                                              style: TextStyle(
                                                fontFamily: 'Alata',
                                                color: Color(0xaa575757),
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            Text(
                                              '${addPetController.heightController.text} cm',
                                              style: TextStyle(
                                                  fontFamily: 'Alata',
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 75,
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Weight',
                                              style: TextStyle(
                                                fontFamily: 'Alata',
                                                color: Color(0xaa575757),
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            Text(
                                              '${addPetController.weightController.text} kg',
                                              style: TextStyle(
                                                  fontFamily: 'Alata',
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 235,
                        left: 170 - 66,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            width: 105,
                            height: 95,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                            child: Image(
                              image:
                                  FileImage(addPetController.imageFile.value!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
